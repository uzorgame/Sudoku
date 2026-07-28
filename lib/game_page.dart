import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sudoku2/flutter_gen/gen_l10n/app_localizations.dart';

import 'championship/championship_model.dart';
import 'combo/combo_controller.dart';
import 'models.dart';
import 'settings_page.dart';
import 'theme.dart';
import 'widgets/board.dart';
import 'widgets/control_panel.dart';
import 'widgets/theme_menu.dart';
import 'widgets/rate_app_dialog.dart';
import 'ui/effects/victory_confetti_overlay.dart';
import 'ads/rewarded_service.dart';
import 'config/ads_config.dart';
import 'analytics/game_analytics.dart';

const int _kInitialLives = 3;
const double _kGameplayUiScale = 1.1;
const double _kGameplayMinUiScale = 0.7;
const double _kGameplayHorizontalPaddingFactor = 0.025;
const double _kStatusBarOuterPadding = 10.0;
const double _kGameContentTopPadding = 16.0;
const double _kGameContentBottomPadding = 40.0;
const double _kStatusBarBannerScale = 1.157625;
const double _kBoardBannerScale = 1.16865;
const double _kBoardExtentFillFactor = 1.17;
const double _kControlPanelBannerScale = 1.157625;
const double _kGameplayBannerScaleIncrease = 1.06575;
const double _kCompactHeightBreakpoint = 720.0;
const double _kTextHeightMultiplier = 1.1;
const Duration _kVictoryLightWaveDuration = Duration(milliseconds: 1800);

class _VictoryLightWave extends StatelessWidget {
  const _VictoryLightWave({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: _kVictoryLightWaveDuration,
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          final opacity = 1 - Curves.easeInQuad.transform(value).clamp(0.0, 1.0);
          final scale = 0.7 + (1.6 * value);
          final verticalShift = value * 6;

          return Transform.translate(
            offset: Offset(0, verticalShift),
            child: Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: child,
              ),
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              center: Alignment(0, -0.15),
              radius: 0.8,
              colors: [
                Color(0xFFFFD26F),
                Color(0xFFFF9F4A),
                Colors.transparent,
              ],
              stops: [0.0, 0.45, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with WidgetsBindingObserver, TickerProviderStateMixin
    implements ComboHost {
  final GlobalKey<VictoryConfettiOverlayState> _confettiKey =
      GlobalKey<VictoryConfettiOverlayState>();
  final ValueNotifier<int> _elapsedVN = ValueNotifier<int>(0);
  Timer? _t;
  int _observedSession = -1;
  bool _victoryShown = false;
  bool _failureShown = false;
  bool _exitEventLogged = false;
  AppState? _appState;
  late final VoidCallback _appStateListener;
  late final VoidCallback _rewardedListener;
  bool _gameStateScheduled = false;
  OverlayEntry? _scoreToastEntry;
  AnimationController? _scoreToastController;
  late final ComboController _comboController;
  int? _lastObservedLives;
  static final TweenSequence<double> _victoryBadgeScaleSequence =
      TweenSequence<double>([
    TweenSequenceItem(
      tween:
          Tween(begin: 1.0, end: 1.1).chain(CurveTween(curve: Curves.easeOut)),
      weight: 50,
    ),
    TweenSequenceItem(
      tween:
          Tween(begin: 1.1, end: 1.0).chain(CurveTween(curve: Curves.easeIn)),
      weight: 50,
    ),
  ]);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _appStateListener = _handleAppStateChanged;
    _comboController = ComboController(host: this);
    _rewardedListener = _handleRewardedStateChanged;
    RewardedService.instance.addListener(_rewardedListener);
    if (kAdsEnabled) {
      unawaited(RewardedService.instance.preloadHint());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _subscribeToAppState();
  }

  void _subscribeToAppState() {
    final app = context.read<AppState>();
    if (identical(app, _appState)) {
      return;
    }

    _appState?.removeListener(_appStateListener);
    _appState?.attachComboSink(null);
    _appState = app;
    _observedSession = app.sessionId;
    _victoryShown = false;
    _failureShown = false;
    _lastObservedLives = app.livesLeft;
    _maybePreloadHeartAd(app.livesLeft);
    final startMs = app.current?.elapsedMs ?? 0;
    _startTimer(app, startMs);
    app.addListener(_appStateListener);
    app.attachComboSink(_comboController);
    _scheduleHandleGameState();
  }

  void _handleAppStateChanged() {
    final app = _appState;
    if (app == null || !mounted) {
      return;
    }

    if (_observedSession != app.sessionId) {
      _observedSession = app.sessionId;
      _victoryShown = false;
      _failureShown = false;
      _startTimer(app, app.current?.elapsedMs ?? 0);
    }

    final currentLives = app.livesLeft;
    if (_lastObservedLives != currentLives) {
      _lastObservedLives = currentLives;
      _maybePreloadHeartAd(currentLives);
    }

    _scheduleHandleGameState();
  }

  void _maybePreloadHeartAd(int livesLeft) {
    if (livesLeft == 1) {
      unawaited(RewardedService.instance.loadHeartAd());
    }
  }

  void _handleRewardedStateChanged() {
    if (!mounted) {
      return;
    }
    final app = _appState ?? context.read<AppState>();
    if (RewardedService.instance.isUndoShowing) {
      _pauseTimer();
      if (app.current != null) {
        app.current!.elapsedMs = _elapsedVN.value;
      }
    } else if (app.current != null) {
      _resumeTimer(app);
    }
  }

  void _scheduleHandleGameState() {
    if (_gameStateScheduled) {
      return;
    }
    _gameStateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _gameStateScheduled = false;
      if (!mounted) {
        return;
      }
      final app = _appState;
      if (app == null) {
        return;
      }
      await _handleGameState(app);
    });
  }

  void _startTimer(AppState app, int startMs) {
    _pauseTimer();
    _elapsedVN.value = startMs;
    final current = app.current;
    if (current != null) {
      current.elapsedMs = startMs;
    }
    _resumeTimer(app);
  }

  void _resumeTimer(AppState app) {
    if (_t != null) {
      return;
    }
    if (app.current == null) {
      return;
    }
    _t = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsedVN.value += 1000;
    });
  }

