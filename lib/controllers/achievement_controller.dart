import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/achievement.dart';

class AchievementController extends ChangeNotifier {
  static const _storageKey = 'achievement_progress';

  final List<Achievement> _achievements = [
    const Achievement(
      id: 'wins_50',
      imagePath: 'assets/achievements/wins_50.png',
    ),
    const Achievement(
      id: 'no_mistakes',
      imagePath: 'assets/achievements/no_mistakes.png',
    ),
    const Achievement(
      id: 'supermind',
      imagePath: 'assets/achievements/supermind.png',
    ),
    const Achievement(
      id: 'streak_3days',
      imagePath: 'assets/achievements/streak_3days.png',
    ),
    const Achievement(
      id: 'fast_solver',
      imagePath: 'assets/achievements/fast_solver.png',
    ),
    const Achievement(
      id: 'wins_100',
      imagePath: 'assets/achievements/wins_100.png',
    ),
  ];

  SharedPreferences? _prefs;
  bool _loaded = false;
  bool _savePending = false;
  int _totalClassicWins = 0;
  int _dailyStreak = 0;
  int _noMistakeNoHintStreak = 0;

  bool get isLoaded => _loaded;

  UnmodifiableListView<Achievement> get achievements =>
      UnmodifiableListView(_achievements);

