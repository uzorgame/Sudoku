import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sudoku2/flutter_gen/gen_l10n/app_localizations.dart';

import '../ads/rewarded_service.dart';
import '../analytics/game_analytics.dart';
import '../models.dart';
import '../settings_page.dart';
import '../theme.dart';
import '../widgets/board.dart';
import '../widgets/control_panel.dart';
import '../widgets/theme_menu.dart';
import '../widgets/rate_app_dialog.dart';
import 'flag_avatar.dart';
import 'flag_picker.dart';
import 'flags.dart';
import 'flag_utils.dart';
import '../ui/effects/victory_confetti_overlay.dart';

const int _kBattleInitialLives = 3;
const double _kBattleOpponentTempoModifier = 0.85;
const double _kBattleOpponentFallbackTempo = 0.15;
const double _kBattleOpponentMinTempo =
    0.12 * _kBattleOpponentTempoModifier;

class BattlePage extends StatefulWidget {
  final Difficulty? difficulty;

  const BattlePage({super.key, this.difficulty});

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final GlobalKey<VictoryConfettiOverlayState> _confettiKey =
      GlobalKey<VictoryConfettiOverlayState>();
  final ValueNotifier<int> _elapsedVN = ValueNotifier<int>(0);
  Timer? _timer;
  Ticker? _opponentTicker;
  static const Duration _kBattleBackgroundForfeitDuration = Duration(seconds: 10);
  Timer? _battleLossTimer;
  DateTime? _backgroundedAt;
  bool _pendingBattleDefeatDialog = false;
  bool _battleForfeitHandled = false;

  AppState? _appState;
  late final VoidCallback _appStateListener;

  bool _victoryShown = false;
  bool _defeatShown = false;
  bool _battleLossRecorded = false;
  bool _exitEventLogged = false;
  bool _opponentFinished = false;
  int _observedSession = -1;

  final math.Random _random = math.Random();

