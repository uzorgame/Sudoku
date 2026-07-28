import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudoku2/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vibration/vibration.dart';

import 'analytics/game_analytics.dart';
import 'puzzles.dart';
import 'theme.dart';
import 'controllers/achievement_controller.dart';

/// Уровни сложности, используемые в приложении.
enum Difficulty { novice, medium, high, expert, master }

extension DifficultyX on Difficulty {
  /// Человекочитаемое название уровня сложности.
  String title(AppLocalizations l10n) => switch (this) {
        Difficulty.novice => l10n.difficultyNovice,
        Difficulty.medium => l10n.difficultyMedium,
        Difficulty.high => l10n.difficultyHigh,
        Difficulty.expert => l10n.difficultyExpert,
        Difficulty.master => l10n.difficultyMaster,
      };

  /// Короткая подпись, которая хорошо подходит для бейджей и карточек.
  String shortLabel(AppLocalizations l10n) => switch (this) {
        Difficulty.novice => l10n.difficultyNoviceShort,
        Difficulty.medium => l10n.difficultyMediumShort,
        Difficulty.high => l10n.difficultyHighShort,
        Difficulty.expert => l10n.difficultyExpertShort,
        Difficulty.master => l10n.difficultyMasterShort,
      };

  /// Значение для аналитики Firebase.
  String get analyticsLabel => switch (this) {
        Difficulty.novice => 'easy',
        Difficulty.medium => 'intermediate',
        Difficulty.high => 'hard',
        Difficulty.expert => 'expert',
        Difficulty.master => 'master',
      };
}

/// Поддерживаемые языки интерфейса.
enum AppLanguage {
  en,
  uk,
  de,
  fr,
  es,
  it,
  tr,
  pl,
  pt,
  zh,
  hi,
  ja,
  ko,
  ka,
  id,
  vi,
  th,
  nl,
  sv,
  ro,
  cs,
  fi,
  kk,
  ru,
  bg,
  ms,
  ne,
  pa,
  sw,
  sk,
}

/// Доступные варианты размера шрифта для интерфейса игры.
enum FontSizeOption { extraSmall, small, medium, large, extraLarge }

extension AppLanguageX on AppLanguage {
  /// Локаль, соответствующая языку приложения.
  Locale get locale => switch (this) {
        AppLanguage.en => const Locale('en'),
        AppLanguage.uk => const Locale('uk'),
        AppLanguage.de => const Locale('de'),
        AppLanguage.fr => const Locale('fr'),
        AppLanguage.es => const Locale('es'),
        AppLanguage.it => const Locale('it'),
        AppLanguage.tr => const Locale('tr'),
        AppLanguage.pl => const Locale('pl'),
        AppLanguage.pt => const Locale('pt'),
        AppLanguage.zh => const Locale('zh'),
        AppLanguage.hi => const Locale('hi'),
        AppLanguage.ja => const Locale('ja'),
        AppLanguage.ko => const Locale('ko'),
        AppLanguage.ka => const Locale('ka'),
        AppLanguage.id => const Locale('id'),
        AppLanguage.vi => const Locale('vi'),
        AppLanguage.th => const Locale('th'),
        AppLanguage.nl => const Locale('nl'),
        AppLanguage.sv => const Locale('sv'),
        AppLanguage.ro => const Locale('ro'),
        AppLanguage.cs => const Locale('cs'),
        AppLanguage.fi => const Locale('fi'),
        AppLanguage.kk => const Locale('kk'),
        AppLanguage.ru => const Locale('ru'),
        AppLanguage.bg => const Locale('bg'),
        AppLanguage.ms => const Locale('ms'),
        AppLanguage.ne => const Locale('ne'),
        AppLanguage.pa => const Locale('pa'),
        AppLanguage.sw => const Locale('sw'),
        AppLanguage.sk => const Locale('sk'),
      };

  /// Полный тэг локали в формате BCP 47.
  String toLocaleTag() => switch (this) {
        AppLanguage.en => 'en-US',
        AppLanguage.uk => 'uk-UA',
        AppLanguage.de => 'de-DE',
        AppLanguage.fr => 'fr-FR',
        AppLanguage.es => 'es-ES',
        AppLanguage.it => 'it-IT',
        AppLanguage.tr => 'tr-TR',
        AppLanguage.pl => 'pl-PL',
        AppLanguage.pt => 'pt-PT',
        AppLanguage.zh => 'zh-CN',
        AppLanguage.hi => 'hi-IN',
        AppLanguage.ja => 'ja-JP',
        AppLanguage.ko => 'ko-KR',
        AppLanguage.ka => 'ka-GE',
        AppLanguage.id => 'id-ID',
        AppLanguage.vi => 'vi-VN',
        AppLanguage.th => 'th-TH',
        AppLanguage.nl => 'nl-NL',
        AppLanguage.sv => 'sv-SE',
        AppLanguage.ro => 'ro-RO',
        AppLanguage.cs => 'cs-CZ',
        AppLanguage.fi => 'fi-FI',
        AppLanguage.kk => 'kk-KZ',
        AppLanguage.ru => 'ru-RU',
        AppLanguage.bg => 'bg-BG',
        AppLanguage.ms => 'ms-MY',
        AppLanguage.ne => 'ne-NP',
        AppLanguage.pa => 'pa-IN',
        AppLanguage.sw => 'sw-KE',
        AppLanguage.sk => 'sk-SK',
      };

  /// Строковое представление локали (подходит для форматирования дат).
  String get localeCode => locale.languageCode;

  /// Название языка на родном языке (для отображения в списке языков).
  String get nativeName => switch (this) {
        AppLanguage.en => 'English',
        AppLanguage.uk => 'Українська',
        AppLanguage.de => 'Deutsch',
        AppLanguage.fr => 'Français',
        AppLanguage.es => 'Español',
        AppLanguage.it => 'Italiano',
        AppLanguage.tr => 'Türkçe',
        AppLanguage.pl => 'Polski',
        AppLanguage.pt => 'Português',
        AppLanguage.zh => '中文',
        AppLanguage.hi => 'हिन्दी',
        AppLanguage.ja => '日本語',
        AppLanguage.ko => '한국어',
        AppLanguage.ka => 'ქართული',
        AppLanguage.id => 'Bahasa Indonesia',
        AppLanguage.vi => 'Tiếng Việt',
        AppLanguage.th => 'ไทย',
        AppLanguage.nl => 'Nederlands',
        AppLanguage.sv => 'Svenska',
        AppLanguage.ro => 'Română',
        AppLanguage.cs => 'Čeština',
        AppLanguage.fi => 'Suomi',
        AppLanguage.kk => 'Қазақ тілі',
        AppLanguage.ru => 'Русский',
        AppLanguage.bg => 'Български',
        AppLanguage.ms => 'Bahasa Melayu',
        AppLanguage.ne => 'नेपाली',
        AppLanguage.pa => 'ਪੰਜਾਬੀ',
        AppLanguage.sw => 'Kiswahili',
        AppLanguage.sk => 'Slovenčina',
      };

  /// Код країни для відображення прапора.
  String get flagCode => switch (this) {
        AppLanguage.en => 'us',
        AppLanguage.uk => 'ua',
        AppLanguage.de => 'de',
        AppLanguage.fr => 'fr',
        AppLanguage.es => 'es',
        AppLanguage.it => 'it',
        AppLanguage.tr => 'tr',
        AppLanguage.pl => 'pl',
        AppLanguage.pt => 'pt',
        AppLanguage.zh => 'cn',
        AppLanguage.hi => 'in',
        AppLanguage.ja => 'jp',
        AppLanguage.ko => 'kr',
        AppLanguage.ka => 'ge',
        AppLanguage.id => 'id',
        AppLanguage.vi => 'vn',
        AppLanguage.th => 'th',
        AppLanguage.nl => 'nl',
        AppLanguage.sv => 'se',
        AppLanguage.ro => 'ro',
        AppLanguage.cs => 'cz',
        AppLanguage.fi => 'fi',
        AppLanguage.kk => 'kz',
        AppLanguage.ru => 'ru',
        AppLanguage.bg => 'bg',
        AppLanguage.ms => 'my',
        AppLanguage.ne => 'np',
        AppLanguage.pa => 'in',
        AppLanguage.sw => 'tz',
        AppLanguage.sk => 'sk',
      };
}

extension FontSizeOptionX on FontSizeOption {
  /// Коэффициент масштабирования текста относительно базового размера.
  double get scale => switch (this) {
        FontSizeOption.extraSmall => 0.85,
        FontSizeOption.small => 0.95,
        FontSizeOption.medium => 1.0,
        FontSizeOption.large => 1.1,
        FontSizeOption.extraLarge => 1.25,
      };

  /// Название варианта размера шрифта для отображения пользователю.
  String label(AppLocalizations l10n) => switch (this) {
        FontSizeOption.extraSmall => l10n.fontSizeExtraSmall,
        FontSizeOption.small => l10n.fontSizeSmall,
        FontSizeOption.medium => l10n.fontSizeMedium,
        FontSizeOption.large => l10n.fontSizeLarge,
        FontSizeOption.extraLarge => l10n.fontSizeExtraLarge,
      };
}

/// Режим активной игры.
enum GameMode { classic, daily, battle, championship }

/// Состояние активной игры.
class GameState {
  final List<int> board;
  final List<int> solution;
  final List<bool> given;
  final List<Set<int>> notes;
  final List<bool> locked;
  int adHintCredits;

  GameState({
    required this.board,
    required this.solution,
    required this.given,
    required this.notes,
    List<bool>? locked,
    this.adHintCredits = 0,
  }) : locked = (locked != null && locked.length == board.length)
            ? List<bool>.from(locked)
            : List<bool>.filled(board.length, false);
}

