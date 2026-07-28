import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models.dart';
import 'championship_backup.dart';
import 'leaderboard_storage.dart';

enum ChampionshipRoundStatus { notStarted, inProgress, completed }

class Opponent {
  final String id;
  final String name;
  final int score;

  const Opponent({required this.id, required this.name, required this.score});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'score': score,
      };

  factory Opponent.fromJson(Map<String, dynamic> json) => Opponent(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        score: (json['score'] as num?)?.toInt() ?? 0,
      );
}

class Leaderboard {
  final List<Opponent> opponents;
  final DateTime generatedAt;

  Leaderboard({
    required List<Opponent> opponents,
    required DateTime generatedAt,
  })  : opponents = List<Opponent>.unmodifiable(opponents),
        generatedAt = generatedAt.toUtc();

  Map<String, dynamic> toJson() => {
        'generatedAt': generatedAt.toIso8601String(),
        'opponents': opponents.map((o) => o.toJson()).toList(),
      };
}

class ChampionshipRound {
  final Difficulty difficulty;
  ChampionshipRoundStatus status;
  DateTime? startedAt;
  DateTime? finishedAt;

  ChampionshipRound({
    required this.difficulty,
    this.status = ChampionshipRoundStatus.notStarted,
    this.startedAt,
    this.finishedAt,
  });

  Map<String, dynamic> toMap() => {
        'difficulty': difficulty.name,
        'status': status.name,
        'startedAt': startedAt?.toUtc().toIso8601String(),
        'finishedAt': finishedAt?.toUtc().toIso8601String(),
      };

  factory ChampionshipRound.fromMap(Map<String, dynamic> map) {
    final difficulty = _parseDifficulty(map['difficulty'] as String?);
    final status = _parseStatus(map['status'] as String?);
    return ChampionshipRound(
      difficulty: difficulty,
      status: status,
      startedAt: _parseDateTime(map['startedAt']),
      finishedAt: _parseDateTime(map['finishedAt']),
    );
  }

  static Difficulty _parseDifficulty(String? value) {
    if (value == null) {
      return Difficulty.novice;
    }
    return Difficulty.values.firstWhere(
      (element) => element.name == value,
      orElse: () => Difficulty.novice,
    );
  }

  static ChampionshipRoundStatus _parseStatus(String? value) {
    if (value == null) {
      return ChampionshipRoundStatus.notStarted;
    }
    return ChampionshipRoundStatus.values.firstWhere(
      (element) => element.name == value,
      orElse: () => ChampionshipRoundStatus.notStarted,
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value is String && value.isNotEmpty) {
      return DateTime.tryParse(value)?.toUtc();
    }
    return null;
  }
}

class ChampionshipState {
  String sessionId;
  final List<ChampionshipRound> rounds;

  ChampionshipState({
    required this.sessionId,
    required List<ChampionshipRound> rounds,
  }) : rounds = List<ChampionshipRound>.from(rounds);

  Map<String, dynamic> toMap() => {
        'sessionId': sessionId,
        'rounds': rounds.map((round) => round.toMap()).toList(),
      };

  factory ChampionshipState.fromMap(Map<String, dynamic> map) {
    final storedRounds = map['rounds'];
    final rounds = _createDefaultRounds();
    if (storedRounds is List) {
      final loadedByDifficulty = <Difficulty, ChampionshipRound>{};
      for (final entry in storedRounds) {
        if (entry is Map<String, dynamic>) {
          final round = ChampionshipRound.fromMap(entry);
          loadedByDifficulty[round.difficulty] = round;
        } else if (entry is Map) {
          final round = ChampionshipRound.fromMap(
            Map<String, dynamic>.from(entry as Map),
          );
          loadedByDifficulty[round.difficulty] = round;
        }
      }
      for (final round in rounds) {
        final loaded = loadedByDifficulty[round.difficulty];
        if (loaded != null) {
          round
            ..status = loaded.status
            ..startedAt = loaded.startedAt
            ..finishedAt = loaded.finishedAt;
        }
      }
    }

    return ChampionshipState(
      sessionId: map['sessionId'] as String? ?? _newSessionId(),
      rounds: rounds,
    );
  }
}

class NextProgressSnapshot {
  const NextProgressSnapshot({
    required this.isTop,
    required this.deltaToNext,
    required this.progress,
    required this.rank,
  });

  final bool isTop;
  final int deltaToNext;
  final double progress;
  final int rank;
}

enum ChampionshipLeaderboardStatus { idle, loading, ready, error }

class ChampionshipModel extends ChangeNotifier {
  ChampionshipModel()
      : _state = ChampionshipState(
          sessionId: _newSessionId(),
          rounds: _createDefaultRounds(),
        );

