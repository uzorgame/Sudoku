import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bg.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bg'),
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('ko'),
    Locale('ms'),
    Locale('ne'),
    Locale('nl'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sv'),
    Locale('sw'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Sudoku'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navDaily.
  ///
  /// In en, this message translates to:
  /// **'Challenge'**
  String get navDaily;

  /// No description provided for @navAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get navAchievements;

  /// No description provided for @achievements_title.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements_title;

  /// No description provided for @ach_section_title.
  ///
  /// In en, this message translates to:
  /// **'Goals and Rewards'**
  String get ach_section_title;

  /// No description provided for @ach_title_wins_50.
  ///
  /// In en, this message translates to:
  /// **'50 Wins'**
  String get ach_title_wins_50;

  /// No description provided for @ach_title_no_mistakes.
  ///
  /// In en, this message translates to:
  /// **'Iron Will'**
  String get ach_title_no_mistakes;

  /// No description provided for @ach_title_streak_3days.
  ///
  /// In en, this message translates to:
  /// **'3-Day Streak'**
  String get ach_title_streak_3days;

  /// No description provided for @ach_title_fast_solver.
  ///
  /// In en, this message translates to:
  /// **'Lightning Fast'**
  String get ach_title_fast_solver;

  /// No description provided for @ach_title_wins_100.
  ///
  /// In en, this message translates to:
  /// **'100 Wins'**
  String get ach_title_wins_100;

  /// No description provided for @ach_desc_wins_50.
  ///
  /// In en, this message translates to:
  /// **'Win 50 times in Classic mode'**
  String get ach_desc_wins_50;

  /// No description provided for @ach_desc_no_mistakes.
  ///
  /// In en, this message translates to:
  /// **'Complete 3 games in a row without hints or mistakes'**
  String get ach_desc_no_mistakes;

  /// No description provided for @ach_desc_streak_3days.
  ///
  /// In en, this message translates to:
  /// **'Play daily for 3 days in a row'**
  String get ach_desc_streak_3days;

  /// No description provided for @ach_desc_fast_solver.
  ///
  /// In en, this message translates to:
  /// **'Solve a sudoku in under 3 minutes'**
  String get ach_desc_fast_solver;

  /// No description provided for @ach_desc_wins_100.
  ///
  /// In en, this message translates to:
  /// **'Win 100 times in Classic mode'**
  String get ach_desc_wins_100;

  /// No description provided for @ach_status_finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get ach_status_finished;

  /// No description provided for @ach_status_in_progress.
  ///
  /// In en, this message translates to:
  /// **'{current} games completed'**
  String ach_status_in_progress(int current);

  /// No description provided for @ach_percent.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String ach_percent(int percent);

  /// No description provided for @ach_obtained_on.
  ///
  /// In en, this message translates to:
  /// **'Obtained: {date}'**
  String ach_obtained_on(String date);

  /// No description provided for @ach_locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get ach_locked;

  /// No description provided for @dailyStreak.
  ///
  /// In en, this message translates to:
  /// **'Daily streak'**
  String get dailyStreak;

  /// No description provided for @selectDifficultyTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose difficulty'**
  String get selectDifficultyTitle;

  /// No description provided for @selectDifficultyDailyChallenge.
  ///
  /// In en, this message translates to:
  /// **'Daily challenge'**
  String get selectDifficultyDailyChallenge;

  /// No description provided for @playAction.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get playAction;

  /// No description provided for @championshipTitle.
  ///
  /// In en, this message translates to:
  /// **'Championship'**
  String get championshipTitle;

  /// No description provided for @championshipScore.
  ///
  /// In en, this message translates to:
  /// **'Score {score}'**
  String championshipScore(int score);

  /// No description provided for @toNextPlace.
  ///
  /// In en, this message translates to:
  /// **'To next place: {points} pts'**
  String toNextPlace(int points);

  /// No description provided for @youAreTop.
  ///
  /// In en, this message translates to:
  /// **'You are #1'**
  String get youAreTop;

  /// No description provided for @championshipRoundDescriptionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Play this round to boost your championship run.'**
  String get championshipRoundDescriptionPlaceholder;

  /// No description provided for @championshipRoundCompletedLabel.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get championshipRoundCompletedLabel;

  /// No description provided for @totalScore.
  ///
  /// In en, this message translates to:
  /// **'Total score: {score}'**
  String totalScore(String score);

  /// No description provided for @meLabel.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get meLabel;

  /// No description provided for @leaderboardRow.
  ///
  /// In en, this message translates to:
  /// **'Place {rank}. {name}. {points} points'**
  String leaderboardRow(int rank, String name, String points);

  /// No description provided for @yourPosition.
  ///
  /// In en, this message translates to:
  /// **'My place {rank}. {points} points'**
  String yourPosition(int rank, String points);

  /// No description provided for @pointsShort.
  ///
  /// In en, this message translates to:
  /// **'pts'**
  String get pointsShort;

  /// No description provided for @championshipAutoScroll.
  ///
  /// In en, this message translates to:
  /// **'Auto-scroll to my position'**
  String get championshipAutoScroll;

  /// No description provided for @bestLabel.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get bestLabel;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @battleTitle.
  ///
  /// In en, this message translates to:
  /// **'Battle'**
  String get battleTitle;

  /// Battle mode win percentage label.
  ///
  /// In en, this message translates to:
  /// **'Wins {count}%'**
  String battleWinRate(int count);

  /// No description provided for @battleYouLabel.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get battleYouLabel;

  /// No description provided for @battleVictoryTitle.
  ///
  /// In en, this message translates to:
  /// **'You won!'**
  String get battleVictoryTitle;

  /// No description provided for @battleDefeatTitle.
  ///
  /// In en, this message translates to:
  /// **'Opponent finished first'**
  String get battleDefeatTitle;

  /// No description provided for @battleDefeatMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} solved the puzzle before you.'**
  String battleDefeatMessage(String name);

  /// No description provided for @battleSimpleDefeatTitle.
  ///
  /// In en, this message translates to:
  /// **'You lost'**
  String get battleSimpleDefeatTitle;

  /// No description provided for @battleExitToMainMenu.
  ///
  /// In en, this message translates to:
  /// **'Main menu'**
  String get battleExitToMainMenu;

  /// No description provided for @playerFlagSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Player flag'**
  String get playerFlagSettingTitle;

  /// No description provided for @selectPlayerFlag.
  ///
  /// In en, this message translates to:
  /// **'Choose your flag'**
  String get selectPlayerFlag;

  /// No description provided for @confirmFlagSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm your flag'**
  String get confirmFlagSelectionTitle;

  /// No description provided for @confirmFlagSelectionMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to choose this flag? You can change your flag later in the game settings.'**
  String get confirmFlagSelectionMessage;

  /// No description provided for @confirmFlagSelectionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmFlagSelectionConfirm;

  /// No description provided for @startAction.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startAction;

  /// No description provided for @levelHeading.
  ///
  /// In en, this message translates to:
  /// **'Level {level} — {difficulty}'**
  String levelHeading(int level, String difficulty);

  /// No description provided for @rankProgress.
  ///
  /// In en, this message translates to:
  /// **'Rank progress'**
  String get rankProgress;

  /// No description provided for @rankLabel.
  ///
  /// In en, this message translates to:
  /// **'Rank {rank}'**
  String rankLabel(int rank);

  /// No description provided for @newGame.
  ///
  /// In en, this message translates to:
  /// **'New game'**
  String get newGame;

  /// No description provided for @continueGame.
  ///
  /// In en, this message translates to:
  /// **'Continue game'**
  String get continueGame;

  /// No description provided for @weeklyProgress.
  ///
  /// In en, this message translates to:
  /// **'Weekly progress'**
  String get weeklyProgress;

  /// No description provided for @rewardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewardsTitle;

  /// No description provided for @rewardNoMistakesTitle.
  ///
  /// In en, this message translates to:
  /// **'Finish the challenge without mistakes'**
  String get rewardNoMistakesTitle;

  /// No description provided for @rewardExtraHearts.
  ///
  /// In en, this message translates to:
  /// **'+{count, plural, one {# heart} other {# hearts}}'**
  String rewardExtraHearts(num count);

  /// No description provided for @rewardThreeInRowTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete three challenges in a row'**
  String get rewardThreeInRowTitle;

  /// No description provided for @rewardUniqueTrophy.
  ///
  /// In en, this message translates to:
  /// **'Unique trophy'**
  String get rewardUniqueTrophy;

  /// No description provided for @rewardSevenDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Maintain a 7-day streak'**
  String get rewardSevenDayTitle;

  /// No description provided for @rewardStars.
  ///
  /// In en, this message translates to:
  /// **'+{count, plural, one {# star} other {# stars}}'**
  String rewardStars(num count);

  /// No description provided for @todayPuzzle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s puzzle'**
  String get todayPuzzle;

  /// No description provided for @todayPuzzleDescription.
  ///
  /// In en, this message translates to:
  /// **'Finish the sudoku to earn an extra reward and keep your streak alive.'**
  String get todayPuzzleDescription;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @adMessage.
  ///
  /// In en, this message translates to:
  /// **'Ad: Find hidden objects! Play now.'**
  String get adMessage;

  /// No description provided for @adPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get adPlay;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @erase.
  ///
  /// In en, this message translates to:
  /// **'Erase'**
  String get erase;

  /// No description provided for @autoNotes.
  ///
  /// In en, this message translates to:
  /// **'Auto notes'**
  String get autoNotes;

  /// No description provided for @statusOn.
  ///
  /// In en, this message translates to:
  /// **'ON'**
  String get statusOn;

  /// No description provided for @statusOff.
  ///
  /// In en, this message translates to:
  /// **'OFF'**
  String get statusOff;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @hint.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get hint;

  /// No description provided for @undoAdTitle.
  ///
  /// In en, this message translates to:
  /// **'Watch ad to undo'**
  String get undoAdTitle;

  /// No description provided for @undoAdDescription.
  ///
  /// In en, this message translates to:
  /// **'Watch this short ad to undo your last move.'**
  String get undoAdDescription;

  /// No description provided for @undoAdCountdown.
  ///
  /// In en, this message translates to:
  /// **'Ad ends in {seconds}s'**
  String undoAdCountdown(int seconds);

  /// No description provided for @hintAdTitle.
  ///
  /// In en, this message translates to:
  /// **'Watch ad to get a hint'**
  String get hintAdTitle;

  /// No description provided for @hintAdDescription.
  ///
  /// In en, this message translates to:
  /// **'Watch this short ad to earn a hint.'**
  String get hintAdDescription;

  /// No description provided for @hintAdCountdown.
  ///
  /// In en, this message translates to:
  /// **'Ad ends in {seconds}s'**
  String hintAdCountdown(int seconds);

  /// No description provided for @lifeAdTitle.
  ///
  /// In en, this message translates to:
  /// **'Watch ad to restore a heart'**
  String get lifeAdTitle;

  /// No description provided for @lifeAdDescription.
  ///
  /// In en, this message translates to:
  /// **'Watch this short ad to restore a red heart and keep playing.'**
  String get lifeAdDescription;

  /// No description provided for @lifeAdCountdown.
  ///
  /// In en, this message translates to:
  /// **'Ad ends in {seconds}s'**
  String lifeAdCountdown(int seconds);

  /// No description provided for @gameScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Sudoku'**
  String get gameScreenTitle;

  /// No description provided for @combo_x.
  ///
  /// In en, this message translates to:
  /// **'Combo ×{count}'**
  String combo_x(int count);

  /// No description provided for @streak_n.
  ///
  /// In en, this message translates to:
  /// **'Streak {count}'**
  String streak_n(int count);

  /// No description provided for @speed_bonus.
  ///
  /// In en, this message translates to:
  /// **'Speed Bonus {time}'**
  String speed_bonus(String time);

  /// Combo multiplier badge
  ///
  /// In en, this message translates to:
  /// **'Combo x{count}'**
  String comboX(int count);

  /// Streak badge
  ///
  /// In en, this message translates to:
  /// **'Streak {count}'**
  String streakN(int count);

  /// Award for finishing faster than target
  ///
  /// In en, this message translates to:
  /// **'Speed Bonus ({time})'**
  String speedBonus(String time);

  /// No description provided for @noActiveGameMessage.
  ///
  /// In en, this message translates to:
  /// **'No active game. Return to the home screen.'**
  String get noActiveGameMessage;

  /// No description provided for @victoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get victoryTitle;

  /// No description provided for @victoryMessage.
  ///
  /// In en, this message translates to:
  /// **'Puzzle solved in {time}.'**
  String victoryMessage(String time);

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get backToHome;

  /// No description provided for @playAnother.
  ///
  /// In en, this message translates to:
  /// **'Play again'**
  String get playAnother;

  /// No description provided for @outOfLivesTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re out of hearts'**
  String get outOfLivesTitle;

  /// No description provided for @outOfLivesDescription.
  ///
  /// In en, this message translates to:
  /// **'Restore one red heart to keep playing.'**
  String get outOfLivesDescription;

  /// No description provided for @restoreLifeAction.
  ///
  /// In en, this message translates to:
  /// **'Restore 1 red heart'**
  String get restoreLifeAction;

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @themeSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeSectionTitle;

  /// No description provided for @themeWhite.
  ///
  /// In en, this message translates to:
  /// **'Classic Light'**
  String get themeWhite;

  /// No description provided for @themeCream.
  ///
  /// In en, this message translates to:
  /// **'Cream'**
  String get themeCream;

  /// No description provided for @themeGreen.
  ///
  /// In en, this message translates to:
  /// **'Mint'**
  String get themeGreen;

  /// No description provided for @themeBlack.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeBlack;

  /// No description provided for @themePurple.
  ///
  /// In en, this message translates to:
  /// **'Purple Dark'**
  String get themePurple;

  /// No description provided for @themeFontSize.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get themeFontSize;

  /// No description provided for @fontSizeExtraSmall.
  ///
  /// In en, this message translates to:
  /// **'Extra small'**
  String get fontSizeExtraSmall;

  /// No description provided for @fontSizeSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get fontSizeSmall;

  /// No description provided for @fontSizeMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get fontSizeMedium;

  /// No description provided for @fontSizeLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get fontSizeLarge;

  /// No description provided for @fontSizeExtraLarge.
  ///
  /// In en, this message translates to:
  /// **'Extra large'**
  String get fontSizeExtraLarge;

  /// No description provided for @languageSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSectionTitle;

  /// No description provided for @audioSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound & music'**
  String get audioSectionTitle;

  /// No description provided for @soundsEffectsLabel.
  ///
  /// In en, this message translates to:
  /// **'Sound effects'**
  String get soundsEffectsLabel;

  /// No description provided for @vibrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get vibrationLabel;

  /// No description provided for @comboBadgesLabel.
  ///
  /// In en, this message translates to:
  /// **'Combo badges'**
  String get comboBadgesLabel;

  /// No description provided for @comboHapticsLabel.
  ///
  /// In en, this message translates to:
  /// **'Badge haptics'**
  String get comboHapticsLabel;

  /// No description provided for @miscSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get miscSectionTitle;

  /// No description provided for @howToPlayTitle.
  ///
  /// In en, this message translates to:
  /// **'How to play'**
  String get howToPlayTitle;

  /// No description provided for @howToPlayRowRule.
  ///
  /// In en, this message translates to:
  /// **'Each row has the digits 1 to 9 with no repeats'**
  String get howToPlayRowRule;

  /// No description provided for @howToPlayColumnRule.
  ///
  /// In en, this message translates to:
  /// **'Each column has the digits 1 to 9 with no repeats'**
  String get howToPlayColumnRule;

  /// No description provided for @howToPlayBoxRule.
  ///
  /// In en, this message translates to:
  /// **'Each 3×3 box has the digits 1 to 9 with no repeats'**
  String get howToPlayBoxRule;

  /// No description provided for @howToPlayFooter.
  ///
  /// In en, this message translates to:
  /// **'Fill every cell and you win!'**
  String get howToPlayFooter;

  /// No description provided for @howToPlayAction.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get howToPlayAction;

  /// No description provided for @championshipLocalSection.
  ///
  /// In en, this message translates to:
  /// **'Championship (local)'**
  String get championshipLocalSection;

  /// No description provided for @hideCompletedNumbersLabel.
  ///
  /// In en, this message translates to:
  /// **'Hide completed digits'**
  String get hideCompletedNumbersLabel;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutApp;

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String versionLabel(String version);

  /// No description provided for @aboutLegalese.
  ///
  /// In en, this message translates to:
  /// **'Nahreba UZOR Inc.'**
  String get aboutLegalese;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get languageRussian;

  /// No description provided for @languageUkrainian.
  ///
  /// In en, this message translates to:
  /// **'Українська'**
  String get languageUkrainian;

  /// No description provided for @languageGerman.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get languageGerman;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageFrench;

  /// No description provided for @languageChinese.
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get languageChinese;

  /// No description provided for @languageHindi.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get languageHindi;

  /// No description provided for @languageGeorgian.
  ///
  /// In en, this message translates to:
  /// **'ქართული'**
  String get languageGeorgian;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// No description provided for @languageItalian.
  ///
  /// In en, this message translates to:
  /// **'Italiano'**
  String get languageItalian;

  /// No description provided for @languageJapanese.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get languageJapanese;

  /// No description provided for @languageKorean.
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get languageKorean;

  /// No description provided for @languageTurkish.
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get languageTurkish;

  /// No description provided for @languagePolish.
  ///
  /// In en, this message translates to:
  /// **'Polski'**
  String get languagePolish;

  /// No description provided for @languagePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get languagePortuguese;

  /// No description provided for @languageIndonesian.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Indonesia'**
  String get languageIndonesian;

  /// No description provided for @languageVietnamese.
  ///
  /// In en, this message translates to:
  /// **'Tiếng Việt'**
  String get languageVietnamese;

  /// No description provided for @languageThai.
  ///
  /// In en, this message translates to:
  /// **'ไทย'**
  String get languageThai;

  /// No description provided for @languageDutch.
  ///
  /// In en, this message translates to:
  /// **'Nederlands'**
  String get languageDutch;

  /// No description provided for @languageSwedish.
  ///
  /// In en, this message translates to:
  /// **'Svenska'**
  String get languageSwedish;

  /// No description provided for @languageRomanian.
  ///
  /// In en, this message translates to:
  /// **'Română'**
  String get languageRomanian;

  /// No description provided for @languageCzech.
  ///
  /// In en, this message translates to:
  /// **'Čeština'**
  String get languageCzech;

  /// No description provided for @languageFinnish.
  ///
  /// In en, this message translates to:
  /// **'Suomi'**
  String get languageFinnish;

  /// No description provided for @languageKazakh.
  ///
  /// In en, this message translates to:
  /// **'Қазақ тілі'**
  String get languageKazakh;

  /// No description provided for @languageBulgarian.
  ///
  /// In en, this message translates to:
  /// **'Български'**
  String get languageBulgarian;

  /// No description provided for @languageMalay.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Melayu'**
  String get languageMalay;

  /// No description provided for @languageNepali.
  ///
  /// In en, this message translates to:
  /// **'नेपाली'**
  String get languageNepali;

  /// No description provided for @languagePunjabi.
  ///
  /// In en, this message translates to:
  /// **'ਪੰਜਾਬੀ'**
  String get languagePunjabi;

  /// No description provided for @languageSwahili.
  ///
  /// In en, this message translates to:
  /// **'Kiswahili'**
  String get languageSwahili;

  /// No description provided for @languageTamil.
  ///
  /// In en, this message translates to:
  /// **'தமிழ்'**
  String get languageTamil;

  /// No description provided for @languageSlovak.
  ///
  /// In en, this message translates to:
  /// **'Slovenčina'**
  String get languageSlovak;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @import.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get import;

  /// No description provided for @resetMyScore.
  ///
  /// In en, this message translates to:
  /// **'Reset my score'**
  String get resetMyScore;

  /// No description provided for @resetMyScoreConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset the score? This action cannot be undone.'**
  String get resetMyScoreConfirmation;

  /// No description provided for @resetAction.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetAction;

  /// No description provided for @regenerateOpponents.
  ///
  /// In en, this message translates to:
  /// **'Regenerate opponents'**
  String get regenerateOpponents;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyAccept.
  ///
  /// In en, this message translates to:
  /// **'I accept'**
  String get privacyPolicyAccept;

  /// No description provided for @privacyPolicyPrompt.
  ///
  /// In en, this message translates to:
  /// **'Do you accept the Privacy Policy?'**
  String get privacyPolicyPrompt;

  /// No description provided for @privacyPolicyLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more →'**
  String get privacyPolicyLearnMore;

  /// No description provided for @privacyPolicyDecline.
  ///
  /// In en, this message translates to:
  /// **'I decline'**
  String get privacyPolicyDecline;

  /// No description provided for @privacyPolicyClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get privacyPolicyClose;

  /// No description provided for @privacyPolicyLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load privacy policy. Please try again.'**
  String get privacyPolicyLoadError;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @rankBadgeChasing.
  ///
  /// In en, this message translates to:
  /// **'Rank #{current} • +{delta} to #{target}'**
  String rankBadgeChasing(int current, int delta, int target);

  /// No description provided for @statsTitle.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statsTitle;

  /// No description provided for @statsGamesSection.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get statsGamesSection;

  /// No description provided for @statsGamesStarted.
  ///
  /// In en, this message translates to:
  /// **'Games started'**
  String get statsGamesStarted;

  /// No description provided for @statsGamesWon.
  ///
  /// In en, this message translates to:
  /// **'Games won'**
  String get statsGamesWon;

  /// No description provided for @statsWinRate.
  ///
  /// In en, this message translates to:
  /// **'Win rate'**
  String get statsWinRate;

  /// No description provided for @statsFlawless.
  ///
  /// In en, this message translates to:
  /// **'Flawless finishes'**
  String get statsFlawless;

  /// No description provided for @statsTimeSection.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get statsTimeSection;

  /// No description provided for @statsBestTime.
  ///
  /// In en, this message translates to:
  /// **'Best time'**
  String get statsBestTime;

  /// No description provided for @statsAverageTime.
  ///
  /// In en, this message translates to:
  /// **'Average time'**
  String get statsAverageTime;

  /// No description provided for @statsStreakSection.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get statsStreakSection;

  /// No description provided for @statsCurrentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get statsCurrentStreak;

  /// No description provided for @statsBestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best streak'**
  String get statsBestStreak;

  /// No description provided for @difficultyNovice.
  ///
  /// In en, this message translates to:
  /// **'Novice'**
  String get difficultyNovice;

  /// No description provided for @difficultyNoviceShort.
  ///
  /// In en, this message translates to:
  /// **'Nov.'**
  String get difficultyNoviceShort;

  /// No description provided for @difficultyMedium.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get difficultyMedium;

  /// No description provided for @difficultyMediumShort.
  ///
  /// In en, this message translates to:
  /// **'Int.'**
  String get difficultyMediumShort;

  /// No description provided for @difficultyHigh.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get difficultyHigh;

  /// No description provided for @difficultyHighShort.
  ///
  /// In en, this message translates to:
  /// **'Adv.'**
  String get difficultyHighShort;

  /// No description provided for @difficultyExpert.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get difficultyExpert;

  /// No description provided for @difficultyExpertShort.
  ///
  /// In en, this message translates to:
  /// **'Exp.'**
  String get difficultyExpertShort;

  /// No description provided for @difficultyMaster.
  ///
  /// In en, this message translates to:
  /// **'Master'**
  String get difficultyMaster;

  /// No description provided for @difficultyMasterShort.
  ///
  /// In en, this message translates to:
  /// **'Mst.'**
  String get difficultyMasterShort;

  /// No description provided for @ach_title_supermind.
  ///
  /// In en, this message translates to:
  /// **'Supermind'**
  String get ach_title_supermind;

  /// No description provided for @ach_desc_supermind.
  ///
  /// In en, this message translates to:
  /// **'Beat any difficulty without mistakes or hints in under 2 minutes 30 seconds'**
  String get ach_desc_supermind;

  /// No description provided for @rateDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoying the game? 💛'**
  String get rateDialogTitle;

  /// No description provided for @rateDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your rating will help Sudoku get even better!'**
  String get rateDialogSubtitle;

  /// No description provided for @rateDialogDismiss.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get rateDialogDismiss;

  /// No description provided for @rateDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Yes, awesome!'**
  String get rateDialogConfirm;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'bg',
    'cs',
    'de',
    'en',
    'es',
    'fi',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ka',
    'kk',
    'ko',
    'ms',
    'ne',
    'nl',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sv',
    'sw',
    'th',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bg':
      return AppLocalizationsBg();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ka':
      return AppLocalizationsKa();
    case 'kk':
      return AppLocalizationsKk();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'ne':
      return AppLocalizationsNe();
    case 'nl':
      return AppLocalizationsNl();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