abstract class ComboEventSink {
  void updateSettings({required bool enabled, required bool hapticsEnabled});
  void onCellFilled({
    required bool correct,
    required int timestampMs,
    Difficulty? difficulty,
  });
  void onNoHintStep(Difficulty? difficulty);
  void onHintUsed();
  void onLevelFinished({
    required Difficulty? difficulty,
    required int durationMs,
  });
  void reset();
  void dispose();
}

final _elapsedMsExpando = Expando<int>('elapsedMs');

extension GameStateElapsedMs on GameState {
  int get elapsedMs => _elapsedMsExpando[this] ?? 0;

  set elapsedMs(int value) => _elapsedMsExpando[this] = value;
}

/// Хранит статистику для конкретного уровня сложности.
class DifficultyStats {
  int gamesStarted;
  int gamesWon;
  int flawlessWins;
  int bestTimeMs;
  int totalTimeMs;
  int winsWithTime;
  int currentStreak;
  int bestStreak;
  int level;
  int rank;
  int progressCurrent;
  int progressTarget;
  double? overrideWinRate;

  DifficultyStats({
    this.gamesStarted = 0,
    this.gamesWon = 0,
    this.flawlessWins = 0,
    this.bestTimeMs = 0,
    this.totalTimeMs = 0,
    this.winsWithTime = 0,
    this.currentStreak = 0,
    this.bestStreak = 0,
    this.level = 1,
    this.rank = 1,
    this.progressCurrent = 0,
    this.progressTarget = 5,
    this.overrideWinRate,
  });

  double get winRate => overrideWinRate ??
      (gamesStarted == 0 ? 0 : gamesWon / gamesStarted);

  String get winRateText => '${(winRate * 100).round()}%';

  String get bestTimeText => bestTimeMs == 0 ? '--:--' : _formatTime(bestTimeMs);

  String get averageTimeText => winsWithTime == 0
      ? '--:--'
      : _formatTime(totalTimeMs ~/ math.max(1, winsWithTime));

  String get progressText => '$progressCurrent / $progressTarget';

  Map<String, dynamic> toJson() => {
        'gamesStarted': gamesStarted,
        'gamesWon': gamesWon,
        'flawlessWins': flawlessWins,
        'bestTimeMs': bestTimeMs,
        'totalTimeMs': totalTimeMs,
        'winsWithTime': winsWithTime,
        'currentStreak': currentStreak,
        'bestStreak': bestStreak,
        'level': level,
        'rank': rank,
        'progressCurrent': progressCurrent,
        'progressTarget': progressTarget,
        'overrideWinRate': overrideWinRate,
      };

  factory DifficultyStats.fromJson(Map<String, dynamic> json) => DifficultyStats(
        gamesStarted: json['gamesStarted'] ?? 0,
        gamesWon: json['gamesWon'] ?? 0,
        flawlessWins: json['flawlessWins'] ?? 0,
        bestTimeMs: json['bestTimeMs'] ?? 0,
        totalTimeMs: json['totalTimeMs'] ?? 0,
        winsWithTime: json['winsWithTime'] ?? 0,
        currentStreak: json['currentStreak'] ?? 0,
        bestStreak: json['bestStreak'] ?? 0,
        level: json['level'] ?? 1,
        rank: json['rank'] ?? 1,
        progressCurrent: json['progressCurrent'] ?? 0,
        progressTarget: json['progressTarget'] ?? 5,
        overrideWinRate: (json['overrideWinRate'] as num?)?.toDouble(),
      );

  static String _formatTime(int ms) {
    final seconds = ms ~/ 1000;
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }
}

/// Глобальное состояние приложения.
class AppState extends ChangeNotifier {
  static const int _maxHints = 1;
  static const int _maxLives = 3;
  static const int _novicePuzzleLimit = 50;
  static final Set<String> _initedDateLocales = <String>{};

  SudokuTheme theme = SudokuTheme.white;
  AppLanguage lang = AppLanguage.uk;
  bool isInitialized = false;
  bool isGameLoaded = false;
  // Перенастраиваем шкалу размеров шрифтов без изменения верстки:
  // Small берёт прежний Medium (17 sp), Medium — прежний Large (19 sp),
  // а Large увеличиваем пропорционально относительно нового Medium.
  static const double _previousMediumFontSizeSp = 17.0;
  static const double _previousLargeFontSizeSp = 19.0;
  static const double minFontSizeSp = _previousMediumFontSizeSp;
  static const double mediumFontSizeSp = _previousLargeFontSizeSp;
  static const double _fontStepMultiplier =
      mediumFontSizeSp / minFontSizeSp;
  static const double maxFontSizeSp =
      mediumFontSizeSp * _fontStepMultiplier;
  static const List<double> fontSizeOptionsSp = [
    minFontSizeSp,
    mediumFontSizeSp,
    maxFontSizeSp,
  ];
  static const double _baseFontSizeSp = 16.0;
  static const double minFontScale = minFontSizeSp / _baseFontSizeSp;
  static const double maxFontScale = maxFontSizeSp / _baseFontSizeSp;
  double _fontScale = mediumFontSizeSp / _baseFontSizeSp;

  Map<Difficulty, DifficultyStats> statsByDifficulty = _defaultStats();

  final math.Random _random = math.Random();
  final Map<Difficulty, List<int>> _puzzleQueues = {};

  GameState? current;
  Difficulty? currentDifficulty;
  GameMode? currentMode;
  Difficulty featuredDifficulty = Difficulty.novice;
  bool _isFeaturedDailyChallenge = false;

  String? playerFlag;
  bool tutorialSeen = false;
  bool privacyPolicyAccepted = false;

  int totalStars = 0;
  int battleGamesWon = 0;
  int battleGamesPlayed = 0;
  int championshipScore = 4473;
  int dailyStreak = 0;
  DateTime? _lastVictoryDate;
  int heartBonus = 1;

  DateTime? _rateWinsDate;
  int _rateWinsCount = 0;
  bool _ratePromptPending = false;
  DateTime? _lastRatePromptDate;
  bool _hasRated = false;

  void attachAchievementController(AchievementController controller) {
    _achievementController = controller;
  }

  NavigatorObserver? analyticsObserver;

  void setAnalyticsObserver(NavigatorObserver observer) {
    if (!identical(analyticsObserver, observer)) {
      analyticsObserver = observer;
      notifyListeners();
    }
  }

  int get totalClassicWins => statsByDifficulty.values
      .fold<int>(0, (sum, stats) => sum + stats.gamesWon);

  int get battleWinRate {
    if (battleGamesPlayed == 0) {
      return 0;
    }
    final rate = ((battleGamesWon / battleGamesPlayed) * 100).round();
    return math.max(0, math.min(100, rate));
  }

  final Set<String> _completedDailyChallenges = <String>{};
  DateTime? _dailyChallengeDate;

  int currentScore = 0;
  int? selectedCell;
  bool notesMode = false;
  int hintsLeft = _maxHints;
  int _hintsConsumed = 0;
  int livesLeft = _maxLives;
  bool soundsEnabled = true;
  bool vibrationEnabled = true;
  bool comboBadgesEnabled = true;
  bool comboHapticsEnabled = true;
  int? highlightedNumber;
  bool _madeMistake = false;
  bool _gameCompleted = false;
  int _sessionId = 0;
  DateTime? _startedAt;
  String? _currentGameId;

  final List<_Move> _history = [];
  Timer? _saveDebounce;
  final Set<int> _completedNumbers = <int>{};
  ComboEventSink? _comboSink;
  AchievementController? _achievementController;
  final Map<int, int> _hintHighlights = <int, int>{};
  final Map<int, int> _valueAnimations = <int, int>{};
  final Map<int, int> _incorrectAnimations = <int, int>{};
  int _hintHighlightCounter = 0;
  int _valueAnimationCounter = 0;
  int _incorrectAnimationCounter = 0;
  bool _disposed = false;

  /// Загружаем сохранённые настройки и прогресс.
  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      _hintHighlights.clear();
      _valueAnimations.clear();
      _incorrectAnimations.clear();

      _dailyChallengeDate = null;
      _currentGameId = null;
      _lastVictoryDate = null;
      _isFeaturedDailyChallenge = false;

      final completedDaily = prefs.getStringList('dailyCompleted');
      if (completedDaily != null) {
        _completedDailyChallenges
          ..clear()
          ..addAll(completedDaily);
      }

      final profileJson = prefs.getString('profile');
      if (profileJson != null) {
        try {
          final snapshot = await _parseProfileSnapshot(profileJson);
          if (snapshot != null) {
            if (snapshot.dailyStreak != null) {
              dailyStreak = snapshot.dailyStreak!;
            }
            final lastVictory = snapshot.lastVictoryDate;
            if (lastVictory != null) {
              _lastVictoryDate = _dateOnly(lastVictory);
            }
            if (snapshot.totalStars != null) {
              totalStars = snapshot.totalStars!;
            }
            if (snapshot.championshipScore != null) {
              championshipScore = snapshot.championshipScore!;
            }
            if (snapshot.battleGamesWon != null) {
              battleGamesWon = snapshot.battleGamesWon!;
            }
            if (snapshot.battleGamesPlayed != null) {
              battleGamesPlayed = snapshot.battleGamesPlayed!;
            }
            if (battleGamesWon < 0) {
              battleGamesWon = 0;
            }
            if (battleGamesPlayed < battleGamesWon) {
              battleGamesPlayed = battleGamesWon;
            }
            if (battleGamesWon == 0 && battleGamesPlayed == 0) {
              final legacyBattleWins = snapshot.legacyBattleWins;
              if (legacyBattleWins != null) {
                final wins = legacyBattleWins;
                if (wins > 87) {
                  battleGamesWon = wins - 87;
                  battleGamesPlayed = battleGamesWon;
                } else if (wins == 87) {
                  battleGamesWon = 0;
                  battleGamesPlayed = 0;
                }
              }
            }
            if (snapshot.heartBonus != null) {
              heartBonus = snapshot.heartBonus!;
            }
            if (snapshot.playerFlag != null) {
              playerFlag = snapshot.playerFlag!;
            }

            final statsMap = snapshot.stats;
            if (statsMap != null) {
              final parsed = <Difficulty, DifficultyStats>{};
              for (final entry in statsMap.entries) {
                final key = Difficulty.values.firstWhere(
                  (d) => d.name == entry.key,
                  orElse: () => Difficulty.novice,
                );
                parsed[key] = DifficultyStats.fromJson(entry.value);
              }
              statsByDifficulty = {
                for (final diff in Difficulty.values)
                  diff: parsed[diff] ?? _defaultStats()[diff]!,
              };
            }

          }
        } catch (_) {}
      }