  static const _prefsKey = 'championship.session.v1';
  static const _myScoreKey = 'champ.perma.myScore.v1';
  static const _installSeedKey = 'champ.perma.installSeed.v1';
  static const _opponentsKey = 'champ.perma.opponents.v1';
  static const _autoScrollKey = 'champ.settings.autoScroll.v1';
  static const _lastAwardedGameIdKey = 'champ.perma.lastAwardedGameId.v1';
  static const _bestScoreKey = 'champ.perma.bestScore.v1';
  static const _bestRankKey = 'champ.perma.bestRank.v1';
  static const int _opponentsCount = 100;
  static const int _maxMyScore = 2000000000;
  static const int _leaderboardSchemaVersion = 1;

  static const int _winAward = 350;
  static const List<String> _fallbackNames = [
    'Alex',
    'Sam',
    'Lee',
    'Max',
    'Mia',
    'Noah',
  ];
  static List<String>? _cachedNames;

  final Future<SharedPreferences> _prefsFuture =
      SharedPreferences.getInstance();
  final ChampionshipLeaderboardStorage _leaderboardStorage =
      createLeaderboardStorage();

  ChampionshipLeaderboardStatus _leaderboardStatus =
      ChampionshipLeaderboardStatus.idle;
  Object? _leaderboardError;
  Future<void>? _leaderboardLoadFuture;
  bool _persistentStateLoaded = false;
  bool _preloadScheduled = false;
  bool _disposed = false;

  ChampionshipState _state;
  int _myScore = 0;
  int _bestScore = 0;
  int _bestRank = 1;
  bool _autoScrollEnabled = true;
  String? _lastAwardedGameId;
  int? _installSeed;
  Leaderboard _leaderboard = Leaderboard(
    opponents: const <Opponent>[],
    generatedAt: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
  );

  String get sessionId => _state.sessionId;

  List<ChampionshipRound> get rounds =>
      List<ChampionshipRound>.unmodifiable(_state.rounds);

  int get myScore => _myScore;

  int get bestScore => _bestScore;

  int get bestRank => _bestRank;

  Leaderboard get leaderboard => _leaderboard;

  ChampionshipLeaderboardStatus get leaderboardStatus => _leaderboardStatus;

  Object? get leaderboardError => _leaderboardError;

  bool get autoScrollEnabled => _autoScrollEnabled;

  ChampionshipLeaderboardStatus get status => _leaderboardStatus;

  Future<void> retry() => ensureLeaderboardLoaded(forceRefresh: true);

  bool get _isDisposed => _disposed;

  void _safeNotifyListeners() {
    if (_disposed) {
      return;
    }
    notifyListeners();
  }

  void _setLeaderboardStatus(
    ChampionshipLeaderboardStatus status, {
    Object? error,
    bool notify = true,
  }) {
    if (_disposed) {
      return;
    }
    _leaderboardStatus = status;
    _leaderboardError = error;
    if (notify) {
      _safeNotifyListeners();
    }
  }

  Future<bool> _tryPersist(
    String context,
    Future<void> Function() operation,
  ) async {
    try {
      await operation();
      return true;
    } catch (error, stackTrace) {
      debugPrint('$context: $error');
      debugPrint('$stackTrace');
      _setLeaderboardStatus(
        ChampionshipLeaderboardStatus.error,
        error: error,
      );
      return false;
    }
  }

  Difficulty get recommendedDifficulty {
    final opponents = _leaderboard.opponents;
    final totalParticipants = opponents.length + 1;
    final normalizedRank = myRank.clamp(1, totalParticipants);
    final denominator = math.max(1, totalParticipants - 1);
    final rankProgress =
        (totalParticipants - normalizedRank) / denominator;

    var topScore = _myScore;
    for (final opponent in opponents) {
      if (opponent.score > topScore) {
        topScore = opponent.score;
      }
    }
    topScore = math.max(topScore, 1);
    final scoreProgress = math.min(_myScore / topScore, 1.0);

    final combinedProgress = math.min(
      math.max((rankProgress + scoreProgress) / 2.0, 0.0),
      1.0,
    );

    return _difficultyForProgress(combinedProgress);
  }

  int get myRank {
    final opponents = _leaderboard.opponents;
    if (opponents.isEmpty) {
      return 1;
    }
    final index = _insertionIndex(opponents, _myScore);
    return index + 1;
  }

  NextProgressSnapshot nextProgress() {
    final opponents = _leaderboard.opponents;
    final currentScore = _myScore;
    final rank = myRank;
    if (rank <= 1 || opponents.isEmpty) {
      return const NextProgressSnapshot(
        isTop: true,
        deltaToNext: 0,
        progress: 1.0,
        rank: 1,
      );
    }

    final insertionIndex = (rank - 1).clamp(0, opponents.length);
    final targetIndex = (insertionIndex - 1).clamp(0, opponents.length - 1);
    final target = opponents[targetIndex];
    final targetScore = target.score;
    final delta = math.max(targetScore - currentScore, 0);

    int lowerScore;
    if (targetIndex + 1 < opponents.length) {
      lowerScore = opponents[targetIndex + 1].score;
    } else {
      lowerScore = currentScore;
    }
    var prevTargetFloor = (targetScore + lowerScore) / 2.0;
    if (prevTargetFloor >= targetScore) {
      prevTargetFloor = targetScore - 1;
    }
    final denominator = targetScore - prevTargetFloor;
    double progress;
    if (denominator <= 0) {
      progress = currentScore >= targetScore ? 1.0 : 0.0;
    } else {
      progress = (currentScore - prevTargetFloor) / denominator;
    }

    return NextProgressSnapshot(
      isTop: false,
      deltaToNext: delta,
      progress: progress.clamp(0.0, 1.0),
      rank: rank,
    );
  }