  String _opponentName = '';
  String _opponentFlag = '';
  double _opponentProgress = 0;
  int _opponentSolvedCells = 0;
  int _opponentTargetSolvedCells = 0;
  int _burstStartSolvedCells = 0;
  int _currentBurstCells = 0;
  bool _opponentInBurst = false;
  Duration _nextOpponentAction = Duration.zero;
  Duration _burstStartTime = Duration.zero;
  double _burstDurationSeconds = 0.5;
  double _baseOpponentTempo = 0.05; // cells per second
  Duration _lastTick = Duration.zero;
  bool _flagFlowInProgress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _appStateListener = _handleAppStateChanged;
    unawaited(RewardedService.instance.preloadHint());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _subscribeToAppState();
  }

  void _subscribeToAppState() {
    final app = context.read<AppState>();
    if (_appState == app) {
      return;
    }

    _appState?.removeListener(_appStateListener);
    _appState = app;
    app.addListener(_appStateListener);

    _ensureGameStarted(app);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(_promptForFlagIfNeeded(app));
    });
    _observedSession = app.sessionId;
    _victoryShown = false;
    _defeatShown = false;
    _battleLossRecorded = false;
    final startMs = app.current?.elapsedMs ?? 0;
    _startTimer(app, startMs);
    _setupOpponent(app, resetProfile: true);
    _scheduleHandleGameState();
  }

  void _ensureGameStarted(AppState app) {
    if (app.current != null && app.currentMode == GameMode.battle) {
      return;
    }
    final difficulty = widget.difficulty ?? app.currentDifficulty ?? app.featuredStatsDifficulty;
    app.startBattleGame(difficulty);
  }

  Future<void> _promptForFlagIfNeeded(AppState app) async {
    if (!mounted) return;
    if (_flagFlowInProgress) return;
    if ((app.playerFlag?.isNotEmpty ?? false)) return;

    _flagFlowInProgress = true;
    try {
      await Future<void>.delayed(Duration.zero);
      while (mounted && !(ModalRoute.of(context)?.isCurrent ?? false)) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }

      while (mounted && (app.playerFlag == null || app.playerFlag!.isEmpty)) {
        final selected = await showFlagPicker(context);
        if (!mounted) return;

        while (mounted && !(ModalRoute.of(context)?.isCurrent ?? false)) {
          await Future<void>.delayed(const Duration(milliseconds: 50));
        }

        if (selected == null || selected.isEmpty) {
          break;
        }

        final confirmed = await _showFlagConfirmationDialog(selected);
        if (!mounted) return;

        if (confirmed == true) {
          app.setPlayerFlag(selected);
          return;
        }
      }

      if (mounted && (app.playerFlag == null || app.playerFlag!.isEmpty)) {
        // app.setPlayerFlag(kWorldFlags.first);
      }
    } finally {
      _flagFlowInProgress = false;
    }
  }

  Future<bool?> _showFlagConfirmationDialog(String flag) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final scheme = theme.colorScheme;
        return Dialog(
          backgroundColor: scheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  l10n.confirmFlagSelectionTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  flag,
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.confirmFlagSelectionMessage,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurface.withOpacity(0.7),
                      ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(l10n.cancel),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text(l10n.confirmFlagSelectionConfirm),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleAppStateChanged() {
    final app = _appState;
    if (app == null || !mounted) {
      return;
    }

    if (_observedSession != app.sessionId) {
      _observedSession = app.sessionId;
      _victoryShown = false;
      _defeatShown = false;
      _battleLossRecorded = false;
      final startMs = app.current?.elapsedMs ?? 0;
      _startTimer(app, startMs);
      _setupOpponent(app, resetProfile: true);
    }

    _scheduleHandleGameState();
  }

  void _startTimer(AppState app, int startMs) {
    _resetBattleForfeitState();
    _timer?.cancel();
    _elapsedVN.value = startMs;
    final current = app.current;
    if (current != null) {
      current.elapsedMs = startMs;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsedVN.value += 1000;
    });
  }

  void _resetBattleForfeitState() {
    _battleForfeitHandled = false;
    _pendingBattleDefeatDialog = false;
    _backgroundedAt = null;
    _cancelBattleLossCountdown();
  }

  void _startBattleLossCountdown() {
    if (_battleForfeitHandled) {
      return;
    }
    _backgroundedAt = DateTime.now();
    _battleLossTimer?.cancel();
    _battleLossTimer =
        Timer(_kBattleBackgroundForfeitDuration, _handleBattleForfeit);
  }

  void _cancelBattleLossCountdown() {
    _battleLossTimer?.cancel();
    _battleLossTimer = null;
  }

  void _logGameExitEvent() {
    if (_exitEventLogged) {
      return;
    }
    _exitEventLogged = true;
    GameAnalytics.logGameExit();
  }

  void _handleBattleForfeit() {
    if (_battleForfeitHandled) {
      return;
    }
    _battleForfeitHandled = true;
    _cancelBattleLossCountdown();
    final app = _appState ?? context.read<AppState>();
    if (app.current != null) {
      app.current!.elapsedMs = _elapsedVN.value;
      unawaited(app.save());
    }
    _timer?.cancel();
    _opponentTicker?.stop();
    _defeatShown = true;
    if (!_battleLossRecorded) {
      _battleLossRecorded = true;
      app.loseBattle();
    }
    _pendingBattleDefeatDialog = true;
    if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
      _showPendingBattleDefeatDialog(app);
    }
  }

  void _showPendingBattleDefeatDialog(AppState app) {
    if (!_pendingBattleDefeatDialog || !mounted) {
      return;
    }
    if (!(ModalRoute.of(context)?.isCurrent ?? false)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showPendingBattleDefeatDialog(app);
      });
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_pendingBattleDefeatDialog) {
        return;
      }
      _pendingBattleDefeatDialog = false;
      _showDefeatDialog(app);
    });
  }

  void _setupOpponent(AppState app, {bool resetProfile = false}) {
    final game = app.current;
    if (game == null) {
      return;
    }

    final initialSolved = _countSolvedCells(game);
    final totalCells = _countPlayableCells(game);
    final initialProgress =
        totalCells == 0 ? 0.0 : initialSolved / totalCells.toDouble();
    final nextOpponentName =
        resetProfile || _opponentName.isEmpty ? _generateOpponentName() : _opponentName;
    final nextOpponentFlag = resetProfile || _opponentFlag.isEmpty
        ? randomFlag(random: _random, exclude: app.playerFlag?.trim())
        : _opponentFlag;

    setState(() {
      _opponentName = nextOpponentName;
      _opponentFlag = nextOpponentFlag;
      _opponentProgress = initialProgress;
      _opponentSolvedCells = initialSolved;
      _opponentTargetSolvedCells = initialSolved;
      _opponentFinished =
          totalCells <= 0 ? true : initialSolved >= totalCells;
      _defeatShown = false;
      _battleLossRecorded = false;
    });

    _baseOpponentTempo = _estimateOpponentTempo(app, totalCells);
    _opponentInBurst = false;
    _currentBurstCells = 0;
    _burstStartSolvedCells = initialSolved;
    _burstDurationSeconds = 0.5;
    _nextOpponentAction =
        Duration(milliseconds: 400 + _random.nextInt(600));
    _burstStartTime = Duration.zero;
    _lastTick = Duration.zero;

    _opponentTicker?.dispose();
    _opponentTicker = createTicker(_handleOpponentTick)..start();
  }

  void _handleOpponentTick(Duration elapsed) {
    final dt = (elapsed - _lastTick).inMilliseconds / 1000.0;
    _lastTick = elapsed;
    if (dt <= 0 || _opponentFinished) {
      return;
    }
    final game = _appState?.current;
    if (game == null) {
      return;
    }
    final totalCells = _countPlayableCells(game);
    if (totalCells <= 0) {
      _opponentTicker?.stop();
      return;
    }

    if (_opponentInBurst) {
      final elapsedInBurst =
          (elapsed - _burstStartTime).inMilliseconds / 1000.0;
      final burstProgress =
          (elapsedInBurst / _burstDurationSeconds).clamp(0.0, 1.0);
      final double solvedDouble =
          _burstStartSolvedCells + _currentBurstCells * burstProgress;
      final double clampedSolved =
          solvedDouble.clamp(0.0, totalCells.toDouble());
      final double progressValue =
          totalCells == 0 ? 0.0 : (clampedSolved / totalCells).clamp(0.0, 1.0);
      final int animatedSolved = clampedSolved.floor();
      final bool burstCompleted = burstProgress >= 1.0;

      if (!mounted) {
        _opponentTicker?.stop();
        return;
      }

      setState(() {
        if (burstCompleted) {
          final solved = math.min(_opponentTargetSolvedCells, totalCells);
          _opponentSolvedCells = solved;
          _opponentProgress = totalCells == 0
              ? 0.0
              : solved / totalCells;
          if (solved >= totalCells) {
            _opponentFinished = true;
            _opponentProgress = 1.0;
            _opponentSolvedCells = totalCells;
          }
        } else {
          _opponentProgress = progressValue;
          _opponentSolvedCells = math.min(animatedSolved, totalCells);
        }
      });

      if (burstCompleted) {
        _opponentInBurst = false;
        if (_opponentFinished) {
          _opponentTicker?.stop();
          _scheduleHandleGameState();
          return;
        }
        final expectedSeconds = _currentBurstCells /
            math.max(_baseOpponentTempo, 0.001);
        final baselinePause =
            math.max(0.2, expectedSeconds - _burstDurationSeconds);
        final jitter = 0.7 + _random.nextDouble() * 0.6;
        final pauseSeconds =
            (baselinePause * jitter).clamp(0.3, 3.5);
        _nextOpponentAction = elapsed +
            Duration(milliseconds: (pauseSeconds * 1000).round());
      }
      return;
    }

    if (elapsed >= _nextOpponentAction) {
      _startOpponentBurst(elapsed, totalCells);
    }
  }

  void _startOpponentBurst(Duration elapsed, int totalCells) {
    if (_opponentFinished) {
      return;
    }

    final remaining = totalCells - _opponentSolvedCells;
    if (remaining <= 0) {
      if (!mounted) {
        _opponentTicker?.stop();
        return;
      }
      setState(() {
        _opponentFinished = true;
        _opponentProgress = 1.0;
        _opponentSolvedCells = totalCells;
      });
      _opponentTicker?.stop();
      _scheduleHandleGameState();
      return;
    }

    final maxJump = math.min(3, remaining);
    final jump = 1 + _random.nextInt(maxJump);
    final targetSolved = math.min(totalCells, _opponentSolvedCells + jump);
    _currentBurstCells = targetSolved - _opponentSolvedCells;
    if (_currentBurstCells <= 0) {
      _nextOpponentAction =
          elapsed + Duration(milliseconds: 400 + _random.nextInt(600));
      return;
    }

    _opponentTargetSolvedCells = targetSolved;
    _burstStartSolvedCells = _opponentSolvedCells;
    _burstDurationSeconds = 0.35 + _random.nextDouble() * 0.45;
    _burstStartTime = elapsed;
    _opponentInBurst = true;
    _nextOpponentAction =
        elapsed + Duration(milliseconds: (_burstDurationSeconds * 1000).round());
  }

  int _countSolvedCells(GameState game) {
    var solved = 0;
    for (var i = 0; i < game.board.length; i++) {
      if (!game.given[i] &&
          game.board[i] != 0 &&
          game.board[i] == game.solution[i]) {
        solved++;
      }
    }
    return solved;
  }

  int _countPlayableCells(GameState game) {
    var playable = 0;
    for (var i = 0; i < game.given.length; i++) {
      if (!game.given[i]) {
        playable++;
      }
    }
    return playable;
  }

  double _estimateOpponentTempo(AppState app, int totalCells) {
    final diff = app.currentDifficulty ?? app.featuredStatsDifficulty;
    final stats = app.statsFor(diff);
    int averageMs;
    if (stats.winsWithTime > 0) {
      averageMs = stats.totalTimeMs ~/ math.max(1, stats.winsWithTime);
    } else {
      averageMs = 8 * 60 * 1000;
    }
    averageMs = averageMs.clamp(4 * 60 * 1000, 18 * 60 * 1000);
    final averageSeconds = averageMs / 1000.0;
    double baseTempo;
    if (averageSeconds <= 0 || totalCells <= 0) {
      baseTempo = _kBattleOpponentFallbackTempo;
    } else {
      baseTempo = totalCells / averageSeconds;
    }
    final factor = 0.8 + _random.nextDouble() * 0.4;
    final tempo = baseTempo * factor * _kBattleOpponentTempoModifier;
    if (tempo <= 0) {
      return _kBattleOpponentMinTempo;
    }
    return tempo;
  }

  String _generateOpponentName() {
    const names = [
      'Max',
      'Olivia',
      'Noah',
      'Mia',
      'Aria',
      'Liam',
      'Eva',
      'Kai',
      'Nora',
      'Leo',
      'Ava',
      'Hugo',
      'Sofia',
      'Mason',
      'Elena',
      'Yuki',
      'Mateo',
      'Ivy',
      'Felix',
      'Noel',
      'Sven',
      'Amir',
      'Mila',
      'Nia',
      'Ezra',
      'Omar',
      'Elio',
      'Anya',
      'Iris',
      'Jules',
    ];
    return names[_random.nextInt(names.length)];
  }

  void _scheduleHandleGameState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final app = _appState;
      if (app == null) return;
      _handleGameState(app);
    });
  }

  void _handleGameState(AppState app) {
    final game = app.current;
    if (game == null || app.currentMode != GameMode.battle) {
      return;
    }

    if (app.isSolved && !app.gameCompleted) {
      final ms = _elapsedVN.value;
      game.elapsedMs = ms;
      app.completeBattle(ms);
      _opponentTicker?.stop();
      if (!_victoryShown) {
        _victoryShown = true;
        GameAnalytics.logPuzzleWin();
        _confettiKey.currentState?.play();
        _showVictoryDialog(app);
      }
      return;
    }

    if (!_defeatShown) {
      if (app.isOutOfLives) {
        _defeatShown = true;
        _battleLossRecorded = false;
        _timer?.cancel();
        _opponentTicker?.stop();
        _showDefeatDialog(app);
        return;
      }

      if (_opponentFinished && !app.isSolved) {
        _defeatShown = true;
        _battleLossRecorded = false;
        _timer?.cancel();
        _opponentTicker?.stop();
        _showDefeatDialog(app);
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    _opponentTicker?.dispose();
    _cancelBattleLossCountdown();

    _logGameExitEvent();

    final app = _appState;
    if (app != null) {
      if (_defeatShown && !_battleLossRecorded) {
        _battleLossRecorded = true;
        app.loseBattle();
      }
      app.removeListener(_appStateListener);
      if (app.current != null) {
        app.current!.elapsedMs = _elapsedVN.value;
        unawaited(app.save());
      }
    }

    _elapsedVN.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final app = _appState ?? context.read<AppState>();
    switch (state) {
      case AppLifecycleState.resumed:
        _exitEventLogged = false;
        final pausedAt = _backgroundedAt;
        _backgroundedAt = null;
        _cancelBattleLossCountdown();
        if (!_battleForfeitHandled &&
            pausedAt != null &&
            DateTime.now().difference(pausedAt) >=
                _kBattleBackgroundForfeitDuration) {
          _handleBattleForfeit();
        }
        if (_pendingBattleDefeatDialog) {
          _showPendingBattleDefeatDialog(app);
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        if (state == AppLifecycleState.paused) {
          _logGameExitEvent();
        }
        _startBattleLossCountdown();
        if (app.current != null) {
          app.current!.elapsedMs = _elapsedVN.value;
          unawaited(app.save());
        }
        break;
      case AppLifecycleState.detached:
        _logGameExitEvent();
        _handleBattleForfeit();
        break;
      default:
        _logGameExitEvent();
        _startBattleLossCountdown();
        if (app.current != null) {
          app.current!.elapsedMs = _elapsedVN.value;
          unawaited(app.save());
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    final l10n = AppLocalizations.of(context)!;
    final game = app.current;

    if (game == null || app.currentMode != GameMode.battle) {
      return VictoryConfettiOverlay(
        key: _confettiKey,
        child: Scaffold(
          appBar: AppBar(title: Text(l10n.battleTitle)),
          body: Center(child: Text(l10n.noActiveGameMessage)),
        ),
      );
    }

    final media = MediaQuery.of(context);
    final shortestSide = media.size.shortestSide;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final battleScaffold = Scaffold(
      backgroundColor: scheme.background,
      appBar: AppBar(
          title: Text(l10n.battleTitle),
          backgroundColor: scheme.background,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              child: Center(
                child: _BattleAppBarButton(
                  icon: Icons.palette_outlined,
                  onTap: () => showThemeMenu(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 4, top: 6, bottom: 6),
              child: Center(
                child: _BattleAppBarButton(
                  icon: Icons.settings_outlined,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsPage()),
                  ),
                ),
              ),
            ),
          ],
        ),
      body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final horizontalPadding =
                  constraints.maxWidth * _kGameplayHorizontalPaddingFactor;
              final contentWidth =
                  math.max(0.0, constraints.maxWidth - horizontalPadding * 2);
              final isTablet = media.size.shortestSide >= 600;
              final double safeAreaHorizontal =
                  media.padding.left + media.padding.right;
              final double usableWidth =
                  media.size.width - safeAreaHorizontal;
              final scale = _resolveGameplayScale(
                baseScale: _kGameplayUiScale,
                minScale: _kGameplayMinUiScale,
                contentWidth: contentWidth,
                availableHeight: constraints.maxHeight,
                baseTextScaleFactor: media.textScaleFactor,
                theme: theme,
                isTablet: isTablet,
                shortestSide: shortestSide,
                usableWidth: usableWidth,
              );
              final scaledMedia = media.copyWith(
                textScaleFactor: media.textScaleFactor * scale,
              );
              final boardSpacingScale = scale * _kBoardBannerScale;
              final boardScale =
                  boardSpacingScale * _kGameplayBannerScaleIncrease;
              final controlPanelSpacingScale =
                  scale * _kControlPanelBannerScale;
              final controlPanelScale =
                  controlPanelSpacingScale * _kGameplayBannerScaleIncrease;
              final availableHeight = constraints.maxHeight;
              final topPadding = _calculateGameContentTopPadding(
                availableHeight: availableHeight,
                scale: scale,
              );
              final bottomPadding = _calculateGameContentBottomPadding(
                availableHeight: availableHeight,
                scale: scale,
              );
              final bool isCompactHeight =
                  !isTablet && availableHeight < _kCompactHeightBreakpoint;
              final controlPanelLayout = resolveControlPanelLayoutConfig(
                scale: controlPanelScale,
                isTablet: isTablet,
                compactLayout: isCompactHeight,
                screenHeight: media.size.height,
              );
              final double controlPanelTopInset =
                  controlPanelLayout.spacingCompensation;
              final double boardToControlPanelSpacing =
                  calculateBoardToControlPanelSpacing(
                scale: controlPanelScale,
                layout: controlPanelLayout,
              );
              final solvedCells = _countSolvedCells(game);
              final totalPlayableCells = _countPlayableCells(game);
              final playerProgress = totalPlayableCells == 0
                  ? 0.0
                  : solvedCells / totalPlayableCells;

              final lives = app.livesLeft;

              return MediaQuery(
                data: scaledMedia,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                    SizedBox(height: _kStatusBarOuterPadding * scale),
                    Transform.scale(
                      scale: 1.015,
                      alignment: Alignment.center,
                      child: _BattleHeader(
                        elapsed: _elapsedVN,
                        playerFlag: app.playerFlag,
                        playerName: l10n.battleYouLabel,
                        opponentName: _opponentName,
                        playerProgress: playerProgress,
                        opponentProgress: _opponentProgress,
                        playerScore: solvedCells,
                        opponentScore: _opponentSolvedCells,
                        opponentFlag: _opponentFlag,
                        lives: lives,
                        scale: scale,
                      ),
                    ),
                    SizedBox(height: _kStatusBarOuterPadding * scale),
                    Expanded(
                      child: SingleChildScrollView(
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.fromLTRB(
                          0,
                          topPadding,
                          0,
                          bottomPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: controlPanelTopInset),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final width = constraints.maxWidth;
                                final targetWidth = _calculateBoardExtent(
                                  maxWidth: width,
                                  scale: boardScale,
                                  shortestSide: shortestSide,
                                );
                                final innerPadding =
                                    math.max(0.0, (width - targetWidth) / 2);
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: innerPadding,
                                  ),
                                  child: Transform.scale(
                                    scale: 1.015,
                                    alignment: Alignment.center,
                                    child: Board(scale: boardScale),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: math.max(
                                0.0,
                                boardToControlPanelSpacing -
                                    controlPanelTopInset,
                              ),
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final width = constraints.maxWidth;
                                final boardTargetWidth = _calculateBoardExtent(
                                  maxWidth: width,
                                  scale: boardScale,
                                  shortestSide: shortestSide,
                                );
                                final mediaQuery = MediaQuery.of(context);
                                final usableWidth = mediaQuery.size.width -
                                    mediaQuery.padding.left -
                                    mediaQuery.padding.right;
                                final maxTargetWidth = _calculateControlPanelWidth(
                                  maxWidth: width,
                                  usableWidth: usableWidth,
                                );
                                final targetWidth =
                                    math.min(boardTargetWidth, maxTargetWidth);
                                final innerPadding =
                                    math.max(0.0, (width - targetWidth) / 2);
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: innerPadding,
                                  ),
                                  child: Transform.scale(
                                    scale: 1.015,
                                    alignment: Alignment.center,
                                    child: ControlPanel(
                                      scale: controlPanelScale,
                                      compactLayout: isCompactHeight,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        _logGameExitEvent();
        return true;
      },
      child: VictoryConfettiOverlay(
        key: _confettiKey,
        child: battleScaffold,
      ),
    );
  }

  void _showVictoryDialog(AppState app) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        final theme = Theme.of(context);
        final colors = theme.extension<SudokuColors>()!;
        return Dialog(
          backgroundColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: colors.victoryBadgeGradient,
                  ),
                  child: Icon(
                    Icons.emoji_events,
                    color: theme.colorScheme.onPrimary,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  l10n.battleVictoryTitle,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.victoryMessage(formatDuration(_elapsedVN.value)),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          if (!mounted) return;
                          final navigator = Navigator.of(context);
                          final rootNavigator =
                              Navigator.of(context, rootNavigator: true);
                          final shouldPrompt = app.consumePendingRatePrompt();
                          _logGameExitEvent();
                          navigator.pop();
                          if (shouldPrompt) {
                            final didRequestReview =
                                await showRateAppDialog(rootNavigator.context);
                            app.handleRateDialogResult(didRequestReview);
                          }
                          if (navigator.mounted && navigator.canPop()) {
                            navigator.pop();
                          }
                        },
                        child: Text(l10n.backToHome),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!mounted) return;
                          final navigator = Navigator.of(context);
                          final rootNavigator =
                              Navigator.of(context, rootNavigator: true);
                          final shouldPrompt = app.consumePendingRatePrompt();
                          navigator.pop();
                          if (shouldPrompt) {
                            final didRequestReview =
                                await showRateAppDialog(rootNavigator.context);
                            app.handleRateDialogResult(didRequestReview);
                          }
                          if (!mounted) {
                            return;
                          }
                          _startRematch(app);
                        },
                        child: Text(l10n.playAnother),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDefeatDialog(AppState app) {
    final difficultyLabel =
        (app.currentDifficulty ?? app.featuredDifficulty).analyticsLabel;
    final mistakes = (_kBattleInitialLives - app.livesLeft)
        .clamp(0, _kBattleInitialLives)
        .toInt();
    final durationMs = _elapsedVN.value;
    GameAnalytics.logPuzzleLose(
      difficulty: difficultyLabel,
      durationMs: durationMs,
      mistakes: mistakes,
    );
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (dialogContext) {
        return _BattleDefeatDialog(
          reduceMotion: reduceMotion,
          onNewGame: () {
            if (!mounted) {
              return;
            }
            Navigator.of(dialogContext).pop();
            if (!_battleLossRecorded) {
              _battleLossRecorded = true;
              app.loseBattle();
            }
            _startRematch(app);
          },
          onExit: () {
            if (!mounted) {
              return;
            }
            final navigator = Navigator.of(dialogContext);
            _logGameExitEvent();
            navigator.pop();
            if (!_battleLossRecorded) {
              _battleLossRecorded = true;
              app.loseBattle();
            }
            navigator.pop();
          },
        );
      },
    );
  }

  void _startRematch(AppState app) {
    final diff = widget.difficulty ?? app.currentDifficulty ?? app.featuredStatsDifficulty;
    app.startBattleGame(diff);
    app.current?.elapsedMs = 0;
    _observedSession = app.sessionId;
    _startTimer(app, 0);
    _setupOpponent(app, resetProfile: true);
    _victoryShown = false;
    _defeatShown = false;
    _battleLossRecorded = false;
    _battleForfeitHandled = false;
    _pendingBattleDefeatDialog = false;
  }
}

class _BattleDefeatDialog extends StatelessWidget {
  final bool reduceMotion;
  final VoidCallback onNewGame;
  final VoidCallback onExit;

  const _BattleDefeatDialog({
    required this.reduceMotion,
    required this.onNewGame,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.extension<SudokuColors>()!;
    final duration =
        reduceMotion ? Duration.zero : const Duration(milliseconds: 220);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: reduceMotion ? 1.0 : 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeOut,
      builder: (context, value, child) {
        final scale = reduceMotion ? 1.0 : 0.95 + 0.05 * value;
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: scale,
            child: child,
          ),
        );
      },
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 36),
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: colors.failureBadgeGradient,
                ),
                child: Icon(
                  Icons.favorite,
                  color: theme.colorScheme.onPrimary,
                  size: 40,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                l10n.battleSimpleDefeatTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onNewGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.error,
                    foregroundColor: theme.colorScheme.onError,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(l10n.newGame),
                ),
              ),
              TextButton(
                onPressed: onExit,
                child: Text(l10n.battleExitToMainMenu),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BattleHeader extends StatelessWidget {
  final ValueListenable<int> elapsed;
  final String? playerFlag;
  final String playerName;
  final String opponentName;
  final double playerProgress;
  final double opponentProgress;
  final int playerScore;
  final int opponentScore;
  final String? opponentFlag;
  final int lives;
  final double scale;

  const _BattleHeader({
    required this.elapsed,
    required this.playerFlag,
    required this.playerName,
    required this.opponentName,
    required this.playerProgress,
    required this.opponentProgress,
    required this.playerScore,
    required this.opponentScore,
    required this.opponentFlag,
    required this.lives,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final sudokuColors = theme.extension<SudokuColors>();

    final Color defaultHeaderBackground =
        sudokuColors?.headerButtonBackground ?? cs.surface;
    final bool isDarkTheme = theme.brightness == Brightness.dark;
    final Color backgroundColor =
        isDarkTheme ? const Color(0xFF1A1A1A) : defaultHeaderBackground;
    final Color playerAccent = cs.primary;
    final Color opponentAccent = cs.error;
    final Color trackBackgroundColor =
        sudokuColors?.numberPadBorder ?? cs.outlineVariant;
    final Color heartColor = cs.error;
    final Color playerNameColor = cs.primary;
    final Color opponentNameColor = cs.error;
    final Color flagBorderColor = cs.outlineVariant;
    final Color flagBackgroundColor =
        isDarkTheme ? backgroundColor : defaultHeaderBackground;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: _kBattleHeaderHorizontalPadding * scale,
        vertical: _kBattleHeaderVerticalPadding * scale,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(_kBattleHeaderRadius * scale),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _BattlePlayerSummary(
                    flag: playerFlag,
                    name: playerName,
                    scale: scale,
                    isOpponent: false,
                    nameColor: playerNameColor,
                    flagBorderColor: flagBorderColor,
                    flagBackgroundColor: flagBackgroundColor,
                  ),
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: elapsed,
                builder: (_, value, __) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _kBattleHeaderTimerHorizontalPadding * scale,
                    ),
                    child: _BattleTimerDisplay(
                      value: value,
                      scale: scale,
                      color: cs.onSurface,
                    ),
                  );
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _BattlePlayerSummary(
                    flag: opponentFlag,
                    name: opponentName,
                    scale: scale,
                    isOpponent: true,
                    nameColor: opponentNameColor,
                    flagBorderColor: flagBorderColor,
                    flagBackgroundColor: flagBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: _kBattleHeaderTopToProgressSpacing * scale),
          Row(
            children: [
              Expanded(
                child: _BattleProgressTrack(
                  progress: playerProgress,
                  score: playerScore,
                  lives: lives,
                  scale: scale,
                  color: playerAccent,
                  trackColor: trackBackgroundColor,
                  textColor: cs.onPrimary,
                  heartColor: heartColor,
                  isOpponent: false,
                ),
              ),
              SizedBox(width: _kBattleHeaderProgressGap * scale),
              Expanded(
                child: _BattleProgressTrack(
                  progress: opponentProgress,
                  score: opponentScore,
                  lives: 3,
                  scale: scale,
                  color: opponentAccent,
                  trackColor: trackBackgroundColor,
                  textColor: cs.onError,
                  heartColor: heartColor,
                  isOpponent: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BattlePlayerSummary extends StatelessWidget {
  final String? flag;
  final String name;
  final double scale;
  final bool isOpponent;
  final Color nameColor;
  final Color flagBorderColor;
  final Color flagBackgroundColor;

  const _BattlePlayerSummary({
    required this.flag,
    required this.name,
    required this.scale,
    required this.isOpponent,
    required this.nameColor,
    required this.flagBorderColor,
    required this.flagBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nameStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: nameColor,
    );
    final String displayName = name.trim();

    final flagWidget = _BattleFlagAvatar(
      flag: flag,
      scale: scale,
      borderColor: flagBorderColor,
      backgroundColor: flagBackgroundColor,
    );

    final double nameMaxWidth = math.max(
      0,
      (_kBattleHeaderPlayerSectionMaxWidth - _kBattleHeaderFlagSize -
              _kBattleHeaderFlagToNameSpacing) *
          scale,
    );

    final nameText = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: nameMaxWidth),
      child: Text(
        displayName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: isOpponent ? TextAlign.right : TextAlign.left,
        style: nameStyle,
      ),
    );

    final nameWidget = Flexible(
      child: Align(
        alignment: isOpponent ? Alignment.centerRight : Alignment.centerLeft,
        child: nameText,
      ),
    );

    final spacing = SizedBox(width: _kBattleHeaderFlagToNameSpacing * scale);

    final children = <Widget>[];
    if (isOpponent) {
      if (displayName.isNotEmpty) {
        children.add(nameWidget);
        children.add(spacing);
      }
      children.add(flagWidget);
    } else {
      children.add(flagWidget);
      if (displayName.isNotEmpty) {
        children.add(spacing);
        children.add(nameWidget);
      }
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: _kBattleHeaderPlayerSectionMaxWidth * scale),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isOpponent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}

class _BattleTimerDisplay extends StatelessWidget {
  final int value;
  final double scale;
  final Color color;

  const _BattleTimerDisplay({
    required this.value,
    required this.scale,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: _kBattleHeaderTimerMinWidth * scale),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            formatDuration(value),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34 * 1.05 * scale,
              fontWeight: FontWeight.w800,
              color: color,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _BattleLivesIndicator extends StatelessWidget {
  final int lives;
  final double scale;
  final Color color;

  const _BattleLivesIndicator({
    required this.lives,
    required this.scale,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final int clampedLives = lives.clamp(0, 3);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        final active = index < clampedLives;
        return Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? 0 : _kBattleHeaderHeartSpacing * scale,
          ),
          child: Icon(
            Icons.favorite,
            size: _kBattleHeaderHeartSize * scale,
            color: active ? color : color.withOpacity(0.25),
          ),
        );
      }),
    );
  }
}

class _BattleFlagAvatar extends StatelessWidget {
  final String? flag;
  final double scale;
  final Color borderColor;
  final Color backgroundColor;

  const _BattleFlagAvatar({
    required this.flag,
    required this.scale,
    required this.borderColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final double size = _kBattleHeaderFlagSize * scale;

    final sanitized = _sanitizeFlag(flag);
    final countryCode = _emojiFlagToCountryCode(sanitized);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: _kBattleHeaderFlagBorderWidth * scale,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: FlagAvatar(
        countryCode: countryCode,
        fallbackEmoji: sanitized,
        backgroundColor: backgroundColor,
      ),
    );
  }

  String _sanitizeFlag(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return '🏳️';
    }
    return trimmed;
  }

  String? _emojiFlagToCountryCode(String? value) {
    final code = emojiFlagToCountryCode(value);
    return code;
  }
}

class _BattleProgressTrack extends StatelessWidget {
  final double progress;
  final int score;
  final int lives;
  final double scale;
  final Color color;
  final Color trackColor;
  final Color textColor;
  final Color heartColor;
  final bool isOpponent;

  const _BattleProgressTrack({
    required this.progress,
    required this.score,
    required this.lives,
    required this.scale,
    required this.color,
    required this.trackColor,
    required this.textColor,
    required this.heartColor,
    required this.isOpponent,
  });

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);
    final progressBar = ClipRRect(
      borderRadius:
          BorderRadius.circular((_kBattleHeaderProgressHeight * scale) / 2),
      child: SizedBox(
        height: _kBattleHeaderProgressHeight * scale,
        child: Stack(
          alignment: isOpponent ? Alignment.centerRight : Alignment.centerLeft,
          children: [
            Container(color: trackColor),
            Align(
              alignment: isOpponent ? Alignment.centerRight : Alignment.centerLeft,
              child: FractionallySizedBox(
                alignment: isOpponent ? Alignment.centerRight : Alignment.centerLeft,
                widthFactor: clampedProgress,
                child: Container(color: color),
              ),
            ),
          ],
        ),
      ),
    );

    final hearts = _BattleLivesIndicator(
      lives: lives,
      scale: scale,
      color: heartColor,
    );

    final track = Expanded(
      child: SizedBox(
        height: (_kBattleHeaderHeartSize +
                _kBattleHeaderHeartToProgressSpacing +
                _kBattleHeaderProgressHeight) *
            scale,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: progressBar,
            ),
            Positioned(
              top: 0,
              left: isOpponent ? 0 : null,
              right: isOpponent ? null : 0,
              child: hearts,
            ),
          ],
        ),
      ),
    );

    final scoreBadge = _BattleProgressScore(
      score: score,
      color: color,
      scale: scale,
      textColor: textColor,
    );

    final children = <Widget>[
      scoreBadge,
      SizedBox(width: _kBattleHeaderProgressBadgeSpacing * scale),
      track,
    ];

    final arranged = isOpponent ? children.reversed.toList() : children;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: arranged,
    );
  }
}