  List<AchievementProgressData> get achievementsProgress {
    final items = [
      for (final achievement in _achievements)
        AchievementProgressData(
          achievement: achievement,
          progress: _progressFor(achievement),
          current: _currentValueFor(achievement),
          goal: _goalFor(achievement),
        ),
    ];
    items.sort((a, b) {
      final aUnlocked = a.achievement.unlocked;
      final bUnlocked = b.achievement.unlocked;
      if (aUnlocked != bUnlocked) {
        return bUnlocked ? 1 : -1;
      }
      if (aUnlocked && bUnlocked) {
        final aTime = a.achievement.unlockedAt;
        final bTime = b.achievement.unlockedAt;
        if (aTime != null && bTime != null) {
          return bTime.compareTo(aTime);
        }
        if (aTime != null) {
          return -1;
        }
        if (bTime != null) {
          return 1;
        }
      }
      final progressComparison = b.progress.compareTo(a.progress);
      if (progressComparison != 0) {
        return progressComparison;
      }
      return a.achievement.id.compareTo(b.achievement.id);
    });
    return items;
  }

  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    final stored = _prefs?.getString(_storageKey);
    Map<String, dynamic>? map;
    if (stored != null && stored.isNotEmpty) {
      try {
        if (kIsWeb) {
          map = _decodeAchievementStorage(stored);
        } else {
          map = await compute(_decodeAchievementStorage, stored);
        }
      } catch (_) {
        map = null;
      }
    }
    if (map != null) {
      final statsJson = map['stats'];
      if (statsJson is Map) {
        final streak = _parseNonNegativeInt(statsJson['noMistakeNoHintStreak']);
        if (streak != null) {
          _noMistakeNoHintStreak = streak;
        }
      }
      for (var i = 0; i < _achievements.length; i++) {
        final achievement = _achievements[i];
        final json = map[achievement.id];
        if (json is Map<String, dynamic>) {
          _achievements[i] =
              Achievement.merge(achievement, json.cast<String, dynamic>());
        }
      }
    }
    _loaded = true;
    notifyListeners();
  }

  void syncWithStats({
    required int totalClassicWins,
    required int dailyStreak,
  }) {
    if (!_loaded) {
      return;
    }
    final statsChanged = _updateStats(
      totalClassicWins: totalClassicWins,
      dailyStreak: dailyStreak,
    );
    final now = DateTime.now();
    _evaluateWinAchievements(totalClassicWins, now);
    _evaluateStreak(dailyStreak, now);
    _commitUpdates(statsChanged: statsChanged);
  }

  void handleGameCompleted({
    required bool isClassicMode,
    required int mistakes,
    required int hintsUsed,
    required int elapsedMs,
    required int dailyStreak,
    required int totalClassicWins,
    DateTime? completionDate,
  }) {
    if (!_loaded) {
      return;
    }
    final statsChanged = _updateStats(
      totalClassicWins: totalClassicWins,
      dailyStreak: dailyStreak,
    );
    final timestamp = completionDate ?? DateTime.now();
    if (isClassicMode) {
      _evaluateWinAchievements(totalClassicWins, timestamp);
    }
    final flawlessNoHints = mistakes == 0 && hintsUsed == 0;
    final previousStreak = _noMistakeNoHintStreak;
    if (flawlessNoHints) {
      _noMistakeNoHintStreak++;
    } else if (_noMistakeNoHintStreak != 0) {
      _noMistakeNoHintStreak = 0;
    }
    if (_noMistakeNoHintStreak != previousStreak) {
      _savePending = true;
    }
    if (_noMistakeNoHintStreak >= 3) {
      _unlock('no_mistakes', timestamp);
    }
    if (flawlessNoHints && elapsedMs < 150000) {
      _unlock('supermind', timestamp);
    }
    if (elapsedMs < 180000) {
      _unlock('fast_solver', timestamp);
    }
    _evaluateStreak(dailyStreak, timestamp);
    _commitUpdates(statsChanged: statsChanged);
  }

  void handleGameFailed() {
    if (!_loaded) {
      return;
    }
    if (_noMistakeNoHintStreak == 0) {
      return;
    }
    _noMistakeNoHintStreak = 0;
    _savePending = true;
    _commitUpdates(statsChanged: false);
  }

  void unlock(String id) {
    if (!_loaded) {
      return;
    }
    final changed = _unlock(id, DateTime.now());
    if (changed) {
      _commitUpdates(statsChanged: false);
    }
  }

  Future<void> resetForDebug() async {
    if (!_loaded) {
      return;
    }
    var statsChanged = false;
    if (_totalClassicWins != 0 || _dailyStreak != 0) {
      _totalClassicWins = 0;
      _dailyStreak = 0;
      statsChanged = true;
    }
    var achievementsChanged = false;
    for (var i = 0; i < _achievements.length; i++) {
      final achievement = _achievements[i];
      if (achievement.unlocked || achievement.unlockedAt != null) {
        _achievements[i] =
            Achievement(id: achievement.id, imagePath: achievement.imagePath);
        _savePending = true;
        achievementsChanged = true;
      }
    }
    if (_noMistakeNoHintStreak != 0) {
      _noMistakeNoHintStreak = 0;
      _savePending = true;
      achievementsChanged = true;
    }
    if (statsChanged || achievementsChanged) {
      _commitUpdates(statsChanged: statsChanged || achievementsChanged);
    }
  }

  bool _updateStats({
    required int totalClassicWins,
    required int dailyStreak,
  }) {
    var changed = false;
    if (_totalClassicWins != totalClassicWins) {
      _totalClassicWins = totalClassicWins;
      changed = true;
    }
    if (_dailyStreak != dailyStreak) {
      _dailyStreak = dailyStreak;
      changed = true;
    }
    return changed;
  }

  void _evaluateWinAchievements(int wins, DateTime timestamp) {
    if (wins >= 50) {
      _unlock('wins_50', timestamp);
    }
    if (wins >= 100) {
      _unlock('wins_100', timestamp);
    }
  }

  void _evaluateStreak(int streak, DateTime timestamp) {
    if (streak >= 3) {
      _unlock('streak_3days', timestamp);
    }
  }

  void _commitUpdates({required bool statsChanged}) {
    final shouldNotify = statsChanged || _savePending;
    if (_savePending) {
      _saveProgress();
      _savePending = false;
    }
    if (shouldNotify) {
      notifyListeners();
    }
  }

  double _progressFor(Achievement achievement) {
    final goal = _goalFor(achievement);
    if (goal <= 0) {
      return achievement.unlocked ? 1 : 0;
    }
    final current = _currentValueFor(achievement);
    return (current / goal).clamp(0.0, 1.0);
  }

  int _currentValueFor(Achievement achievement) {
    switch (achievement.id) {
      case 'wins_50':
        return min(_totalClassicWins, 50);
      case 'wins_100':
        return min(_totalClassicWins, 100);
      case 'streak_3days':
        return min(_dailyStreak, 3);
      case 'no_mistakes':
        return min(_noMistakeNoHintStreak, 3);
      case 'fast_solver':
      case 'supermind':
        return achievement.unlocked ? 1 : 0;
      default:
        return 0;
    }
  }

  int _goalFor(Achievement achievement) {
    switch (achievement.id) {
      case 'wins_50':
        return 50;
      case 'wins_100':
        return 100;
      case 'streak_3days':
        return 3;
      case 'no_mistakes':
        return 3;
      case 'fast_solver':
      case 'supermind':
        return 1;
      default:
        return 0;
    }
  }

  void _saveProgress() {
    final prefs = _prefs;
    if (prefs == null) {
      return;
    }
    final map = {
      'stats': {
        'noMistakeNoHintStreak': _noMistakeNoHintStreak,
      },
      for (final achievement in _achievements)
        achievement.id: achievement.toJson(),
    };
    unawaited(prefs.setString(_storageKey, jsonEncode(map)));
  }

  bool _unlock(String id, DateTime timestamp) {
    final index = _achievements.indexWhere((element) => element.id == id);
    if (index == -1) {
      return false;
    }
    final achievement = _achievements[index];
    if (achievement.unlocked) {
      return false;
    }
    _achievements[index] =
        achievement.copyWith(unlocked: true, unlockedAt: timestamp);
    _savePending = true;
    return true;
  }
}

class AchievementProgressData {
  AchievementProgressData({
    required this.achievement,
    required this.progress,
    required this.current,
    required this.goal,
  });

  final Achievement achievement;
  final double progress;
  final int current;
  final int goal;

  int get percent {
    final value = (progress * 100).round();
    if (value < 0) {
      return 0;
    }
    if (value > 100) {
      return 100;
    }
    return value;
  }
}

int? _parseNonNegativeInt(Object? value) {
  if (value is num) {
    return max(0, value.toInt());
  }
  if (value is String) {
    final parsed = int.tryParse(value);
    if (parsed != null) {
      return max(0, parsed);
    }
  }
  return null;
}

Map<String, dynamic>? _decodeAchievementStorage(String stored) {
  try {
    final decoded = jsonDecode(stored);
    if (decoded is Map) {
      return decoded.map(
        (key, value) => MapEntry(key.toString(), value),
      );
    }
  } catch (_) {
    // Ignore malformed storage.
  }
  return null;
}