  int _insertionIndex(List<Opponent> opponents, int score) {
    var low = 0;
    var high = opponents.length;
    while (low < high) {
      final mid = low + ((high - low) >> 1);
      if (score >= opponents[mid].score) {
        high = mid;
      } else {
        low = mid + 1;
      }
    }
    return low;
  }

  int _clampScore(int value) {
    if (value < 0) {
      return 0;
    }
    if (value > _maxMyScore) {
      return _maxMyScore;
    }
    return value;
  }

  Future<void> loadFromPrefs() async {
    if (_isDisposed) {
      return;
    }
    final prefs = await _prefsFuture;
    if (_isDisposed) {
      return;
    }
    final jsonString = prefs.getString(_prefsKey);
    if (jsonString == null) {
      await _tryPersist(
        'Failed to cache championship session',
        () => prefs.setString(_prefsKey, jsonEncode(_state.toMap())),
      );
      return;
    }

    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic>) {
        _state = ChampionshipState.fromMap(decoded);
      } else if (decoded is Map) {
        _state = ChampionshipState.fromMap(
          Map<String, dynamic>.from(decoded as Map),
        );
      } else {
        _state = ChampionshipState(
          sessionId: _newSessionId(),
          rounds: _createDefaultRounds(),
        );
        unawaited(saveToPrefs());
      }
      _safeNotifyListeners();
    } on FormatException catch (error) {
      debugPrint('Failed to parse championship session: $error');
      _state = ChampionshipState(
        sessionId: _newSessionId(),
        rounds: _createDefaultRounds(),
      );
      unawaited(saveToPrefs());
      _safeNotifyListeners();
    } catch (error) {
      debugPrint('Unexpected error loading championship session: $error');
      _state = ChampionshipState(
        sessionId: _newSessionId(),
        rounds: _createDefaultRounds(),
      );
      unawaited(saveToPrefs());
      _safeNotifyListeners();
    }
  }

  Future<void> loadPersistentState([SharedPreferences? prefs]) async {
    if (_isDisposed) {
      return;
    }
    final resolvedPrefs = prefs ?? await _prefsFuture;
    if (_isDisposed) {
      return;
    }
    _myScore = _clampScore(resolvedPrefs.getInt(_myScoreKey) ?? 0);
    _bestScore =
        _clampScore(resolvedPrefs.getInt(_bestScoreKey) ?? _myScore);
    _bestRank = resolvedPrefs.getInt(_bestRankKey) ?? 1;
    _autoScrollEnabled = resolvedPrefs.getBool(_autoScrollKey) ?? true;
    _lastAwardedGameId = resolvedPrefs.getString(_lastAwardedGameIdKey);
    _installSeed = resolvedPrefs.getInt(_installSeedKey);
    _persistentStateLoaded = true;
    _safeNotifyListeners();
  }

  void scheduleLeaderboardWarmup() {
    if (_preloadScheduled) {
      return;
    }
    _preloadScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(ensureLeaderboardLoaded());
    });
  }

  Future<void> ensureLeaderboardLoaded({bool forceRefresh = false}) {
    if (_leaderboardStatus == ChampionshipLeaderboardStatus.ready &&
        !forceRefresh) {
      return Future.value();
    }
    if (!forceRefresh) {
      final inProgress = _leaderboardLoadFuture;
      if (inProgress != null) {
        return inProgress;
      }
    }
    final future = _loadLeaderboardInternal(forceRefresh: forceRefresh);
    _leaderboardLoadFuture = future;
    future.whenComplete(() {
      if (identical(_leaderboardLoadFuture, future)) {
        _leaderboardLoadFuture = null;
      }
    });
    return future;
  }

  Future<void> _loadLeaderboardInternal({bool forceRefresh = false}) async {
    if (_isDisposed) {
      return;
    }
    try {
      final prefs = await _prefsFuture;
      if (_isDisposed) {
        return;
      }
      if (!_persistentStateLoaded) {
        await loadPersistentState(prefs);
        if (_isDisposed) {
          return;
        }
      }

      if (!forceRefresh) {
        final cached = await _readCachedLeaderboard();
        if (_isDisposed) {
          return;
        }
        if (cached != null) {
          final board = cached.toLeaderboard();
          await _commitLeaderboardPayload(
            cached,
            prefs,
            prebuilt: board,
          );
          return;
        }
      }

      _setLeaderboardStatus(
        ChampionshipLeaderboardStatus.loading,
        error: null,
      );

      _LeaderboardCachePayload? payload;
      if (!forceRefresh) {
        payload = await _migrateLegacyLeaderboard(prefs);
        if (_isDisposed) {
          return;
        }
      }
      if (payload != null) {
        final board = payload.toLeaderboard();
        await _commitLeaderboardPayload(
          payload,
          prefs,
          prebuilt: board,
        );
      } else {
        await _generateWriteAndCommitLeaderboard(prefs);
      }
    } catch (error, stack) {
      debugPrint('Failed to load championship leaderboard: $error');
      debugPrint('$stack');
      _setLeaderboardStatus(
        ChampionshipLeaderboardStatus.error,
        error: error,
      );
    }
  }

  Future<void> _commitLeaderboardPayload(
    _LeaderboardCachePayload payload,
    SharedPreferences prefs, {
    Leaderboard? prebuilt,
  }) async {
    if (_isDisposed) {
      return;
    }
    final board = prebuilt ?? payload.toLeaderboard();
    _leaderboard = board;
    _installSeed = payload.seed;
    if (_bestRank <= 0) {
      _bestRank = myRank;
    }
    if (_bestScore < _myScore) {
      _bestScore = _myScore;
    }
    if (_isDisposed) {
      return;
    }
    final persisted = await _tryPersist(
      'Failed to persist championship leaderboard snapshot',
      () async {
        await prefs.setInt(_installSeedKey, payload.seed);
        await prefs.setInt(_bestScoreKey, _bestScore);
        await prefs.setInt(_bestRankKey, _bestRank);
      },
    );
    if (_isDisposed || !persisted) {
      return;
    }
    _setLeaderboardStatus(
      ChampionshipLeaderboardStatus.ready,
      error: null,
    );
  }

  Future<void> _generateWriteAndCommitLeaderboard(
      SharedPreferences prefs) async {
    if (_isDisposed) {
      return;
    }
    final seed = _installSeed ?? await _ensureInstallSeed(prefs);
    if (_isDisposed) {
      return;
    }
    final board = await _generateLeaderboardWithSeed(seed);
    if (_isDisposed) {
      return;
    }
    final payload = _LeaderboardCachePayload.fromLeaderboard(
      schemaVersion: _leaderboardSchemaVersion,
      leaderboard: board,
      seed: seed,
    );
    if (_isDisposed) {
      return;
    }
    final cached = await _writeLeaderboardCache(payload);
    if (_isDisposed || !cached) {
      return;
    }
    await _commitLeaderboardPayload(payload, prefs, prebuilt: board);
  }

  Future<void> saveMyScore({String? lastGameId}) async {
    if (_isDisposed) {
      return;
    }
    final prefs = await _prefsFuture;
    if (_isDisposed) {
      return;
    }
    await _tryPersist(
      'Failed to save championship score',
      () async {
        await prefs.setInt(_myScoreKey, _myScore);
        await prefs.setInt(_bestScoreKey, _bestScore);
        await prefs.setInt(_bestRankKey, _bestRank);
        if (lastGameId != null && lastGameId.isNotEmpty) {
          await prefs.setString(_lastAwardedGameIdKey, lastGameId);
        }
      },
    );
  }

  Future<void> resetMyScore() async {
    if (_isDisposed) {
      return;
    }
    if (_myScore == 0) {
      return;
    }
    _myScore = 0;
    _safeNotifyListeners();
    await saveMyScore();
  }

  Future<void> regenerateOpponents() async {
    if (_isDisposed) {
      return;
    }
    final prefs = await _prefsFuture;
    if (_isDisposed) {
      return;
    }
    final seed = _generateRandomSeed();
    _installSeed = seed;
    final persisted = await _tryPersist(
      'Failed to persist regenerated championship opponents seed',
      () => prefs.setInt(_installSeedKey, seed),
    );
    if (_isDisposed || !persisted) {
      return;
    }
    await ensureLeaderboardLoaded(forceRefresh: true);
  }

  ChampionshipBackupData createBackupData(DateTime exportedAt) {
    final normalizedExportedAt = exportedAt.toUtc();
    final opponents = List<Map<String, dynamic>>.unmodifiable(
      _leaderboard.opponents.map((opponent) => opponent.toJson()),
    );
    final seed = _installSeed ?? 0;
    final lastGameId =
        _lastAwardedGameId != null && _lastAwardedGameId!.isNotEmpty
            ? _lastAwardedGameId
            : null;
    return ChampionshipBackupData(
      version: ChampionshipBackupData.currentVersion,
      exportedAt: normalizedExportedAt,
      myScore: _myScore,
      bestRank: _bestRank,
      bestScore: _bestScore,
      installSeed: seed,
      lastAwardedGameId: lastGameId,
      autoScroll: _autoScrollEnabled,
      opponents: opponents,
    );
  }

  Future<void> restoreFromBackup(ChampionshipBackupData data) async {
    if (_isDisposed) {
      return;
    }
    if (data.version != ChampionshipBackupData.currentVersion) {
      throw FormatException('Unsupported backup version: ${data.version}');
    }
    final prefs = await _prefsFuture;
    if (_isDisposed) {
      return;
    }
    final parsedOpponents = <Opponent>[];
    for (final opponent in data.opponents) {
      parsedOpponents.add(Opponent.fromJson(opponent));
    }
    parsedOpponents.sort((a, b) => b.score.compareTo(a.score));

    var newSeed = data.installSeed;
    if (newSeed <= 0) {
      newSeed = _generateRandomSeed();
    }
    _installSeed = newSeed;
    final seedPersisted = await _tryPersist(
      'Failed to persist championship seed from backup',
      () => prefs.setInt(_installSeedKey, newSeed),
    );
    if (_isDisposed || !seedPersisted) {
      return;
    }

    Leaderboard restored;
    if (parsedOpponents.isEmpty) {
      restored = await _generateLeaderboardWithSeed(newSeed);
      if (_isDisposed) {
        return;
      }
    } else {
      restored = Leaderboard(
        opponents: parsedOpponents,
        generatedAt: data.exportedAt.toUtc(),
      );
    }
    final payload = _LeaderboardCachePayload.fromLeaderboard(
      schemaVersion: _leaderboardSchemaVersion,
      leaderboard: restored,
      seed: newSeed,
    );
    if (_isDisposed) {
      return;
    }
    final cachePersisted = await _writeLeaderboardCache(payload);
    if (_isDisposed || !cachePersisted) {
      return;
    }
    final legacyCleared = await _tryPersist(
      'Failed to clear legacy championship opponents cache',
      () => prefs.remove(_opponentsKey),
    );
    if (_isDisposed || !legacyCleared) {
      return;
    }

    _leaderboard = restored;
    _leaderboardError = null;

    _myScore = _clampScore(data.myScore);
    _bestScore = _clampScore(data.bestScore);
    _bestRank = data.bestRank > 0 ? data.bestRank : 1;
    _autoScrollEnabled = data.autoScroll;
    final normalizedLastId =
        data.lastAwardedGameId != null && data.lastAwardedGameId!.isNotEmpty
            ? data.lastAwardedGameId
            : null;
    _lastAwardedGameId = normalizedLastId;

    if (_bestScore < _myScore) {
      _bestScore = _myScore;
    }
    if (_bestRank <= 0) {
      _bestRank = myRank;
    }

    if (_isDisposed) {
      return;
    }
    final persisted = await _tryPersist(
      'Failed to persist restored championship progress',
      () async {
        await prefs.setInt(_myScoreKey, _myScore);
        await prefs.setInt(_bestScoreKey, _bestScore);
        await prefs.setInt(_bestRankKey, _bestRank);
        await prefs.setBool(_autoScrollKey, _autoScrollEnabled);
        if (normalizedLastId != null) {
          await prefs.setString(_lastAwardedGameIdKey, normalizedLastId);
        } else {
          await prefs.remove(_lastAwardedGameIdKey);
        }
      },
    );
    if (_isDisposed || !persisted) {
      return;
    }

    _setLeaderboardStatus(
      ChampionshipLeaderboardStatus.ready,
      error: null,
    );
  }

  Future<int> awardScoreForGame({
    required Difficulty difficulty,
    required int timeMs,
    required int mistakes,
    required int hints,
    required String gameId,
    bool isDailyChallenge = false,
  }) async {
    if (_isDisposed) {
      return 0;
    }
    if (_lastAwardedGameId != null && _lastAwardedGameId == gameId) {
      return 0;
    }
    final previousScore = _myScore;
    final tentativeScore = previousScore + _winAward;
    _myScore = _clampScore(tentativeScore);
    final appliedDelta = _myScore - previousScore;
    _lastAwardedGameId = gameId;
    if (_myScore > _bestScore) {
      _bestScore = _myScore;
    }
    final currentRank = myRank;
    if (currentRank < _bestRank) {
      _bestRank = currentRank;
    }
    if (_isDisposed) {
      return appliedDelta;
    }
    await saveMyScore(lastGameId: gameId);
    _safeNotifyListeners();
    return appliedDelta;
  }

  Future<void> setAutoScrollEnabled(bool value) async {
    if (_autoScrollEnabled == value) {
      return;
    }
    _autoScrollEnabled = value;
    _safeNotifyListeners();
    if (_isDisposed) {
      return;
    }
    final prefs = await _prefsFuture;
    if (_isDisposed) {
      return;
    }
    await _tryPersist(
      'Failed to persist championship auto-scroll preference',
      () => prefs.setBool(_autoScrollKey, value),
    );
  }

  Future<void> saveToPrefs() async {
    if (_isDisposed) {
      return;
    }
    final prefs = await _prefsFuture;
    if (_isDisposed) {
      return;
    }
    await _tryPersist(
      'Failed to persist championship session',
      () => prefs.setString(_prefsKey, jsonEncode(_state.toMap())),
    );
  }

  void startRound(Difficulty difficulty) {
    if (_isDisposed) {
      return;
    }
    final round = _state.rounds.firstWhere(
      (r) => r.difficulty == difficulty,
      orElse: () =>
          throw ArgumentError('Unknown championship difficulty: $difficulty'),
    );

    var changed = false;
    final now = DateTime.now().toUtc();
    if (round.status != ChampionshipRoundStatus.inProgress) {
      round
        ..status = ChampionshipRoundStatus.inProgress
        ..finishedAt = null
        ..startedAt = now;
      changed = true;
    } else {
      if (round.startedAt == null || round.startedAt!.isBefore(now)) {
        round.startedAt = now;
        changed = true;
      }
      if (round.finishedAt != null) {
        round.finishedAt = null;
        changed = true;
      }
    }

    final targetIndex = _difficultyIndex(difficulty);
    for (final other in _state.rounds) {
      if (identical(other, round)) {
        continue;
      }
      final otherIndex = _difficultyIndex(other.difficulty);
      if (otherIndex < targetIndex) {
        if (other.status != ChampionshipRoundStatus.completed ||
            other.finishedAt == null) {
          other
            ..status = ChampionshipRoundStatus.completed
            ..startedAt ??= now
            ..finishedAt ??= now;
          changed = true;
        }
      } else {
        if (other.status != ChampionshipRoundStatus.notStarted ||
            other.startedAt != null ||
            other.finishedAt != null) {
          other
            ..status = ChampionshipRoundStatus.notStarted
            ..startedAt = null
            ..finishedAt = null;
          changed = true;
        }
      }
    }

    if (changed) {
      _safeNotifyListeners();
      unawaited(saveToPrefs());
    }
  }

  Difficulty _difficultyForProgress(double progress) {
    if (progress >= 0.8) {
      return Difficulty.master;
    }
    if (progress >= 0.6) {
      return Difficulty.expert;
    }
    if (progress >= 0.4) {
      return Difficulty.high;
    }
    if (progress >= 0.2) {
      return Difficulty.medium;
    }
    return Difficulty.novice;
  }

  int _difficultyIndex(Difficulty difficulty) {
    final index = _defaultDifficultyOrder.indexOf(difficulty);
    if (index >= 0) {
      return index;
    }
    return difficulty.index;
  }

  void completeCurrentRound() {
    if (_isDisposed) {
      return;
    }
    for (final round in _state.rounds.reversed) {
      if (round.status == ChampionshipRoundStatus.inProgress) {
        round
          ..status = ChampionshipRoundStatus.completed
          ..finishedAt = DateTime.now().toUtc();
        _safeNotifyListeners();
        unawaited(saveToPrefs());
        break;
      }
    }
  }

  void resetSession() {
    if (_isDisposed) {
      return;
    }
    _state.sessionId = _newSessionId();
    for (final round in _state.rounds) {
      round
        ..status = ChampionshipRoundStatus.notStarted
        ..startedAt = null
        ..finishedAt = null;
    }
    _safeNotifyListeners();
    unawaited(saveToPrefs());
  }

  Leaderboard? _decodeLeaderboard(String source) {
    try {
      final decoded = jsonDecode(source);
      final map = decoded is Map<String, dynamic>
          ? decoded
          : decoded is Map
              ? Map<String, dynamic>.from(decoded as Map)
              : null;
      if (map == null) {
        return null;
      }
      final generatedAtString = map['generatedAt'] as String?;
      final generatedAt = generatedAtString != null
          ? DateTime.tryParse(generatedAtString)?.toUtc()
          : null;
      final opponentsValue = map['opponents'];
      if (opponentsValue is! List) {
        return null;
      }
      final opponents = <Opponent>[];
      for (final entry in opponentsValue) {
        if (entry is Map<String, dynamic>) {
          opponents.add(Opponent.fromJson(entry));
        } else if (entry is Map) {
          opponents.add(
            Opponent.fromJson(Map<String, dynamic>.from(entry as Map)),
          );
        }
      }
      if (opponents.isEmpty) {
        return null;
      }
      opponents.sort((a, b) => b.score.compareTo(a.score));
      return Leaderboard(
        opponents: opponents,
        generatedAt: generatedAt ?? DateTime.now().toUtc(),
      );
    } on FormatException {
      rethrow;
    } catch (_) {
      return null;
    }
  }

  Future<Leaderboard> _generateLeaderboardWithSeed(int seed) async {
    _installSeed = seed;
    final names = await _loadNames();
    final input = <String, dynamic>{
      'seed': seed,
      'count': _opponentsCount,
      'names': names,
      'fallback': _fallbackNames,
    };
    final result = await compute<Map<String, dynamic>, Map<String, dynamic>>(
      _buildLeaderboardInIsolate,
      input,
    );
    final generatedAtValue = result['generatedAt'];
    final generatedAt = generatedAtValue is String
        ? DateTime.tryParse(generatedAtValue)?.toUtc()
        : generatedAtValue is DateTime
            ? generatedAtValue.toUtc()
            : null;
    final opponentsValue = result['opponents'];
    final opponents = <Opponent>[];
    if (opponentsValue is List) {
      for (final entry in opponentsValue) {
        if (entry is Map<String, dynamic>) {
          opponents.add(Opponent.fromJson(entry));
        } else if (entry is Map) {
          opponents.add(
            Opponent.fromJson(Map<String, dynamic>.from(entry as Map)),
          );
        }
      }
    }
    opponents.sort((a, b) => b.score.compareTo(a.score));
    final board = Leaderboard(
      opponents: opponents,
      generatedAt: generatedAt ?? DateTime.now().toUtc(),
    );
    return board;
  }

  Future<_LeaderboardCachePayload?> _readCachedLeaderboard() async {
    final stored = await _leaderboardStorage.read();
    if (stored == null || stored.isEmpty) {
      return null;
    }
    try {
      final decoded = jsonDecode(stored);
      final map = decoded is Map<String, dynamic>
          ? decoded
          : decoded is Map
              ? Map<String, dynamic>.from(decoded as Map)
              : null;
      if (map == null) {
        return null;
      }
      final payload = _LeaderboardCachePayload.fromJson(map);
      if (payload.schemaVersion != _leaderboardSchemaVersion) {
        return null;
      }
      return payload;
    } catch (error) {
      debugPrint('Failed to parse cached leaderboard file: $error');
      await _tryPersist(
        'Failed to delete invalid championship leaderboard cache',
        () => _leaderboardStorage.delete(),
      );
      return null;
    }
  }

  Future<bool> _writeLeaderboardCache(
    _LeaderboardCachePayload payload,
  ) async {
    if (_isDisposed) {
      return false;
    }
    final serialized = jsonEncode(payload.toJson());
    if (_isDisposed) {
      return false;
    }
    return _tryPersist(
      'Failed to write championship leaderboard cache',
      () => _leaderboardStorage.write(serialized),
    );
  }

  Future<_LeaderboardCachePayload?> _migrateLegacyLeaderboard(
    SharedPreferences prefs,
  ) async {
    if (_isDisposed) {
      return null;
    }
    final stored = prefs.getString(_opponentsKey);
    if (stored == null) {
      return null;
    }
    try {
      final board = _decodeLeaderboard(stored);
      final legacyRemoved = await _tryPersist(
        'Failed to remove legacy championship opponents cache',
        () => prefs.remove(_opponentsKey),
      );
      if (_isDisposed || !legacyRemoved) {
        return null;
      }
      if (board == null) {
        return null;
      }
      final seed = _installSeed ?? await _ensureInstallSeed(prefs);
      if (_isDisposed) {
        return null;
      }
      final payload = _LeaderboardCachePayload.fromLeaderboard(
        schemaVersion: _leaderboardSchemaVersion,
        leaderboard: board,
        seed: seed,
      );
      final cachePersisted = await _writeLeaderboardCache(payload);
      if (_isDisposed || !cachePersisted) {
        return null;
      }
      return payload;
    } catch (error) {
      debugPrint('Failed to migrate legacy championship leaderboard: $error');
      return null;
    }
  }

  Future<int> _ensureInstallSeed(SharedPreferences prefs) async {
    final stored = prefs.getInt(_installSeedKey);
    if (stored != null) {
      _installSeed = stored;
      return stored;
    }
    final seed = _generateRandomSeed();
    _installSeed = seed;
    await _tryPersist(
      'Failed to persist generated championship seed',
      () => prefs.setInt(_installSeedKey, seed),
    );
    return seed;
  }

  int _generateRandomSeed() {
    final random = math.Random();
    return (random.nextInt(1 << 16) << 16) | random.nextInt(1 << 16);
  }

  Future<List<String>> _loadNames() async {
    final cached = _cachedNames;
    if (cached != null && cached.isNotEmpty) {
      return List<String>.from(cached);
    }
    try {
      final raw = await rootBundle.loadString('assets/data/names.json');
      final decoded = jsonDecode(raw);
      if (decoded is List) {
        final result = <String>[];
        for (final entry in decoded) {
          if (entry is String) {
            final trimmed = entry.trim();
            if (trimmed.isNotEmpty) {
              result.add(trimmed);
            }
          }
        }
        if (result.isNotEmpty) {
          _cachedNames = List<String>.unmodifiable(result);
          return List<String>.from(result);
        }
      }
    } catch (_) {}
    return List<String>.from(_fallbackNames);
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

}