class _BattleProgressScore extends StatelessWidget {
  final int score;
  final Color color;
  final double scale;
  final Color textColor;

  const _BattleProgressScore({
    required this.score,
    required this.color,
    required this.scale,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final double size = _kBattleHeaderProgressBadgeDiameter * scale;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '$score',
        style: TextStyle(
          color: textColor,
          fontSize: 12 * scale,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _BattleAppBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double scale;

  const _BattleAppBarButton({
    required this.icon,
    required this.onTap,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<SudokuColors>()!;
    final radiusValue = 24 * scale;
    final borderRadius = BorderRadius.circular(radiusValue);
    final blurRadius = 12 * scale;
    final offsetY = 6 * scale;
    return InkResponse(
      radius: 28 * scale,
      onTap: onTap,
      child: Container(
        width: 48 * scale,
        height: 48 * scale,
        decoration: BoxDecoration(
          color: colors.headerButtonBackground,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: colors.shadowColor,
              blurRadius: blurRadius,
              offset: Offset(0, offsetY),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: colors.headerButtonIcon,
          size: 24 * scale,
        ),
      ),
    );
  }
}

const double _kGameplayUiScale = 1.1;
const double _kGameplayMinUiScale = 0.7;
const double _kGameplayHorizontalPaddingFactor = 0.025;
const double _kStatusBarOuterPadding = 10.0;
const double _kBoardBannerScale = 1.16865;
const double _kBoardExtentFillFactor = 1.17;
const double _kControlPanelBannerScale = 1.157625;
const double _kGameplayBannerScaleIncrease = 1.06575;
const double _kGameContentTopPadding = 16.0;
const double _kGameContentBottomPadding = 40.0;
const double _kCompactHeightBreakpoint = 720.0;
const double _kTextHeightMultiplier = 1.1;

const double _kBattleHeaderHorizontalPadding = 22.0;
const double _kBattleHeaderVerticalPadding = 16.0;
const double _kBattleHeaderRadius = 32.0;
const double _kBattleHeaderTimerHorizontalPadding = 12.0;
const double _kBattleHeaderTimerMinWidth = 96.0;
const double _kBattleHeaderTopToProgressSpacing = 12.0;
const double _kBattleHeaderProgressGap = 32.0;
const double _kBattleHeaderProgressHeight = 6.0;
const double _kBattleHeaderProgressBadgeDiameter = 22.0;
const double _kBattleHeaderProgressBadgeSpacing = 10.0;
const double _kBattleHeaderPlayerSectionMaxWidth = 240.0;
const double _kBattleHeaderFlagSize = 36.0;
const double _kBattleHeaderFlagBorderWidth = 2.0;
const double _kBattleHeaderFlagToNameSpacing = 8.0;
const double _kBattleHeaderHeartSpacing = 4.2;
const double _kBattleHeaderHeartSize = 20.0;
const double _kBattleHeaderHeartToProgressSpacing = 4.0;
const double _kStatusBarHeartIconSize = 20.0;

double _resolveGameplayScale({
  required double baseScale,
  required double minScale,
  required double contentWidth,
  required double availableHeight,
  required double baseTextScaleFactor,
  required ThemeData theme,
  required bool isTablet,
  required double shortestSide,
  required double usableWidth,
}) {
  if (contentWidth <= 0 || availableHeight <= 0) {
    return minScale.clamp(0.0, baseScale);
  }

  double estimate(double scale) => _estimateGameplayHeight(
        scale: scale,
        contentWidth: contentWidth,
        baseTextScaleFactor: baseTextScaleFactor,
        theme: theme,
        isTablet: isTablet,
        availableHeight: availableHeight,
        shortestSide: shortestSide,
        usableWidth: usableWidth,
      );

  final maxScaleHeight = estimate(baseScale);
  if (maxScaleHeight <= availableHeight) {
    return baseScale;
  }

  final minScaleHeight = estimate(minScale);
  if (minScaleHeight > availableHeight) {
    return minScale;
  }

  double low = minScale;
  double high = baseScale;
  double best = minScale;
  for (var i = 0; i < 18; i++) {
    final mid = (low + high) / 2;
    final height = estimate(mid);
    if (height <= availableHeight) {
      best = mid;
      low = mid;
    } else {
      high = mid;
    }
  }
  return best.clamp(minScale, baseScale);
}

double _estimateGameplayHeight({
  required double scale,
  required double contentWidth,
  required double baseTextScaleFactor,
  required ThemeData theme,
  required bool isTablet,
  required double availableHeight,
  required double shortestSide,
  required double usableWidth,
}) {
  final textScale = baseTextScaleFactor * scale;
  final headerHeight = (8.0 + 48.0) * scale;
  final boardSpacingScale = scale * _kBoardBannerScale;
  final controlPanelSpacingScale = scale * _kControlPanelBannerScale;
  final boardScale = boardSpacingScale * _kGameplayBannerScaleIncrease;
  final controlPanelScale =
      controlPanelSpacingScale * _kGameplayBannerScaleIncrease;
  final statusHeight = _estimateStatusBarHeight(
    scale: scale,
    textScaleFactor: textScale,
    theme: theme,
  );
  final boardSize = _calculateBoardExtent(
    maxWidth: contentWidth,
    scale: boardScale,
    shortestSide: shortestSide,
  );
  final maxControlPanelWidth = _calculateControlPanelWidth(
    maxWidth: contentWidth,
    usableWidth: usableWidth,
  );
  final controlPanelWidth = math.min(boardSize, maxControlPanelWidth);
  final bool isCompactHeight =
      !isTablet && availableHeight < _kCompactHeightBreakpoint;
  final controlPanelLayout = resolveControlPanelLayoutConfig(
    scale: controlPanelScale,
    isTablet: isTablet,
    compactLayout: isCompactHeight,
    screenHeight: availableHeight,
  );
  final boardToControlPanelSpacing = calculateBoardToControlPanelSpacing(
    scale: controlPanelScale,
    layout: controlPanelLayout,
  );
  final controlPanelHeight = estimateControlPanelHeight(
    maxWidth: controlPanelWidth,
    scale: controlPanelScale,
    isTablet: isTablet,
    screenHeight: availableHeight,
    isCompact: isCompactHeight,
  );
  final statusPadding = _kStatusBarOuterPadding * 2 * scale;
  final topPadding = _calculateGameContentTopPadding(
    availableHeight: availableHeight,
    scale: scale,
  );
  final bottomPadding = _calculateGameContentBottomPadding(
    availableHeight: availableHeight,
    scale: scale,
  );
  final contentPadding = topPadding + bottomPadding;

  return headerHeight +
      statusPadding +
      statusHeight +
      contentPadding +
      boardSize +
      boardToControlPanelSpacing +
      controlPanelHeight;
}

double _estimateStatusBarHeight({
  required double scale,
  required double textScaleFactor,
  required ThemeData theme,
}) {
  final difficultyFont = theme.textTheme.titleMedium?.fontSize ?? 16.0;
  final difficultyHeight =
      difficultyFont * textScaleFactor * _kTextHeightMultiplier;

  final baseBadgeFont = math.max(
    theme.textTheme.titleMedium?.fontSize ?? 16,
    16,
  );
  final badgeTextHeight =
      baseBadgeFont * textScaleFactor * _kTextHeightMultiplier;
  final badgeHeight = (12 * scale) +
      math.max(24 * scale, badgeTextHeight);

  final heartsHeight = _kStatusBarHeartIconSize * scale;
  final contentHeight = math.max(
    difficultyHeight,
    math.max(badgeHeight, heartsHeight),
  );

  return (12 * scale) + contentHeight;
}

double _calculateBoardExtent({
  required double maxWidth,
  required double scale,
  required double shortestSide,
}) {
  if (maxWidth <= 0 || scale <= 0 || shortestSide <= 0) {
    return 0;
  }
  final double baseWidth = math.max(0.0, maxWidth - 24);
  final double maxExtent = math.min(maxWidth, shortestSide);
  final double scaledWidth = baseWidth * scale * _kBoardExtentFillFactor;
  return math.min(maxExtent, scaledWidth);
}

double _calculateControlPanelWidth({
  required double maxWidth,
  required double usableWidth,
}) {
  if (!maxWidth.isFinite || maxWidth <= 0) {
    return 0;
  }
  if (!usableWidth.isFinite || usableWidth <= 0) {
    return maxWidth;
  }
  return math.min(maxWidth, usableWidth);
}

double _calculateGameContentTopPadding({
  required double availableHeight,
  required double scale,
}) {
  if (!availableHeight.isFinite || availableHeight <= 0) {
    return _kGameContentTopPadding * scale;
  }
  final double basePadding = _kGameContentTopPadding * scale;
  final double extraPadding =
      (availableHeight * 0.02).clamp(6.0, 24.0).toDouble();
  return basePadding + extraPadding;
}

double _calculateGameContentBottomPadding({
  required double availableHeight,
  required double scale,
}) {
  if (!availableHeight.isFinite || availableHeight <= 0) {
    return _kGameContentBottomPadding * scale;
  }
  final double basePadding = _kGameContentBottomPadding * scale;
  final double lowerBound = availableHeight * 0.08;
  final double upperBound = availableHeight * 0.15;
  final double targetFraction =
      availableHeight * (availableHeight >= 900 ? 0.12 : 0.10);
  final double fractionalPadding =
      targetFraction.clamp(lowerBound, upperBound).toDouble();
  return math.max(basePadding, fractionalPadding);
}

String formatDuration(int ms) {
  final seconds = ms ~/ 1000;
  final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
  final secs = (seconds % 60).toString().padLeft(2, '0');
  return '$minutes:$secs';
}