  void _pauseTimer() {
    _t?.cancel();
    _t = null;
  }

  void _logGameExitEvent() {
    if (_exitEventLogged) {
      return;
    }
    _exitEventLogged = true;
    GameAnalytics.logGameExit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pauseTimer();

    _logGameExitEvent();

    final app = _appState;
    if (app != null) {
      app.removeListener(_appStateListener);
      if (app.current != null) {
        app.current!.elapsedMs = _elapsedVN.value;
        unawaited(app.save());
      }
      app.attachComboSink(null);
    }

    _scoreToastController?.dispose();
    _scoreToastEntry?.remove();
    _scoreToastController = null;
    _scoreToastEntry = null;
    _comboController.dispose();
    RewardedService.instance.removeListener(_rewardedListener);

    _elapsedVN.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final app = _appState ?? context.read<AppState>();
    switch (state) {
      case AppLifecycleState.resumed:
        _exitEventLogged = false;
        _resumeTimer(app);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (state == AppLifecycleState.paused ||
            state == AppLifecycleState.detached) {
          _logGameExitEvent();
        }
        _pauseTimer();
        if (app.current != null) {
          app.current!.elapsedMs = _elapsedVN.value;
          unawaited(app.save());
        }
        break;
      default:
        _logGameExitEvent();
        _pauseTimer();
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
    if (!app.isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final game = app.current;
    final l10n = AppLocalizations.of(context)!;

    if (game == null) {
      return VictoryConfettiOverlay(
        key: _confettiKey,
        child: Scaffold(
          appBar: AppBar(title: Text(l10n.gameScreenTitle)),
          body: Center(
            child: Text(l10n.noActiveGameMessage),
          ),
        ),
      );
    }

    final media = MediaQuery.of(context);
    final shortestSide = media.size.shortestSide;

    final gameplayScaffold = Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding =
                constraints.maxWidth * _kGameplayHorizontalPaddingFactor;
            final contentWidth =
                math.max(0.0, constraints.maxWidth - horizontalPadding * 2);
            final theme = Theme.of(context);
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
            final statusSpacingScale = scale * _kStatusBarBannerScale;
            final statusScale =
                statusSpacingScale * _kGameplayBannerScaleIncrease;
            final statusContentScale = scale * _kGameplayBannerScaleIncrease;
            final boardSpacingScale = scale * _kBoardBannerScale;
            final boardScale =
                boardSpacingScale * _kGameplayBannerScaleIncrease;
            final controlPanelSpacingScale = scale * _kControlPanelBannerScale;
            final controlPanelScale =
                controlPanelSpacingScale * _kGameplayBannerScaleIncrease;
            final availableHeight = constraints.maxHeight;
            final topContentPadding = _calculateGameContentTopPadding(
              availableHeight: availableHeight,
              scale: scale,
            );
            final bottomContentPadding = _calculateGameContentBottomPadding(
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

            return MediaQuery(
              data: scaledMedia,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    Transform.scale(
                      scale: 1.015,
                      alignment: Alignment.center,
                      child: _GameHeader(
                        scale: scale,
                        elapsed: _elapsedVN,
                        onBack: () {
                          if (context.mounted) {
                            _logGameExitEvent();
                            Navigator.pop(context);
                          }
                        },
                        onRestart: () {
                          app.restartCurrentPuzzle();
                          app.current?.elapsedMs = 0;
                          _startTimer(app, 0);
                        },
                        onOpenTheme: () => showThemeMenu(context),
                        onSettings: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SettingsPage()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: _kStatusBarOuterPadding * statusSpacingScale,
                      ),
                      child: LayoutBuilder(
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
                              child: _StatusBarContainer(
                                containerScale: statusScale,
                                contentScale: statusContentScale,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.fromLTRB(
                          0,
                          topContentPadding,
                          0,
                          bottomContentPadding,
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
                                final maxTargetWidth =
                                    _calculateControlPanelWidth(
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
        child: gameplayScaffold,
      ),
    );
  }

  Future<void> _handleGameState(AppState app) async {
    if (app.current == null) return;

    if (app.isSolved && !app.gameCompleted) {
      final ms = _elapsedVN.value;
      app.current?.elapsedMs = ms;
      app.completeGame(ms);
      ChampionshipModel? championship;
      try {
        championship = context.read<ChampionshipModel?>();
      } catch (_) {
        championship = null;
      }
      int awardedDelta = 0;
      int? previousRank;
      if (championship != null && app.currentMode == GameMode.championship) {
        try {
          final difficulty = app.currentDifficulty ?? app.featuredDifficulty;
          final mistakes =
              (_kInitialLives - app.livesLeft).clamp(0, _kInitialLives).toInt();
          final hintsUsed = app.hintsConsumed;
          final isDaily = app.activeDailyChallengeDate != null;
          previousRank = championship.myRank;
          final gameId = app.ensureCurrentGameId();
          awardedDelta = await championship.awardScoreForGame(
            difficulty: difficulty,
            timeMs: ms,
            mistakes: mistakes,
            hints: hintsUsed,
            gameId: gameId,
            isDailyChallenge: isDaily,
          );
        } catch (_) {}
        if (!mounted) {
          return;
        }
        if (awardedDelta > 0) {
          final l10n = AppLocalizations.of(context)!;
          _showScoreToast(l10n, awardedDelta);
          if (previousRank != null) {
            _maybeTriggerRankHaptic(
              app,
              previousRank,
              championship.myRank,
            );
          }
        }
        try {
          championship.completeCurrentRound();
        } catch (_) {}
      }
      if (!_victoryShown && mounted) {
        _victoryShown = true;
        GameAnalytics.logPuzzleWin();
        _confettiKey.currentState?.play();
        _showVictoryDialog(app);
      }
    } else if (app.isOutOfLives) {
      if (!_failureShown) {
        _failureShown = true;
        final difficultyLabel =
            (app.currentDifficulty ?? app.featuredDifficulty).analyticsLabel;
        final mistakes =
            (_kInitialLives - app.livesLeft).clamp(0, _kInitialLives).toInt();
        final durationMs = _elapsedVN.value;
        GameAnalytics.logPuzzleLose(
          difficulty: difficultyLabel,
          durationMs: durationMs,
          mistakes: mistakes,
        );
        _showOutOfLivesDialog(app);
      }
    } else {
      _failureShown = false;
    }
  }

  void _showScoreToast(AppLocalizations l10n, int delta) {
    final overlay = Overlay.of(context);
    if (overlay == null) {
      return;
    }

    _scoreToastController?.dispose();
    _scoreToastController = null;
    _scoreToastEntry?.remove();
    _scoreToastEntry = null;

    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final animationDuration =
        reduceMotion ? const Duration(milliseconds: 1) : const Duration(milliseconds: 240);

    final controller = AnimationController(
      duration: animationDuration,
      reverseDuration: animationDuration,
      vsync: this,
    );

    final Animation<double> opacityAnimation;
    final Animation<Offset> slideAnimation;
    if (reduceMotion) {
      opacityAnimation = const AlwaysStoppedAnimation<double>(1.0);
      slideAnimation = const AlwaysStoppedAnimation<Offset>(Offset.zero);
    } else {
      final curved = CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      opacityAnimation = curved;
      slideAnimation = Tween<Offset>(
        begin: const Offset(0, -0.12),
        end: Offset.zero,
      ).animate(curved);
    }

    final entry = OverlayEntry(
      builder: (context) {
        final media = MediaQuery.of(context);
        final text = '+$delta ${l10n.pointsShort}';
        return Positioned(
          top: media.padding.top + 16,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Align(
              alignment: Alignment.topCenter,
              child: SlideTransition(
                position: slideAnimation,
                child: FadeTransition(
                  opacity: opacityAnimation,
                  child: _ScoreToastMessage(
                    text: text,
                    scale: _kGameplayUiScale,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(entry);
    _scoreToastEntry = entry;
    _scoreToastController = controller;
    controller.forward();

    Future.delayed(const Duration(milliseconds: 1200), () async {
      if (!mounted || _scoreToastController != controller) {
        return;
      }
      if (!reduceMotion) {
        try {
          await controller.reverse();
        } catch (_) {
          return;
        }
      }
      if (_scoreToastController == controller) {
        controller.dispose();
        entry.remove();
        _scoreToastController = null;
        _scoreToastEntry = null;
      }
    });
  }

  void _maybeTriggerRankHaptic(AppState app, int oldRank, int newRank) {
    if (!app.vibrationEnabled) {
      return;
    }
    if (newRank >= oldRank) {
      return;
    }
    const thresholds = [100, 50, 10];
    for (final threshold in thresholds) {
      if (oldRank > threshold && newRank <= threshold) {
        HapticFeedback.lightImpact();
        break;
      }
    }
  }

  void _showVictoryDialog(AppState app) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        final reduceMotion = MediaQuery.of(context).disableAnimations;
        final duration = reduceMotion
            ? Duration.zero
            : const Duration(milliseconds: 220);
        final theme = Theme.of(context);
        final colors = theme.extension<SudokuColors>()!;

        return TweenAnimationBuilder<double>(
          tween: Tween(begin: reduceMotion ? 1.0 : 0.85, end: 1.0),
          duration: duration,
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Transform.scale(scale: value, child: child);
          },
          child: Dialog(
            backgroundColor: theme.colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (reduceMotion)
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
                    )
                  else
                    SizedBox(
                      width: 72,
                      height: 72,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          const _VictoryLightWave(),
                          TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 350),
                            tween: Tween(begin: 0.0, end: 1.0),
                            builder: (context, value, child) {
                              final scale =
                                  _victoryBadgeScaleSequence.transform(value);
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Container(
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
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 18),
                  Text(
                    l10n.victoryTitle,
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
                            if (!mounted) {
                              return;
                            }
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
                            if (!mounted) {
                              return;
                            }
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
                            final diff = app.currentDifficulty ??
                                app.featuredStatsDifficulty;
                            app.startGame(diff);
                            app.current?.elapsedMs = 0;
                            _startTimer(app, 0);
                            _victoryShown = false;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(l10n.playAnother),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showOutOfLivesDialog(AppState app) async {
    unawaited(RewardedService.instance.loadHeartAd());

    final rootContext = context;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        final l10n = AppLocalizations.of(dialogContext)!;
        final reduceMotion = MediaQuery.of(dialogContext).disableAnimations;
        final duration =
            reduceMotion ? Duration.zero : const Duration(milliseconds: 220);
        final theme = Theme.of(dialogContext);
        final colors = theme.extension<SudokuColors>()!;
        final rewardedService = RewardedService.instance;

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
                child: AnimatedBuilder(
                  animation: rewardedService,
                  builder: (context, _) {
                    final bool loading = rewardedService.isHeartLoading ||
                        rewardedService.isHeartShowing;

                    return Dialog(
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
                              l10n.outOfLivesTitle,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              l10n.outOfLivesDescription,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color:
                                    theme.colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: loading
                                    ? null
                                    : () async {
                                        GameAnalytics
                                            .logRewardRequest('heart');
                                        await rewardedService.showHeartAd(
                                          onReward: () {
                                            if (!mounted) {
                                              return;
                                            }
                                            app.restoreOneLife(
                                              source: 'ads',
                                            );
                                            Navigator.of(dialogContext)
                                                .pop(true);
                                          },
                                          onUnavailable: () {
                                            if (!mounted) {
                                              return;
                                            }
                                            final messenger =
                                                ScaffoldMessenger.of(
                                                    rootContext);
                                            messenger
                                              ..removeCurrentSnackBar()
                                              ..showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Реклама недоступна, спробуйте пізніше',
                                                  ),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                ),
                                              );
                                          },
                                        );
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.error,
                                  foregroundColor: theme.colorScheme.onError,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: loading
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            theme.colorScheme.onError,
                                          ),
                                        ),
                                      )
                                    : Text(l10n.restoreLifeAction),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(dialogContext).pop(false);
                              },
                              child: Text(l10n.cancelAction),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );

    if (!mounted) {
      return;
    }

    if (result == true) {
      _failureShown = false;
    } else {
      app.registerFailure();
      app.abandonGame();
      if (context.mounted) {
        _logGameExitEvent();
        Navigator.pop(context);
      }
    }
  }

  @override
  TickerProvider get vsync => this;

  @override
  double get fontScale => context.read<AppState>().fontScale;
}

String formatDuration(int ms) {
  final seconds = ms ~/ 1000;
  final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
  final secs = (seconds % 60).toString().padLeft(2, '0');
  return '$minutes:$secs';
}

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
  final statusBaseScale = scale * _kStatusBarBannerScale;
  final boardBaseScale = scale * _kBoardBannerScale;
  final controlPanelBaseScale = scale * _kControlPanelBannerScale;
  final statusScale = statusBaseScale * _kGameplayBannerScaleIncrease;
  final boardScale = boardBaseScale * _kGameplayBannerScaleIncrease;
  final controlPanelScale =
      controlPanelBaseScale * _kGameplayBannerScaleIncrease;
  final statusHeight = _estimateStatusBarHeight(
    containerScale: statusScale,
    contentScale: scale * _kGameplayBannerScaleIncrease,
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
  final statusPadding = _kStatusBarOuterPadding * 2 * statusBaseScale;
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
  required double containerScale,
  required double contentScale,
  required double textScaleFactor,
  required ThemeData theme,
}) {
  final double fontMultiplier = _kGameplayBannerScaleIncrease;
  final difficultyFont =
      (theme.textTheme.titleMedium?.fontSize ?? 16.0) * fontMultiplier;
  final difficultyHeight =
      difficultyFont * textScaleFactor * _kTextHeightMultiplier;

  final baseBadgeFont =
      math.max(
            theme.textTheme.titleMedium?.fontSize ?? _statusBarBadgeTextSize,
            _statusBarBadgeTextSize,
          ) *
          fontMultiplier;
  final badgeTextHeight =
      baseBadgeFont * textScaleFactor * _kTextHeightMultiplier;
  final badgeHeight = (_statusBarBadgeVerticalPadding * 2 * contentScale) +
      math.max(_statusBarBadgeIconSize * contentScale, badgeTextHeight);

  final heartsHeight = _statusBarHeartIconSize * contentScale;
  final contentHeight = math.max(
    difficultyHeight,
    math.max(badgeHeight, heartsHeight),
  );

  return (_statusBarVerticalPadding * 2 * containerScale) + contentHeight;
}

double _calculateBoardExtent({
  required double maxWidth,
  required double scale,
  required double shortestSide,
}) {
  if (maxWidth <= 0 || scale <= 0 || shortestSide <= 0) {
    return 0;
  }
  final double constrainedWidth = math.min(maxWidth, shortestSide);
  final double scaledWidth = maxWidth * scale * _kBoardExtentFillFactor;
  return math.min(constrainedWidth, scaledWidth);
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

class _GameHeader extends StatelessWidget {
  final double scale;
  final ValueListenable<int> elapsed;
  final VoidCallback onBack;
  final VoidCallback onRestart;
  final VoidCallback onOpenTheme;
  final VoidCallback onSettings;

  const _GameHeader({
    required this.scale,
    required this.elapsed,
    required this.onBack,
    required this.onRestart,
    required this.onOpenTheme,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headlineSmall?.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: theme.colorScheme.onSurface,
        ) ??
        const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        );

    return Padding(
      padding: EdgeInsets.fromLTRB(16 / scale, 8 * scale, 16 / scale, 0),
      child: Row(
        children: [
          _HeaderButton(
            scale: scale,
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: onBack,
          ),
          Expanded(
            child: Column(
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: elapsed,
                  builder: (_, ms, __) => Text(
                    formatDuration(ms),
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
          _HeaderButton(
            scale: scale,
            icon: Icons.palette_outlined,
            onTap: onOpenTheme,
          ),
          SizedBox(width: 12 * scale),
          _HeaderButton(
            scale: scale,
            icon: Icons.refresh_rounded,
            onTap: onRestart,
          ),
          SizedBox(width: 12 * scale),
          _HeaderButton(
            scale: scale,
            icon: Icons.settings_outlined,
            onTap: onSettings,
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double scale;

  const _HeaderButton({required this.icon, required this.onTap, required this.scale});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<SudokuColors>()!;
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

class _StatusBarContainer extends StatelessWidget {
  final double containerScale;
  final double contentScale;

  const _StatusBarContainer({
    required this.containerScale,
    required this.contentScale,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Selector<AppState, _StatusBarData?>(
      selector: (_, app) {
        final current = app.current;
        if (current == null) {
          return null;
        }
        final difficulty =
            app.currentDifficulty ?? app.featuredStatsDifficulty;
        return _StatusBarData(
          difficulty: difficulty,
          stars: app.currentScore,
          lives: app.livesLeft,
          isDailyChallenge: app.currentMode == GameMode.daily,
        );
      },
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, data, _) {
        if (data == null) {
          return const SizedBox.shrink();
        }
        return _StatusBar(
          containerScale: containerScale,
          contentScale: contentScale,
          difficulty:
              data.isDailyChallenge ? l10n.navDaily : data.difficulty.title(l10n),
          stars: data.stars,
          lives: data.lives,
        );
      },
    );
  }
}

class _StatusBarData {
  final Difficulty difficulty;
  final int stars;
  final int lives;
  final bool isDailyChallenge;

  const _StatusBarData({
    required this.difficulty,
    required this.stars,
    required this.lives,
    required this.isDailyChallenge,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _StatusBarData &&
            other.difficulty == difficulty &&
            other.stars == stars &&
            other.lives == lives &&
            other.isDailyChallenge == isDailyChallenge;
  }

  @override
  int get hashCode => Object.hash(difficulty, stars, lives, isDailyChallenge);
}

const double _statusBarRadiusValue = 28;
const double _statusBarBadgeRadiusValue = 18;
const double _statusBarHorizontalPadding = 24;
const double _statusBarVerticalPadding = 18;
const double _statusBarBadgeHorizontalPadding = 18;
const double _statusBarBadgeVerticalPadding = 8;
const double _statusBarBadgeIconSize = 24;
const double _statusBarBadgeSpacing = 8;
const double _statusBarBadgeTextSize = 18;
const double _statusBarItemsSpacing = 20;
const double _statusBarHeartSpacing = 8;
const double _statusBarHeartIconSize = 28;

class _StatusBar extends StatelessWidget {
  final String difficulty;
  final int stars;
  final int lives;
  final double containerScale;
  final double contentScale;

  const _StatusBar({
    required this.difficulty,
    required this.stars,
    required this.lives,
    required this.containerScale,
    required this.contentScale,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<SudokuColors>()!;
    final scheme = theme.colorScheme;
    final borderRadius =
        BorderRadius.circular(_statusBarRadiusValue * containerScale);
    final badgeRadius =
        BorderRadius.circular(_statusBarBadgeRadiusValue * contentScale);

    final double fontMultiplier = _kGameplayBannerScaleIncrease;
    final baseDifficultySize =
        (theme.textTheme.titleMedium?.fontSize ?? 16.0) * fontMultiplier;
    final difficultyStyle = (theme.textTheme.titleMedium ??
            const TextStyle(fontSize: 16))
        .copyWith(
      fontWeight: FontWeight.w700,
      color: scheme.onSurface,
      fontSize: baseDifficultySize,
    );
    final baseBadgeSize = math.max(
          theme.textTheme.titleMedium?.fontSize ?? _statusBarBadgeTextSize,
          _statusBarBadgeTextSize,
        ) *
        fontMultiplier;
    final badgeTextStyle = (theme.textTheme.titleMedium ??
            const TextStyle(fontSize: _statusBarBadgeTextSize))
        .copyWith(
      fontWeight: FontWeight.w700,
      color: scheme.secondary,
      fontSize: baseBadgeSize,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: _statusBarHorizontalPadding * containerScale,
        vertical: _statusBarVerticalPadding * containerScale,
      ),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: colors.shadowColor,
            blurRadius: 20 * containerScale,
            offset: Offset(0, 10 * containerScale),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                difficulty,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: difficultyStyle,
              ),
            ),
          ),
          SizedBox(width: _statusBarItemsSpacing * containerScale),
          _ScoreBadge(
            badgeRadius: badgeRadius,
            scale: contentScale,
            scheme: scheme,
            stars: stars,
            textStyle: badgeTextStyle,
          ),
          SizedBox(width: _statusBarItemsSpacing * containerScale),
          Flexible(
            fit: FlexFit.loose,
            child: Align(
              alignment: Alignment.centerRight,
              child: _HeartsIndicator(lives: lives, scale: contentScale),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreBadge extends StatelessWidget {
  final BorderRadius badgeRadius;
  final double scale;
  final ColorScheme scheme;
  final int stars;
  final TextStyle textStyle;

  const _ScoreBadge({
    required this.badgeRadius,
    required this.scale,
    required this.scheme,
    required this.stars,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = textStyle.copyWith(
      fontSize: textStyle.fontSize ?? _statusBarBadgeTextSize,
    );
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _statusBarBadgeHorizontalPadding * scale,
        vertical: _statusBarBadgeVerticalPadding * scale,
      ),
      decoration: BoxDecoration(
        color: scheme.secondary.withOpacity(0.15),
        borderRadius: badgeRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star_rounded,
            color: scheme.secondary,
            size: _statusBarBadgeIconSize * scale,
          ),
          SizedBox(width: _statusBarBadgeSpacing * scale),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              stars.toString(),
              style: baseTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreToastMessage extends StatelessWidget {
  final String text;
  final double scale;

  const _ScoreToastMessage({required this.text, required this.scale});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final background =
        Color.alphaBlend(cs.primary.withOpacity(0.12), cs.surface);
    return Material(
      color: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(24 * scale),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.18),
              blurRadius: 18 * scale,
              offset: Offset(0, 12 * scale),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20 * scale,
            vertical: 12 * scale,
          ),
          child: Text(
            text,
            style: theme.textTheme.titleMedium?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w700,
                ) ??
                TextStyle(
                  color: cs.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
          ),
        ),
      ),
    );
  }
}

class _HeartsIndicator extends StatelessWidget {
  final int lives;
  final double scale;

  const _HeartsIndicator({required this.lives, required this.scale});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final inactive = scheme.outlineVariant;
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) {
          final active = index < lives;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : _statusBarHeartSpacing * scale,
            ),
            child: Icon(
              Icons.favorite,
              size: _statusBarHeartIconSize * scale,
              color: active ? scheme.error : inactive,
            ),
          );
        }),
      ),
    );
  }
}