int _generateScore(math.Random rng) {
  const mean = 6000.0;
  const stdDev = 1800.0;
  var u1 = rng.nextDouble();
  if (u1 <= 0) {
    u1 = 1e-10;
  }
  final u2 = rng.nextDouble();
  final gaussian = math.sqrt(-2.0 * math.log(u1)) * math.cos(2 * math.pi * u2);
  final value = mean + stdDev * gaussian;
  final clamped = value.clamp(1000.0, 15000.0);
  return clamped.round();
}

Map<String, dynamic> _buildLeaderboardInIsolate(Map<String, dynamic> input) {
  final seed = (input['seed'] as num?)?.toInt() ?? 0;
  final count = (input['count'] as num?)?.toInt() ?? 0;
  final namesRaw = input['names'];
  final fallbackRaw = input['fallback'];
  final names = namesRaw is List ? List<String>.from(namesRaw) : <String>[];
  final fallback = fallbackRaw is List ? List<String>.from(fallbackRaw) : <String>[];

  final rng = math.Random(seed);
  final pool = names.isNotEmpty ? List<String>.from(names) : List<String>.from(fallback);
  if (pool.isEmpty) {
    pool.addAll(fallback);
  }
  pool.shuffle(rng);

  final usage = <String, int>{};
  final generatedNames = <String>[];
  for (var i = 0; i < count; i++) {
    final base = pool[i % pool.length];
    final nextCount = (usage[base] ?? 0) + 1;
    usage[base] = nextCount;
    generatedNames.add(nextCount == 1 ? base : '$base #$nextCount');
  }

  final scores = List<int>.generate(count, (_) => _generateScore(rng))
    ..sort((a, b) => b.compareTo(a));

  final opponents = <Map<String, dynamic>>[];
  for (var i = 0; i < count; i++) {
    opponents.add({
      'id': 'o${i + 1}',
      'name': generatedNames[i],
      'score': scores[i],
    });
  }

  return {
    'generatedAt': DateTime.now().toUtc().toIso8601String(),
    'opponents': opponents,
    'seed': seed,
  };
}