      final today = _dateOnly(DateTime.now());
      _hasRated = prefs.getBool('hasRated') ?? false;

      final ratePromptDateRaw = prefs.getString('ratePromptDate');
      if (ratePromptDateRaw != null && ratePromptDateRaw.isNotEmpty) {
        final parsed = DateTime.tryParse(ratePromptDateRaw);
        if (parsed != null) {
          _lastRatePromptDate = _dateOnly(parsed);
        }
      }

      final rateWinsDateRaw = prefs.getString('rateWinsDate');
      final storedWinsCount = prefs.getInt('rateWinsCount') ?? 0;
      if (rateWinsDateRaw != null && rateWinsDateRaw.isNotEmpty) {
        final parsed = DateTime.tryParse(rateWinsDateRaw);
        if (parsed != null) {
          final normalized = _dateOnly(parsed);
          if (normalized == today) {
            _rateWinsDate = normalized;
            _rateWinsCount = storedWinsCount;
          } else {
            _rateWinsDate = null;
            _rateWinsCount = 0;
          }
        }
      } else {
        _rateWinsDate = null;
        _rateWinsCount = 0;
      }

      if (_hasRated) {
        _ratePromptPending = false;
      } else {
        final promptShownToday =
            _lastRatePromptDate != null && _lastRatePromptDate == today;
        _ratePromptPending =
            _rateWinsDate == today && _rateWinsCount >= 3 && !promptShownToday;
      }

      final themeName = prefs.getString('themeV2') ?? prefs.getString('theme');
      if (themeName != null) {
        try {
          theme = SudokuTheme.values.byName(themeName);
        } catch (_) {
          switch (themeName) {
            case 'light':
              theme = SudokuTheme.white;
              break;
            case 'dark':
              theme = SudokuTheme.black;
              break;
            case 'system':
              theme = SudokuTheme.white;
              break;
          }
        }
      }

      final storedScale = prefs.getDouble('fontScaleV2');
      var migratedFontScale = false;

      if (storedScale != null) {
        final normalized = _normalizeFontScale(storedScale);
        if ((normalized - storedScale).abs() > 0.0001) {
          migratedFontScale = true;
        }
        _fontScale = normalized;
      } else {
        FontSizeOption? option;
        final storedFontSize = prefs.getString('fontSize');
        if (storedFontSize != null) {
          try {
            option = FontSizeOption.values.byName(storedFontSize);
          } catch (_) {}
        }

        if (option != null) {
          _fontScale = _normalizeFontScale(option.scale);
          migratedFontScale = true;
        } else {
          final legacyScale = prefs.getDouble('fontScale');
          if (legacyScale != null) {
            _fontScale = _normalizeFontScale(legacyScale);
            migratedFontScale = true;
          } else {
            final digitStyleName = prefs.getString('digitStyle');
            if (digitStyleName != null) {
              switch (digitStyleName) {
                case 'thin':
                  option = FontSizeOption.extraSmall;
                  break;
                case 'bold':
                  option = FontSizeOption.extraLarge;
                  break;
                default:
                  option = FontSizeOption.medium;
              }
              if (option != null) {
                _fontScale = _normalizeFontScale(option.scale);
                migratedFontScale = true;
              }
            }
          }
        }
      }

      _fontScale = _normalizeFontScale(_fontScale);

      if (migratedFontScale) {
        await prefs.setDouble('fontScaleV2', _fontScale);
      }

      await prefs.remove('fontSize');
      await prefs.remove('fontScale');
      await prefs.remove('digitStyle');
      await prefs.remove('syncWithSystemTheme');

      final langName = prefs.getString('lang');
      if (langName != null) {
        try {
          lang = AppLanguage.values.byName(langName);
        } catch (_) {
          lang = AppLanguage.en;
        }
      } else {
        lang = _resolveInitialLanguage();
      }

