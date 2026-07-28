import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sudoku2/flutter_gen/gen_l10n/app_localizations.dart';

import 'ads/ads_initializer.dart';
import 'ads/rewarded_service.dart';
import 'config/ads_config.dart';
import 'championship/championship_model.dart';
import 'championship/championship_page.dart';
import 'home_screen.dart';
import 'models.dart' as models;
import 'theme.dart';
import 'undo_reward_controller.dart';
import 'controllers/achievement_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appState = models.AppState();
  final achievementController = AchievementController();
  appState.attachAchievementController(achievementController);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState),
        ChangeNotifierProvider.value(value: achievementController),
        ChangeNotifierProvider<ChampionshipModel>(
          create: (_) {
            final model = ChampionshipModel();
            model.loadFromPrefs();
            unawaited(model.loadPersistentState());
            if (defaultTargetPlatform != TargetPlatform.iOS) {
              model.scheduleLeaderboardWarmup();
            }
            return model;
          },
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => UndoRewardController()),
      ],
      child: const SudokuApp(),
    ),
  );

  final appStateLoad = appState.load();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    unawaited(() async {
      try {
        await appStateLoad;
        await achievementController.load();
        achievementController.syncWithStats(
          totalClassicWins: appState.totalClassicWins,
          dailyStreak: appState.dailyStreak,
        );
      } catch (error, stackTrace) {
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: error,
            stack: stackTrace,
            library: 'SudokuApp',
            context: ErrorDescription('loading startup state'),
          ),
        );
      }
    }());
  });

  if (kAdsEnabled) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(() async {
        try {
          await AdsInitializer.instance.ensureInitialized();
          await RewardedService.instance.onSdkInitialized();
        } catch (error, stackTrace) {
          FlutterError.reportError(
            FlutterErrorDetails(
              exception: error,
              stack: stackTrace,
              library: 'SudokuApp',
              context: ErrorDescription('initializing ads sdk'),
            ),
          );
        }
      }());
    });
  }
}

class SudokuApp extends StatelessWidget {
  const SudokuApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<models.AppState>();
    final activeTheme = app.resolvedTheme();
    final baseTheme = buildSudokuTheme(activeTheme);
    final theme = baseTheme.copyWith(
      pageTransitionsTheme: _pageTransitionsTheme,
    );

    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      locale: app.lang.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: theme,
      themeAnimationDuration: const Duration(milliseconds: 250),
      themeAnimationCurve: Curves.easeOutCubic,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        if (app.analyticsObserver != null) app.analyticsObserver!,
      ],
      builder: (context, child) {
        final media = MediaQuery.of(context);
        Widget content = MediaQuery(
          data: media.copyWith(textScaleFactor: app.fontScale),
          child: child ?? const SizedBox.shrink(),
        );

        if (!app.isInitialized) {
          content = Stack(
            children: [
              content,
              const _AppLoadingOverlay(),
            ],
          );
        }

        return content;
      },
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/championship': (context) => const ChampionshipPage(),
      },
    );
  }
}

class _AppLoadingOverlay extends StatelessWidget {
  const _AppLoadingOverlay();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surface.withOpacity(0.6),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

const _pageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: _SudokuPageTransitionsBuilder(),
    TargetPlatform.iOS: _SudokuPageTransitionsBuilder(),
    TargetPlatform.linux: _SudokuPageTransitionsBuilder(),
    TargetPlatform.macOS: _SudokuPageTransitionsBuilder(),
    TargetPlatform.windows: _SudokuPageTransitionsBuilder(),
  },
);

class _SudokuPageTransitionsBuilder extends PageTransitionsBuilder {
  const _SudokuPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion) {
      return child;
    }

    final primary = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
    final secondary = CurvedAnimation(
      parent: secondaryAnimation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(primary),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-0.25, 0),
        ).animate(secondary),
        child: child,
      ),
    );
  }
}