class _LeaderboardCachePayload {
  const _LeaderboardCachePayload({
    required this.schemaVersion,
    required this.generatedAt,
    required this.seed,
    required this.opponents,
  });

  final int schemaVersion;
  final DateTime generatedAt;
  final int seed;
  final List<Map<String, dynamic>> opponents;

  factory _LeaderboardCachePayload.fromJson(Map<String, dynamic> json) {
    final schemaVersion = (json['schema_version'] as num?)?.toInt() ?? -1;
    final generatedRaw = json['generated_at'];
    DateTime generatedAt;
    if (generatedRaw is String) {
      generatedAt =
          DateTime.tryParse(generatedRaw)?.toUtc() ?? DateTime.now().toUtc();
    } else if (generatedRaw is DateTime) {
      generatedAt = generatedRaw.toUtc();
    } else {
      generatedAt = DateTime.now().toUtc();
    }
    final seed = (json['seed'] as num?)?.toInt() ?? 0;
    final opponentsValue = json['opponents'];
    final opponents = <Map<String, dynamic>>[];
    if (opponentsValue is List) {
      for (final entry in opponentsValue) {
        if (entry is Map<String, dynamic>) {
          opponents.add(Map<String, dynamic>.from(entry));
        } else if (entry is Map) {
          opponents.add(Map<String, dynamic>.from(entry as Map));
        }
      }
    }
    return _LeaderboardCachePayload(
      schemaVersion: schemaVersion,
      generatedAt: generatedAt,
      seed: seed,
      opponents: opponents,
    );
  }