      soundsEnabled = prefs.getBool('soundsEnabled') ?? soundsEnabled;
      vibrationEnabled = prefs.getBool('vibrationEnabled') ?? vibrationEnabled;
      comboBadgesEnabled =
          prefs.getBool('comboBadgesEnabled') ?? comboBadgesEnabled;
      comboHapticsEnabled =
          prefs.getBool('comboHapticsEnabled') ?? comboHapticsEnabled;
      privacyPolicyAccepted =
          prefs.getBool('privacyPolicyAccepted') ?? privacyPolicyAccepted;
      tutorialSeen = prefs.getBool('tutorialSeen') ?? tutorialSeen;
      final savedGame = prefs.getString('currentGame');
      if (savedGame != null) {
        try {
          final snapshot = await _parseGameSnapshot(savedGame);
          if (snapshot != null) {
            final diffName = snapshot.difficulty;
            final diff = diffName == null
                ? null
                : Difficulty.values.firstWhere(
                    (d) => d.name == diffName,
                    orElse: () => Difficulty.novice,
                  );
            GameMode? mode;
            final modeName = snapshot.mode;
            if (modeName != null) {
              try {
                mode = GameMode.values.byName(modeName);
              } catch (_) {}
            }
            final board = snapshot.board;
            final solution = snapshot.solution;
            final givenList = snapshot.given;
            final lockedList = snapshot.locked;

            if (diff != null &&
                board != null &&
                solution != null &&
                givenList != null &&
                board.length == 81 &&
                solution.length == 81 &&
                givenList.length == 81) {
              final notes = List<Set<int>>.generate(81, (index) {
                if (index < snapshot.notes.length) {
                  return snapshot.notes[index].toSet();
                }
                return <int>{};
              });

              current = GameState(
                board: board,
                solution: solution,
                given: givenList,
                notes: notes,
                locked: lockedList,
                adHintCredits: snapshot.adHintCredits,
              );

              currentDifficulty = diff;
              featuredDifficulty = diff;
              currentMode = mode ?? GameMode.classic;
              _sessionId = snapshot.sessionId ?? _sessionId;
              currentScore = snapshot.currentScore ?? currentScore;
              selectedCell = snapshot.selectedCell;
              notesMode = snapshot.notesMode ?? notesMode;
              hintsLeft = snapshot.hintsLeft ?? hintsLeft;
              hintsLeft = math.max(0, math.min(_maxHints, hintsLeft));
              _hintsConsumed = snapshot.hintsConsumed ?? (_maxHints - hintsLeft);
              _hintsConsumed = math.max(0, _hintsConsumed);
              livesLeft = snapshot.livesLeft ?? livesLeft;
              _madeMistake = snapshot.madeMistake ?? _madeMistake;
              _gameCompleted = false;
              if (snapshot.startedAt != null) {
                _startedAt = snapshot.startedAt;
              }
              final parsedDailyDate = snapshot.dailyDate;
              _dailyChallengeDate =
                  parsedDailyDate == null ? null : _dateOnly(parsedDailyDate);
              _isFeaturedDailyChallenge = currentMode == GameMode.daily ||
                  _dailyChallengeDate != null;

              _currentGameId = snapshot.gameId;
              if (diff != null && (_currentGameId == null || _currentGameId!.isEmpty)) {
                _currentGameId = _composeGameId(diff);
                scheduleSave();
              }

              _history
                ..clear()
                ..addAll(
                  snapshot.history
                      .map(_Move.fromJson),
                );
            }
          }
        } catch (_) {}
      }
    } catch (e) {
      assert(() {
        debugPrint('AppState.load error: $e');
        return true;
      }());
    }

    _refreshDailyStreak();

    await _ensureDateLocaleInited(lang.toLocaleTag());
    _resetComboTracking(resetSink: false);
    isGameLoaded = current != null;
    isInitialized = true;
    notifyListeners();
  }

  static AppLanguage _resolveInitialLanguage() {
    final dispatcher = ui.PlatformDispatcher.instance;
    for (final locale in dispatcher.locales) {
      final resolved = _languageFromLocale(locale);
      if (resolved != null) {
        return resolved;
      }
    }

    final fallback = _languageFromLocale(dispatcher.locale);
    return fallback ?? AppLanguage.en;
  }

  static AppLanguage? _languageFromLocale(ui.Locale? locale) {
    if (locale == null) {
      return null;
    }

    final languageCode = locale.languageCode.toLowerCase();
    for (final candidate in AppLanguage.values) {
      if (candidate.locale.languageCode == languageCode) {
        return candidate;
      }
    }
    return null;
  }

  /// Сохраняем статистику и прочие данные.
  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final statsJson = {
      for (final entry in statsByDifficulty.entries)
        entry.key.name: entry.value.toJson(),
    };
    final lastVictoryDate =
        _lastVictoryDate == null ? null : _dateOnly(_lastVictoryDate!).toIso8601String();
    final profileSnapshot = {
      'dailyStreak': dailyStreak,
      'lastVictoryDate': lastVictoryDate,
      'totalStars': totalStars,
      'championshipScore': championshipScore,
      'battleGamesWon': battleGamesWon,
      'battleGamesPlayed': battleGamesPlayed,
      'battleWinRate': battleWinRate,
      'heartBonus': heartBonus,
      'playerFlag': playerFlag,
      'stats': statsJson,
    };
    final profile = await _serializeProfileSnapshot(profileSnapshot);
    await prefs.setString('profile', profile);
  }

  /// Полный сброс статистики к значениям по умолчанию.
  void resetStats() {
    statsByDifficulty = _defaultStats();
    dailyStreak = 0;
    _lastVictoryDate = null;
    totalStars = 0;
    championshipScore = 4473;
    battleGamesWon = 0;
    battleGamesPlayed = 0;
    heartBonus = 1;
    _rateWinsDate = null;
    _rateWinsCount = 0;
    _ratePromptPending = false;
    _lastRatePromptDate = null;
    _completedDailyChallenges.clear();
    _dailyChallengeDate = null;
    _saveDailyProgress();
    _saveRatePromptState();
    saveProfile();
    notifyListeners();
  }

  void setPlayerFlag(String value) {
    if (playerFlag == value) {
      return;
    }
    playerFlag = value;
    unawaited(saveProfile());
    notifyListeners();
  }

  void setTheme(SudokuTheme value) {
    if (theme == value) return;
    theme = value;
    _persist((prefs) async {
      await prefs.setString('themeV2', value.name);
    });
    notifyListeners();
  }

  void setFontScale(double value, {bool save = true}) {
    final normalized = _normalizeFontScale(value);
    if ((_fontScale - normalized).abs() < 0.001) return;
    _fontScale = normalized;
    if (save) {
      _persist((prefs) async {
        await prefs.setDouble('fontScaleV2', _fontScale);
        await prefs.remove('fontSize');
        await prefs.remove('fontScale');
      });
    }
    notifyListeners();
  }

  void setFontSizeSp(double value, {bool save = true}) {
    setFontScale(value / _baseFontSizeSp, save: save);
  }

  void setFontSizeByIndex(double value, {bool save = true}) {
    final maxIndex = fontSizeOptionsSp.length - 1;
    final normalized = value.clamp(0, maxIndex.toDouble());
    final targetIndex = math.max(0, math.min(maxIndex, normalized.round()));
    setFontSizeSp(fontSizeOptionsSp[targetIndex], save: save);
  }

  double get fontScale => _fontScale;

  double get fontSizeSp => _fontScale * _baseFontSizeSp;

  int get fontSizeIndex {
    final current = _nearestFontSize(fontSizeSp);
    final index = fontSizeOptionsSp.indexOf(current);
    return index == -1 ? 0 : index;
  }

  static double _normalizeFontScale(double scale) {
    final clamped = scale.clamp(minFontScale, maxFontScale).toDouble();
    final fontSize = clamped * _baseFontSizeSp;
    final nearest = _nearestFontSize(fontSize);
    return nearest / _baseFontSizeSp;
  }

  static double _nearestFontSize(double value) {
    var nearest = fontSizeOptionsSp.first;
    for (final option in fontSizeOptionsSp.skip(1)) {
      final diff = (option - value).abs();
      final nearestDiff = (nearest - value).abs();
      if (diff < nearestDiff || (diff == nearestDiff && option > nearest)) {
        nearest = option;
      }
    }
    return nearest;
  }

  SudokuTheme resolvedTheme() {
    return theme;
  }

  String resolvedThemeName(AppLocalizations l10n) {
    return resolvedTheme().label(l10n);
  }

  Future<void> _ensureDateLocaleInited(String localeTag) async {
    if (_initedDateLocales.contains(localeTag)) return;
    await initializeDateFormatting(localeTag);
    _initedDateLocales.add(localeTag);
  }

  Future<void> setLang(AppLanguage value) async {
    if (lang == value) return;
    lang = value;
    _persist((prefs) async {
      await prefs.setString('lang', value.name);
    });
    final tag = lang.toLocaleTag();
    await _ensureDateLocaleInited(tag);
    notifyListeners();
  }

  void toggleSounds(bool enabled) {
    if (soundsEnabled == enabled) return;
    soundsEnabled = enabled;
    _persist((prefs) async {
      await prefs.setBool('soundsEnabled', enabled);
    });
    notifyListeners();
  }

  void toggleVibration(bool enabled) {
    if (vibrationEnabled == enabled) return;
    vibrationEnabled = enabled;
    _persist((prefs) async {
      await prefs.setBool('vibrationEnabled', enabled);
    });
    _comboSink?.updateSettings(
      enabled: comboBadgesEnabled,
      hapticsEnabled: comboHapticsEnabled && vibrationEnabled,
    );
    notifyListeners();
  }

  void toggleComboBadges(bool enabled) {
    if (comboBadgesEnabled == enabled) return;
    comboBadgesEnabled = enabled;
    if (!enabled) {
      _comboSink?.reset();
    }
    _comboSink?.updateSettings(
      enabled: comboBadgesEnabled,
      hapticsEnabled: comboHapticsEnabled && vibrationEnabled,
    );
    _persist((prefs) async {
      await prefs.setBool('comboBadgesEnabled', enabled);
    });
    notifyListeners();
  }

  void toggleComboHaptics(bool enabled) {
    if (comboHapticsEnabled == enabled) return;
    comboHapticsEnabled = enabled;
    _comboSink?.updateSettings(
      enabled: comboBadgesEnabled,
      hapticsEnabled: comboHapticsEnabled && vibrationEnabled,
    );
    _persist((prefs) async {
      await prefs.setBool('comboHapticsEnabled', enabled);
    });
    notifyListeners();
  }

  void attachComboSink(ComboEventSink? sink) {
    if (identical(_comboSink, sink)) {
      if (sink != null) {
        sink.updateSettings(
          enabled: comboBadgesEnabled,
          hapticsEnabled: comboHapticsEnabled && vibrationEnabled,
        );
      }
      return;
    }
    _comboSink = sink;
    if (sink != null) {
      sink.updateSettings(
        enabled: comboBadgesEnabled,
        hapticsEnabled: comboHapticsEnabled && vibrationEnabled,
      );
      sink.reset();
    }
  }

  void _resetComboTracking({bool resetSink = true}) {
    _completedNumbers.clear();
    if (resetSink) {
      _comboSink?.reset();
    }
  }

  void markPrivacyPolicyAccepted() {
    if (privacyPolicyAccepted) return;
    privacyPolicyAccepted = true;
    _persist((prefs) async {
      await prefs.setBool('privacyPolicyAccepted', true);
    });
    notifyListeners();
  }

  void markTutorialSeen() {
    if (tutorialSeen) return;
    tutorialSeen = true;
    _persist((prefs) async {
      await prefs.setBool('tutorialSeen', true);
    });
    notifyListeners();
  }

  int _nextPuzzleIndex(Difficulty diff, int length) {
    var queue = _puzzleQueues[diff];
    if (queue == null || queue.isEmpty) {
      queue = List<int>.generate(length, (index) => index);
      queue.shuffle(_random);
      _puzzleQueues[diff] = queue;
    }
    return queue.removeLast();
  }

  String _composeGameId(Difficulty diff) {
    final started = _startedAt ?? DateTime.now();
    final timestamp = started.toUtc().microsecondsSinceEpoch;
    return '$timestamp-${diff.name}-$_sessionId';
  }

  String _analyticsDifficulty([Difficulty? diff]) {
    final resolved = diff ?? currentDifficulty ?? featuredDifficulty;
    return resolved?.analyticsLabel ?? 'unknown';
  }

  /// Очищення анімацій та підсвіток.
  void _clearAnimations() {
    _hintHighlights.clear();
    _valueAnimations.clear();
    _incorrectAnimations.clear();
  }

  /// Створення GameState з пазлу.
  GameState _createGameStateFromPuzzle(Puzzle puzzle) {
    return GameState(
      board: List.of(puzzle.board),
      solution: List.of(puzzle.solution),
      given: puzzle.board.map((v) => v != 0).toList(),
      notes: List.generate(81, (_) => <int>{}),
    );
  }

  /// Скидання стану гри до початкових значень.
  void _resetGameFlags() {
    currentScore = 0;
    selectedCell = null;
    notesMode = false;
    hintsLeft = _maxHints;
    _hintsConsumed = 0;
    livesLeft = _maxLives;
    highlightedNumber = null;
    _madeMistake = false;
    _gameCompleted = false;
    _history.clear();
  }

  /// Очищення стану при відсутності доступних пазлів.
  void _clearGameState() {
    current = null;
    selectedCell = null;
    notesMode = false;
    hintsLeft = _maxHints;
    _hintsConsumed = 0;
    livesLeft = _maxLives;
    _history.clear();
    _clearSavedGame();
    _currentGameId = null;
    _clearAnimations();
  }

  /// Вибір доступного пазлу з урахуванням ліміту для новачків.
  Puzzle _selectAvailablePuzzle(Difficulty diff, List<Puzzle> resolvedList) {
    final List<Puzzle> available;
    if (diff == Difficulty.novice &&
        resolvedList.length > _novicePuzzleLimit) {
      available = resolvedList.sublist(0, _novicePuzzleLimit);
    } else {
      available = resolvedList;
    }
    final index = _nextPuzzleIndex(diff, available.length);
    return available[index];
  }

  /// Ініціалізація нової гри з пазлу.
  void _initializeNewGame({
    required Puzzle puzzle,
    required Difficulty diff,
    required GameMode mode,
    DateTime? dailyChallengeDate,
    bool isFeaturedDailyChallenge = false,
  }) {
    current = _createGameStateFromPuzzle(puzzle);
    currentDifficulty = diff;
    featuredDifficulty = diff;
    currentMode = mode;
    _isFeaturedDailyChallenge = isFeaturedDailyChallenge;
    _dailyChallengeDate = dailyChallengeDate;
    _sessionId++;
    _resetGameFlags();
    _startedAt = DateTime.now();
    _currentGameId = _composeGameId(diff);
    _resetComboTracking();
    _clearAnimations();
  }

  void startDailyChallenge(DateTime date) {
    final normalized = _dateOnly(date);
    final puzzle = generateDailyPuzzle(normalized);

    _initializeNewGame(
      puzzle: puzzle,
      diff: Difficulty.medium,
      mode: GameMode.daily,
      dailyChallengeDate: normalized,
      isFeaturedDailyChallenge: true,
    );

    GameAnalytics.logPuzzleStart(
      difficulty: _analyticsDifficulty(Difficulty.medium),
    );

    statsByDifficulty[Difficulty.medium]?.gamesStarted++;
    scheduleSave();
    saveProfile();
    notifyListeners();
  }

  /// Запуск новой игры выбранного уровня сложности.
  void startGame(
    Difficulty diff, {
    GameMode mode = GameMode.classic,
  }) {
    _isFeaturedDailyChallenge = false;
    final resolvedList =
        (puzzles[diff] ?? puzzles[Difficulty.novice]) ?? <Puzzle>[];
    if (resolvedList.isEmpty) {
      _clearGameState();
      currentMode = null;
      notifyListeners();
      return;
    }

    _dailyChallengeDate = null;
    final puzzle = _selectAvailablePuzzle(diff, resolvedList);

    _initializeNewGame(
      puzzle: puzzle,
      diff: diff,
      mode: mode,
      dailyChallengeDate: null,
      isFeaturedDailyChallenge: false,
    );

    GameAnalytics.logPuzzleStart(
      difficulty: _analyticsDifficulty(diff),
    );

    statsByDifficulty[diff]?.gamesStarted++;
    scheduleSave();
    saveProfile();
    notifyListeners();
  }

  void startBattleGame(Difficulty diff) {
    final resolvedList =
        (puzzles[diff] ?? puzzles[Difficulty.novice]) ?? <Puzzle>[];
    if (resolvedList.isEmpty) {
      _clearGameState();
      notifyListeners();
      return;
    }

    _dailyChallengeDate = null;
    final puzzle = _selectAvailablePuzzle(diff, resolvedList);

    _initializeNewGame(
      puzzle: puzzle,
      diff: diff,
      mode: GameMode.battle,
      dailyChallengeDate: null,
      isFeaturedDailyChallenge: false,
    );

    GameAnalytics.logPuzzleStart(
      difficulty: _analyticsDifficulty(diff),
    );

    scheduleSave();
    notifyListeners();
  }

  /// Перезапуск текущей головоломки без смены задачи.
  void restartCurrentPuzzle() {
    final game = current;
    if (game == null) return;

    for (var i = 0; i < game.board.length; i++) {
      game.board[i] = game.given[i] ? game.solution[i] : 0;
      game.notes[i].clear();
      if (i < game.locked.length) {
        game.locked[i] = false;
      }
    }

    _resetGameFlags();
    _clearAnimations();
    _sessionId++;
    _startedAt = DateTime.now();
    final diff = currentDifficulty;
    _currentGameId = diff == null ? null : _composeGameId(diff);
    _resetComboTracking();

    GameAnalytics.logPuzzleStart(
      difficulty: _analyticsDifficulty(diff),
    );

    scheduleSave();
    notifyListeners();
  }

  int get sessionId => _sessionId;

  DateTime? get startedAt => _startedAt;

  String? get currentGameId => _currentGameId;

  String ensureCurrentGameId() {
    final diff = currentDifficulty;
    if (diff == null) {
      final fallback =
          DateTime.now().toUtc().microsecondsSinceEpoch.toString();
      _currentGameId = fallback;
      return fallback;
    }
    final existing = _currentGameId;
    if (existing != null && existing.isNotEmpty) {
      return existing;
    }
    final generated = _composeGameId(diff);
    _currentGameId = generated;
    scheduleSave();
    return generated;
  }

  bool get hasActiveGame => current != null;

  bool get hasUnfinishedGame => current != null && !_gameCompleted;

  bool get isOutOfLives => livesLeft <= 0;

  int hintHighlightIdForCell(int index) => _hintHighlights[index] ?? 0;
  int valueAnimationIdForCell(int index) => _valueAnimations[index] ?? 0;
  int incorrectAnimationIdForCell(int index) => _incorrectAnimations[index] ?? 0;

  bool get isSolved {
    final game = current;
    if (game == null) return false;
    for (var i = 0; i < 81; i++) {
      if (game.board[i] != game.solution[i]) {
        return false;
      }
    }
    return true;
  }

  bool get gameCompleted => _gameCompleted;

  DateTime? get activeDailyChallengeDate => _dailyChallengeDate;

  bool isDailyCompleted(DateTime date) {
    return _completedDailyChallenges.contains(_dateKey(_dateOnly(date)));
  }

  int completedDailyCount(DateTime month) {
    final normalized = DateTime(month.year, month.month);
    final prefix =
        '${normalized.year.toString().padLeft(4, '0')}-${normalized.month.toString().padLeft(2, '0')}-';
    return _completedDailyChallenges
        .where((key) => key.startsWith(prefix))
        .length;
  }

  DifficultyStats statsFor(Difficulty diff) =>
      statsByDifficulty[diff] ?? DifficultyStats();

  Difficulty get featuredStatsDifficulty {
    if (currentDifficulty != null) {
      return currentDifficulty!;
    }
    return featuredDifficulty;
  }

  bool get isFeaturedDailyChallenge => _isFeaturedDailyChallenge;

  void selectCell(int index) {
    if (current == null) return;
    selectedCell = index;
    notifyListeners();
  }

  void setHighlightedNumber(int? number) {
    if (highlightedNumber == number) return;
    highlightedNumber = number;
    notifyListeners();
  }

  void handleNumberInput(int number) {
    final idx = selectedCell;
    if (current == null || idx == null) return;
    if (notesMode) {
      toggleNoteAt(idx, number);
    } else {
      makeMove(idx, number);
    }
  }

  bool _isFixedCell(GameState game, int index) {
    return game.given[index] || game.locked[index];
  }

  void _lockCell(GameState game, int index) {
    if (game.locked[index]) {
      return;
    }
    game.locked[index] = true;
    _history.removeWhere((move) => move.index == index);
  }

  void _markCellHinted(int index) {
    _triggerHintHighlights([index]);
    final game = current;
    final value = game?.board[index] ?? 0;
    final triggeredGroup =
        game != null ? _handleNumberCompletion(game, value) : false;
    if (!triggeredGroup) {
      _triggerValueAnimation(index);
    }
  }

  void _triggerValueAnimation(int index) {
    final id = ++_valueAnimationCounter;
    _valueAnimations[index] = id;
    Future.delayed(const Duration(milliseconds: 600), () {
      if (_disposed) {
        return;
      }
      if (_valueAnimations[index] == id) {
        _valueAnimations.remove(index);
        notifyListeners();
      }
    });
  }

  void _triggerIncorrectAnimation(int index) {
    final id = ++_incorrectAnimationCounter;
    _incorrectAnimations[index] = id;
    Future.delayed(const Duration(milliseconds: 360), () {
      if (_disposed) {
        return;
      }
      if (_incorrectAnimations[index] == id) {
        _incorrectAnimations.remove(index);
        notifyListeners();
      }
    });
  }

  void _triggerHintHighlights(Iterable<int> indices) {
    final uniqueIndices = indices.toSet();
    if (uniqueIndices.isEmpty) {
      return;
    }
    final id = ++_hintHighlightCounter;
    for (final index in uniqueIndices) {
      _hintHighlights[index] = id;
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (_disposed) {
          return;
        }
        if (_hintHighlights[index] == id) {
          _hintHighlights.remove(index);
          notifyListeners();
        }
      });
    }
  }

  void _triggerValueAnimations(Iterable<int> indices) {
    for (final index in indices) {
      _triggerValueAnimation(index);
    }
  }

  Map<int, Set<int>> _clearNotesForNumber(GameState game, int value) {
    final removed = <int, Set<int>>{};
    for (var i = 0; i < game.notes.length; i++) {
      final notes = game.notes[i];
      if (notes.remove(value)) {
        removed[i] = <int>{value};
      }
    }
    return removed;
  }

  bool _handleNumberCompletion(GameState game, int value) {
    if (value < 1 || value > 9) {
      return false;
    }
    if (!_isNumberCompleted(game, value)) {
      _completedNumbers.remove(value);
      return false;
    }
    final isNewCompletion = _completedNumbers.add(value);
    if (!isNewCompletion) {
      return false;
    }
    final removedNotes = _clearNotesForNumber(game, value);
    if (removedNotes.isNotEmpty && _history.isNotEmpty) {
      final lastMove = _history.last;
      removedNotes.forEach((index, values) {
        lastMove.removedNotes.putIfAbsent(index, () => <int>{}).addAll(values);
      });
    }
    final indices = <int>[];
    for (var i = 0; i < game.board.length; i++) {
      if (game.solution[i] == value) {
        indices.add(i);
      }
    }
    _triggerHintHighlights(indices);
    _triggerValueAnimations(indices);
    return true;
  }

  void _refreshNumberCompletion(GameState game, int value) {
    if (value < 1 || value > 9) {
      return;
    }
    if (_isNumberCompleted(game, value)) {
      _completedNumbers.add(value);
    } else {
      _completedNumbers.remove(value);
    }
  }

  void makeMove(int index, int value) {
    final game = current;
    if (game == null) return;
    if (_isFixedCell(game, index)) return;
    if (isOutOfLives) return;

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final previousValue = game.board[index];
    final previousNotes = _cloneNotes(index);
    if (previousValue == value) return;

    final correct = isMoveValid(index, value);
    var consumedLife = false;

    _comboSink?.onCellFilled(
      correct: correct,
      timestampMs: timestamp,
      difficulty: currentDifficulty,
    );

    if (!correct) {
      livesLeft = math.max(0, livesLeft - 1);
      consumedLife = true;
      _madeMistake = true;
      _handleMistakeFeedback();
      _triggerIncorrectAnimation(index);
    } else {
      currentScore += 12;
      _handleCorrectFeedback();
      _comboSink?.onNoHintStep(currentDifficulty);
    }

    _history.add(_Move(
      index: index,
      previousValue: previousValue,
      previousNotes: previousNotes,
      consumedLife: consumedLife,
      removedNotes: <int, Set<int>>{},
    ));

    game.board[index] = value;
    game.notes[index].clear();

    _refreshNumberCompletion(game, previousValue);

    if (correct && value != 0) {
      _lockCell(game, index);
      final triggeredGroup = _handleNumberCompletion(game, value);
      if (!triggeredGroup) {
        _triggerValueAnimation(index);
      }
    }

    scheduleSave();
    notifyListeners();
  }

  void toggleNoteAt(int index, int value) {
    final game = current;
    if (game == null) return;
    if (_isFixedCell(game, index)) return;

    final previousNotes = _cloneNotes(index);
    final notes = game.notes[index];
    if (notes.contains(value)) {
      notes.remove(value);
    } else {
      notes.add(value);
    }

    _history.add(_Move(
      index: index,
      previousValue: game.board[index],
      previousNotes: previousNotes,
      noteChange: true,
      removedNotes: <int, Set<int>>{},
    ));

    scheduleSave();
    notifyListeners();
  }

  void eraseCell() {
    final game = current;
    final idx = selectedCell;
    if (game == null || idx == null) return;
    if (_isFixedCell(game, idx)) return;
    if (game.board[idx] == 0 && game.notes[idx].isEmpty) return;

    final previousValue = game.board[idx];
    final previousNotes = _cloneNotes(idx);

    _history.add(_Move(
      index: idx,
      previousValue: previousValue,
      previousNotes: previousNotes,
      removedNotes: <int, Set<int>>{},
    ));

    game.board[idx] = 0;
    game.notes[idx].clear();
    _refreshNumberCompletion(game, previousValue);
    scheduleSave();
    notifyListeners();
  }

  void useHint({String source = 'free'}) {
    final game = current;
    if (game == null) return;
    if (hintsLeft <= 0) return;

    final available = <int>[];
    for (var i = 0; i < game.board.length; i++) {
      if (!_isFixedCell(game, i) && game.board[i] != game.solution[i]) {
        available.add(i);
      }
    }
    if (available.isEmpty) {
      return;
    }

    final idx = available[_random.nextInt(available.length)];

    final previousValue = game.board[idx];
    final previousNotes = _cloneNotes(idx);
    final correct = game.solution[idx];
    if (previousValue == correct) return;

    _history.add(_Move(
      index: idx,
      previousValue: previousValue,
      previousNotes: previousNotes,
      consumedHint: true,
      removedNotes: <int, Set<int>>{},
    ));

    game.board[idx] = correct;
    game.notes[idx].clear();
    _refreshNumberCompletion(game, previousValue);
    _lockCell(game, idx);
    _markCellHinted(idx);
    hintsLeft = math.max(0, hintsLeft - 1);
    _hintsConsumed++;
    currentScore += 8;
    _comboSink?.onHintUsed();
    GameAnalytics.logHintUsed(source: source);
    scheduleSave();
    notifyListeners();
  }

  int get adHintCredits => current?.adHintCredits ?? 0;

  bool get hasAdHintCredit => adHintCredits > 0;

  void addAdHintCredit([int count = 1]) {
    if (count <= 0) {
      return;
    }
    final game = current;
    if (game == null) {
      return;
    }
    game.adHintCredits += count;
    scheduleSave();
    notifyListeners();
  }

  bool consumeAdHintCredit([int count = 1]) {
    if (count <= 0) {
      return true;
    }
    final game = current;
    if (game == null) {
      return false;
    }
    if (game.adHintCredits < count) {
      return false;
    }
    game.adHintCredits -= count;
    scheduleSave();
    notifyListeners();
    return true;
  }

  void toggleNotesMode() {
    if (current == null) return;
    notesMode = !notesMode;
    scheduleSave();
    notifyListeners();
  }

  void undoMove({String source = 'free'}) {
    final game = current;
    if (game == null || _history.isEmpty) return;

    final last = _history.removeLast();
    final currentValue = game.board[last.index];
    game.board[last.index] = last.previousValue;
    game.notes[last.index]
      ..clear()
      ..addAll(last.previousNotes);

    if (last.consumedHint) {
      hintsLeft = math.min(_maxHints, hintsLeft + 1);
      if (_hintsConsumed > 0) {
        _hintsConsumed--;
      }
      _hintHighlights.remove(last.index);
    }

    if (last.consumedLife) {
      livesLeft = math.min(_maxLives, livesLeft + 1);
    }

    if (last.removedNotes.isNotEmpty) {
      last.removedNotes.forEach((index, values) {
        game.notes[index].addAll(values);
      });
    }

    _refreshNumberCompletion(game, currentValue);
    _refreshNumberCompletion(game, last.previousValue);

    selectedCell = last.index;
    GameAnalytics.logUndoUsed(source: source);
    scheduleSave();
    notifyListeners();
  }

  bool grantHint([int count = 1]) {
    if (count <= 0) {
      return false;
    }
    if (hintsLeft >= _maxHints) {
      return false;
    }
    final previous = hintsLeft;
    hintsLeft = math.min(_maxHints, hintsLeft + count);
    if (hintsLeft == previous) {
      return false;
    }
    scheduleSave();
    notifyListeners();
    return true;
  }

  void restoreOneLife({String source = 'free'}) {
    livesLeft = math.min(_maxLives, livesLeft + 1);
    GameAnalytics.logHeartRestore(source: source);
    scheduleSave();
    notifyListeners();
  }

  /// Завершение партии (вызывается, когда все клетки заполнены корректно).
  void completeGame(int elapsedMs) {
    if (current == null) return;
    if (_gameCompleted) return;
    if (!isSolved) return;

    _gameCompleted = true;
    totalStars += 1;
    _handleVictoryFeedback();
    _registerVictory();
    _updateRatePromptProgress();
    _comboSink?.onLevelFinished(
      difficulty: currentDifficulty,
      durationMs: elapsedMs,
    );

    final diff = currentDifficulty;
    if (diff != null) {
      final stats = statsByDifficulty[diff];
      if (stats != null) {
        stats.gamesWon++;
        stats.winsWithTime++;
        stats.totalTimeMs += elapsedMs;
        if (stats.bestTimeMs == 0 || elapsedMs < stats.bestTimeMs) {
          stats.bestTimeMs = elapsedMs;
        }
        if (!_madeMistake) {
          stats.flawlessWins++;
        }
        stats.currentStreak++;
        stats.bestStreak = math.max(stats.bestStreak, stats.currentStreak);
        stats.progressCurrent += 1;
        if (stats.progressCurrent >= stats.progressTarget) {
          stats.level++;
          stats.rank++;
          stats.progressCurrent = 0;
          stats.progressTarget += stats.level ~/ 2 + 5;
          heartBonus = 1;
        }
      }
    }

    final completionTimestamp = DateTime.now();
    _achievementController?.handleGameCompleted(
      isClassicMode:
          currentMode == null || currentMode == GameMode.classic,
      mistakes: _madeMistake ? 1 : 0,
      hintsUsed: _hintsConsumed,
      elapsedMs: elapsedMs,
      dailyStreak: dailyStreak,
      totalClassicWins: totalClassicWins,
      completionDate: completionTimestamp,
    );

    final dailyDate = _dailyChallengeDate;
    if (dailyDate != null) {
      _completeDailyChallenge(dailyDate);
      _dailyChallengeDate = null;
    }

    _clearSavedGame();
    saveProfile();
    notifyListeners();
  }

  void completeBattle(int elapsedMs) {
    final game = current;
    if (game == null) return;
    if (_gameCompleted) return;
    if (!isSolved) return;

    _gameCompleted = true;
    _handleVictoryFeedback();
    _registerVictory();
    _updateRatePromptProgress();
    _comboSink?.onLevelFinished(
      difficulty: currentDifficulty,
      durationMs: elapsedMs,
    );
    battleGamesWon++;
    battleGamesPlayed++;
    game.elapsedMs = elapsedMs;
    final completionTimestamp = DateTime.now();
    _achievementController?.handleGameCompleted(
      isClassicMode:
          currentMode == null || currentMode == GameMode.classic,
      mistakes: _madeMistake ? 1 : 0,
      hintsUsed: _hintsConsumed,
      elapsedMs: elapsedMs,
      dailyStreak: dailyStreak,
      totalClassicWins: totalClassicWins,
      completionDate: completionTimestamp,
    );
    _clearSavedGame();
    saveProfile();
    notifyListeners();
  }

  void registerFailure() {
    _handleDefeatFeedback();
    final diff = currentDifficulty;
    if (diff != null) {
      final stats = statsByDifficulty[diff];
      if (stats != null) {
        stats.currentStreak = 0;
      }
    }
    _achievementController?.handleGameFailed();
    _dailyChallengeDate = null;
    _clearSavedGame();
    _resetComboTracking();
    saveProfile();
    notifyListeners();
  }

  void loseBattle() {
    if (currentMode == GameMode.battle) {
      battleGamesPlayed++;
    }
    _handleDefeatFeedback();
    _achievementController?.handleGameFailed();
    abandonGame();
    saveProfile();
  }

  void abandonGame() {
    current = null;
    currentDifficulty = null;
    currentMode = null;
    _resetGameFlags();
    _dailyChallengeDate = null;
    _clearSavedGame();
    _resetComboTracking();
    notifyListeners();
  }

  /// Подсчёт оставшихся чисел для панели управления.
  int countRemaining(int number) {
    final game = current;
    if (game == null) return 9;
    return 9 - game.board.where((v) => v == number).length;
  }

  bool isNumberCompleted(int number) {
    final game = current;
    if (game == null) return false;
    return _isNumberCompleted(game, number);
  }

  bool _isNumberCompleted(GameState game, int number) {
    if (number < 1 || number > 9) {
      return false;
    }
    var count = 0;
    for (var i = 0; i < game.board.length; i++) {
      if (game.solution[i] == number) {
        if (game.board[i] != number) {
          return false;
        }
        count++;
      }
    }
    return count == 9;
  }

  bool get canUndoMove => _history.isNotEmpty;

  bool get canErase {
    final game = current;
    final idx = selectedCell;
    if (game == null || idx == null) return false;
    if (_isFixedCell(game, idx)) return false;
    if (game.board[idx] == 0 && game.notes[idx].isEmpty) return false;
    return true;
  }

  bool get isNotesMode => notesMode;

  bool get canUseHint => hintsLeft > 0 || adHintCredits > 0;

  int get hintsConsumed => _hintsConsumed;

  int? get selectedValue {
    final idx = selectedCell;
    final game = current;
    if (idx == null || game == null) return null;
    final value = game.board[idx];
    return value == 0 ? null : value;
  }

  bool isMoveValid(int index, int value) {
    final game = current;
    if (game == null) return false;
    if (value == 0) return true;
    return game.solution[index] == value;
  }

  bool hasConflict(int index) {
    final game = current;
    if (game == null) return false;
    final value = game.board[index];
    if (value == 0) return false;

    for (final peer in _peersOf(index)) {
      if (peer != index && game.board[peer] == value) {
        return true;
      }
    }
    return !isMoveValid(index, value);
  }

  bool isPeerOfSelected(int index) {
    final selected = selectedCell;
    if (selected == null || selected == index) return false;
    return _peersOf(selected).contains(index);
  }

  bool isSameAsSelectedValue(int index) {
    final selected = selectedCell;
    final game = current;
    if (selected == null || game == null) return false;
    if (game.board[selected] == 0) return false;
    return game.board[index] == game.board[selected];
  }

  bool isHighlightedCandidate(int index) {
    final number = highlightedNumber;
    final game = current;
    if (number == null || game == null) return false;
    if (game.board[index] != 0) return false;
    return game.solution[index] == number;
  }

  List<int> rowIndices(int index) {
    final row = index ~/ 9;
    return List.generate(9, (i) => row * 9 + i);
  }

  List<int> columnIndices(int index) {
    final col = index % 9;
    return List.generate(9, (i) => col + i * 9);
  }

  List<int> boxIndices(int index) {
    final row = index ~/ 9;
    final col = index % 9;
    final startRow = (row ~/ 3) * 3;
    final startCol = (col ~/ 3) * 3;
    final indices = <int>[];
    for (var r = startRow; r < startRow + 3; r++) {
      for (var c = startCol; c < startCol + 3; c++) {
        indices.add(r * 9 + c);
      }
    }
    return indices;
  }

  Set<int> _peersOf(int index) {
    final peers = <int>{}
      ..addAll(rowIndices(index))
      ..addAll(columnIndices(index))
      ..addAll(boxIndices(index));
    peers.remove(index);
    return peers;
  }

  Set<int> _cloneNotes(int index) {
    final game = current;
    if (game == null) return <int>{};
    return {...game.notes[index]};
  }

  void _handleCorrectFeedback() {
    _playSound(SystemSoundType.click);
    _triggerVibration(HapticFeedback.selectionClick);
  }

  void _handleMistakeFeedback() {
    if (!vibrationEnabled) {
      return;
    }
    unawaited(_triggerMistakeVibration());
  }

  void _handleVictoryFeedback() {
    _playSound(SystemSoundType.alert);
    _triggerVibration(HapticFeedback.mediumImpact);
  }

  void _handleDefeatFeedback() {
    _playSound(SystemSoundType.alert);
    _triggerVibration(HapticFeedback.heavyImpact);
  }

  void _playSound(SystemSoundType type) {
    if (!soundsEnabled) return;
    SystemSound.play(type);
  }

  void _triggerVibration(Future<void> Function() callback) {
    if (!vibrationEnabled) return;
    callback();
  }

  Future<void> _triggerMistakeVibration() async {
    if (!vibrationEnabled) {
      return;
    }
    if (kIsWeb) {
      return;
    }
    try {
      final hasVibrator = await Vibration.hasVibrator();
      if (hasVibrator != true) {
        return;
      }
      await Vibration.vibrate(duration: 80);
    } catch (_) {
      // Silently ignore failures so that a missing vibrator does not crash the app.
    }
  }

  void _completeDailyChallenge(DateTime date) {
    final normalized = _dateOnly(date);
    final key = _dateKey(normalized);
    final added = _completedDailyChallenges.add(key);
    if (added) {
      _saveDailyProgress();
    }
    _refreshDailyStreak();
  }

  void _saveDailyProgress() {
    final sorted = _completedDailyChallenges.toList()..sort();
    _persist((prefs) async {
      await prefs.setStringList('dailyCompleted', sorted);
    });
  }

  void _refreshDailyStreak() {
    final lastVictory = _lastVictoryDate;
    if (lastVictory == null) {
      dailyStreak = 0;
      return;
    }

    final today = _dateOnly(DateTime.now());
    final normalizedLast = _dateOnly(lastVictory);

    if (normalizedLast.isAfter(today)) {
      dailyStreak = 0;
      _lastVictoryDate = null;
      return;
    }

    if (normalizedLast == today) {
      dailyStreak = math.max(dailyStreak, 1);
      return;
    }

    if (normalizedLast == today.subtract(const Duration(days: 1))) {
      dailyStreak = math.max(dailyStreak, 1);
      return;
    }

    dailyStreak = 0;
  }

  void _registerVictory() {
    _refreshDailyStreak();

    final today = _dateOnly(DateTime.now());
    final lastVictory = _lastVictoryDate == null
        ? null
        : _dateOnly(_lastVictoryDate!);

    if (lastVictory == today) {
      dailyStreak = math.max(dailyStreak, 1);
      return;
    }

    if (lastVictory != null &&
        lastVictory == today.subtract(const Duration(days: 1))) {
      dailyStreak = math.max(0, dailyStreak) + 1;
    } else {
      dailyStreak = 1;
    }

    _lastVictoryDate = today;
  }

  void _updateRatePromptProgress() {
    if (_hasRated) {
      _ratePromptPending = false;
      _saveRatePromptState();
      return;
    }

    final today = _dateOnly(DateTime.now());

    if (_rateWinsDate == null || _rateWinsDate != today) {
      _rateWinsDate = today;
      _rateWinsCount = 0;
      _ratePromptPending = false;
    }

    _rateWinsCount++;

    final hasPromptedToday =
        _lastRatePromptDate != null && _lastRatePromptDate == today;
    if (!hasPromptedToday && _rateWinsCount >= 3) {
      _ratePromptPending = true;
    }

    _saveRatePromptState();
  }

  bool get hasPendingRatePrompt => !_hasRated && _ratePromptPending;

  bool get hasRated => _hasRated;

  bool consumePendingRatePrompt() {
    if (_hasRated) {
      _ratePromptPending = false;
      return false;
    }

    if (!_ratePromptPending) {
      return false;
    }
    _ratePromptPending = false;
    return true;
  }

  void handleRateDialogResult(bool didRequestReview) {
    final today = _dateOnly(DateTime.now());
    _lastRatePromptDate = today;
    _ratePromptPending = false;
    if (didRequestReview) {
      markUserRated();
    }
    _saveRatePromptState();
  }

  void markUserRated() {
    if (_hasRated) {
      return;
    }
    _hasRated = true;
    _ratePromptPending = false;
    _rateWinsDate = null;
    _rateWinsCount = 0;
    _persist((prefs) async {
      await prefs.setBool('hasRated', true);
    });
    _saveRatePromptState();
  }

  void _saveRatePromptState() {
    final promptDate =
        _lastRatePromptDate == null ? null : _dateOnly(_lastRatePromptDate!);
    final winsDate = _rateWinsDate == null ? null : _dateOnly(_rateWinsDate!);

    _persist((prefs) async {
      if (promptDate != null) {
        await prefs.setString('ratePromptDate', promptDate.toIso8601String());
      } else {
        await prefs.remove('ratePromptDate');
      }

      if (winsDate != null) {
        await prefs.setString('rateWinsDate', winsDate.toIso8601String());
        await prefs.setInt('rateWinsCount', _rateWinsCount);
      } else {
        await prefs.remove('rateWinsDate');
        await prefs.remove('rateWinsCount');
      }
    });
  }

  static DateTime _dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static String _dateKey(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

  Future<void> save() async {
    _saveDebounce?.cancel();
    _saveDebounce = null;
    try {
      final prefs = await SharedPreferences.getInstance();
      await _saveCurrentGame(prefs);
    } catch (e) {
      assert(() {
        debugPrint('AppState.save error: $e');
        return true;
      }());
    }
  }

  void scheduleSave() {
    _saveDebounce?.cancel();
    _saveDebounce = Timer(
      const Duration(milliseconds: 400),
      () => unawaited(save()),
    );
  }

  Future<void> _saveCurrentGame(SharedPreferences prefs) async {
    final snapshot = _buildCurrentGameSnapshot();
    if (snapshot == null) {
      await prefs.remove('currentGame');
      return;
    }

    try {
      final serialized = await _serializeGameSnapshot(snapshot);
      await prefs.setString('currentGame', serialized);
    } catch (error, stackTrace) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
          library: 'models',
          context: ErrorDescription('while serializing current game snapshot'),
        ),
      );
    }
  }

  Map<String, dynamic>? _buildCurrentGameSnapshot() {
    final game = current;
    final diff = currentDifficulty;
    final mode = currentMode;
    if (mode == GameMode.battle) {
      return null;
    }
    if (game == null || diff == null || _gameCompleted) {
      return null;
    }

    return {
      'difficulty': diff.name,
      'board': game.board,
      'solution': game.solution,
      'given': game.given,
      'locked': game.locked,
      'notes': game.notes.map((set) => set.toList()).toList(),
      'currentScore': currentScore,
      'selectedCell': selectedCell,
      'notesMode': notesMode,
      'hintsLeft': hintsLeft,
      'adHintCredits': game.adHintCredits,
      'hintsConsumed': _hintsConsumed,
      'livesLeft': livesLeft,
      'madeMistake': _madeMistake,
      'startedAt': _startedAt?.toIso8601String(),
      'sessionId': _sessionId,
      'history': _history.map((move) => move.toJson()).toList(),
      'dailyDate': _dailyChallengeDate?.toIso8601String(),
      'gameId': _currentGameId,
      'mode': mode?.name,
    };
  }

  void _clearSavedGame() {
    _persist((prefs) async {
      await prefs.remove('currentGame');
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _saveDebounce?.cancel();
    super.dispose();
  }

  void _persist(Future<void> Function(SharedPreferences prefs) save) {
    SharedPreferences.getInstance().then(save);
  }
}

class ProfileSnapshot {
  final int? dailyStreak;
  final DateTime? lastVictoryDate;
  final int? totalStars;
  final int? championshipScore;
  final int? battleGamesWon;
  final int? battleGamesPlayed;
  final int? heartBonus;
  final String? playerFlag;
  final Map<String, Map<String, dynamic>>? stats;
  final int? legacyBattleWins;

  const ProfileSnapshot({
    this.dailyStreak,
    this.lastVictoryDate,
    this.totalStars,
    this.championshipScore,
    this.battleGamesWon,
    this.battleGamesPlayed,
    this.heartBonus,
    this.playerFlag,
    this.stats,
    this.legacyBattleWins,
  });
}

class GameSnapshot {
  final String? difficulty;
  final String? mode;
  final List<int>? board;
  final List<int>? solution;
  final List<bool>? given;
  final List<bool>? locked;
  final List<List<int>> notes;
  final int adHintCredits;
  final int? currentScore;
  final int? selectedCell;
  final bool? notesMode;
  final int? hintsLeft;
  final int? hintsConsumed;
  final int? livesLeft;
  final bool? madeMistake;
  final DateTime? startedAt;
  final int? sessionId;
  final List<Map<String, dynamic>> history;
  final DateTime? dailyDate;
  final String? gameId;

  const GameSnapshot({
    this.difficulty,
    this.mode,
    this.board,
    this.solution,
    this.given,
    this.locked,
    this.notes = const <List<int>>[],
    this.adHintCredits = 0,
    this.currentScore,
    this.selectedCell,
    this.notesMode,
    this.hintsLeft,
    this.hintsConsumed,
    this.livesLeft,
    this.madeMistake,
    this.startedAt,
    this.sessionId,
    this.history = const <Map<String, dynamic>>[],
    this.dailyDate,
    this.gameId,
  });
}

Future<ProfileSnapshot?> _parseProfileSnapshot(String source) {
  if (kIsWeb) {
    return Future.value(_decodeProfileSnapshot(source));
  }
  return compute(_decodeProfileSnapshot, source);
}

Future<GameSnapshot?> _parseGameSnapshot(String source) {
  if (kIsWeb) {
    return Future.value(_decodeGameSnapshot(source));
  }
  return compute(_decodeGameSnapshot, source);
}

ProfileSnapshot? _decodeProfileSnapshot(String source) {
  try {
    final decoded = jsonDecode(source);
    if (decoded is! Map) {
      return null;
    }
    final map = decoded.cast<String, dynamic>();
    final legacyBattleWins = (map['battleWinRate'] as num?)?.toInt();
    Map<String, Map<String, dynamic>>? stats;
    final statsRaw = map['stats'];
    if (statsRaw is Map) {
      stats = <String, Map<String, dynamic>>{};
      statsRaw.forEach((key, value) {
        if (key is String && value is Map) {
          stats![key] = Map<String, dynamic>.from(value);
        }
      });
    }

    DateTime? lastVictoryDate;
    final lastVictory = map['lastVictoryDate'];
    if (lastVictory is String && lastVictory.isNotEmpty) {
      lastVictoryDate = DateTime.tryParse(lastVictory);
    }

    return ProfileSnapshot(
      dailyStreak: (map['dailyStreak'] as num?)?.toInt(),
      lastVictoryDate: lastVictoryDate,
      totalStars: (map['totalStars'] as num?)?.toInt(),
      championshipScore: (map['championshipScore'] as num?)?.toInt(),
      battleGamesWon: (map['battleGamesWon'] as num?)?.toInt(),
      battleGamesPlayed: (map['battleGamesPlayed'] as num?)?.toInt(),
      heartBonus: (map['heartBonus'] as num?)?.toInt(),
      playerFlag: map['playerFlag'] as String?,
      stats: stats,
      legacyBattleWins: legacyBattleWins,
    );
  } catch (_) {
    return null;
  }
}

GameSnapshot? _decodeGameSnapshot(String source) {
  try {
    final decoded = jsonDecode(source);
    if (decoded is! Map) {
      return null;
    }
    final map = decoded.cast<String, dynamic>();

    List<int>? _readIntList(dynamic value) {
      if (value is List) {
        final result = <int>[];
        for (final element in value) {
          if (element is num) {
            result.add(element.toInt());
          } else {
            return null;
          }
        }
        return result;
      }
      return null;
    }

    List<bool>? _readBoolList(dynamic value) {
      if (value is List) {
        final result = <bool>[];
        for (final element in value) {
          if (element is bool) {
            result.add(element);
          } else {
            return null;
          }
        }
        return result;
      }
      return null;
    }

    final notes = <List<int>>[];
    final notesRaw = map['notes'];
    if (notesRaw is List) {
      for (final entry in notesRaw) {
        if (entry is List) {
          final result = <int>[];
          for (final value in entry) {
            if (value is num) {
              result.add(value.toInt());
            } else {
              return null;
            }
          }
          notes.add(result);
        } else {
          notes.add(const <int>[]);
        }
      }
    }

    final history = <Map<String, dynamic>>[];
    final historyRaw = map['history'];
    if (historyRaw is List) {
      for (final entry in historyRaw) {
        if (entry is Map) {
          history.add(Map<String, dynamic>.from(entry));
        }
      }
    }

    DateTime? _tryParseDate(dynamic value) {
      if (value is String && value.isNotEmpty) {
        return DateTime.tryParse(value);
      }
      return null;
    }

    return GameSnapshot(
      difficulty: map['difficulty'] as String?,
      mode: map['mode'] as String?,
      board: _readIntList(map['board']),
      solution: _readIntList(map['solution']),
      given: _readBoolList(map['given']),
      locked: _readBoolList(map['locked']),
      notes: notes,
      adHintCredits: (map['adHintCredits'] as num?)?.toInt() ?? 0,
      currentScore: (map['currentScore'] as num?)?.toInt(),
      selectedCell: (map['selectedCell'] as num?)?.toInt(),
      notesMode: map['notesMode'] as bool?,
      hintsLeft: (map['hintsLeft'] as num?)?.toInt(),
      hintsConsumed: (map['hintsConsumed'] as num?)?.toInt(),
      livesLeft: (map['livesLeft'] as num?)?.toInt(),
      madeMistake: map['madeMistake'] as bool?,
      startedAt: _tryParseDate(map['startedAt']),
      sessionId: (map['sessionId'] as num?)?.toInt(),
      history: history,
      dailyDate: _tryParseDate(map['dailyDate']),
      gameId: (map['gameId'] as String?)?.trim(),
    );
  } catch (_) {
    return null;
  }
}

Future<String> _serializeProfileSnapshot(Map<String, dynamic> snapshot) {
  if (kIsWeb) {
    return Future.value(jsonEncode(snapshot));
  }
  return compute(_encodeProfileSnapshot, snapshot);
}

String _encodeProfileSnapshot(Map<String, dynamic> snapshot) {
  return jsonEncode(snapshot);
}

Future<String> _serializeGameSnapshot(Map<String, dynamic> snapshot) {
  if (kIsWeb) {
    return Future.value(jsonEncode(snapshot));
  }
  return compute(_encodeGameSnapshot, snapshot);
}

String _encodeGameSnapshot(Map<String, dynamic> snapshot) {
  return jsonEncode(snapshot);
}

class _Move {
  final int index;
  final int previousValue;
  final Set<int> previousNotes;
  final bool consumedHint;
  final bool consumedLife;
  final bool noteChange;
  final Map<int, Set<int>> removedNotes;

  _Move({
    required this.index,
    required this.previousValue,
    required this.previousNotes,
    this.consumedHint = false,
    this.consumedLife = false,
    this.noteChange = false,
    Map<int, Set<int>>? removedNotes,
  }) : removedNotes = removedNotes != null
            ? {
                for (final entry in removedNotes.entries)
                  entry.key: Set<int>.from(entry.value),
              }
            : <int, Set<int>>{};

  Map<String, dynamic> toJson() => {
        'index': index,
        'previousValue': previousValue,
        'previousNotes': previousNotes.toList(),
        'consumedHint': consumedHint,
        'consumedLife': consumedLife,
        'noteChange': noteChange,
        'removedNotes': removedNotes.map(
          (key, value) => MapEntry(key.toString(), value.toList()),
        ),
      };

  factory _Move.fromJson(Map<String, dynamic> json) => _Move(
        index: (json['index'] as num?)?.toInt() ?? 0,
        previousValue: (json['previousValue'] as num?)?.toInt() ?? 0,
        previousNotes: ((json['previousNotes'] as List?)
                ?.map((e) => (e as num).toInt())
                .toSet()) ??
            <int>{},
        consumedHint: json['consumedHint'] as bool? ?? false,
        consumedLife: json['consumedLife'] as bool? ?? false,
        noteChange: json['noteChange'] as bool? ?? false,
        removedNotes: () {
          final raw = json['removedNotes'];
          if (raw is Map) {
            final result = <int, Set<int>>{};
            raw.forEach((key, value) {
              final index = int.tryParse(key.toString());
              if (index == null || index < 0) {
                return;
              }
              final values = (value as List?)
                      ?.map((e) => (e as num).toInt())
                      .toSet() ??
                  <int>{};
              result[index] = values;
            });
            return result;
          }
          return <int, Set<int>>{};
        }(),
      );
}

Map<Difficulty, DifficultyStats> _defaultStats() => {
      for (final diff in Difficulty.values) diff: DifficultyStats(),
    };