  factory _LeaderboardCachePayload.fromLeaderboard({
    required int schemaVersion,
    required Leaderboard leaderboard,
    required int seed,
  }) {
    return _LeaderboardCachePayload(
      schemaVersion: schemaVersion,
      generatedAt: leaderboard.generatedAt,
      seed: seed,
      opponents: leaderboard.opponents
          .map((opponent) => opponent.toJson())
          .toList(growable: false),
    );
  }

  Map<String, dynamic> toJson() => {
        'schema_version': schemaVersion,
        'generated_at': generatedAt.toIso8601String(),
        'seed': seed,
        'opponents': opponents,
      };

  Leaderboard toLeaderboard() {
    final parsed = <Opponent>[];
    for (final entry in opponents) {
      parsed.add(Opponent.fromJson(entry));
    }
    parsed.sort((a, b) => b.score.compareTo(a.score));
    return Leaderboard(
      opponents: parsed,
      generatedAt: generatedAt,
    );
  }
}

const List<Difficulty> _defaultDifficultyOrder = [
  Difficulty.novice,
  Difficulty.medium,
  Difficulty.high,
  Difficulty.expert,
  Difficulty.master,
];

List<ChampionshipRound> _createDefaultRounds() => _defaultDifficultyOrder
    .map((difficulty) => ChampionshipRound(difficulty: difficulty))
    .toList(growable: false);

String _newSessionId() => DateTime.now().toUtc().toIso8601String();
