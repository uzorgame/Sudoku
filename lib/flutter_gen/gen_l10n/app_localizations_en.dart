// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Home';

  @override
  String get navDaily => 'Challenge';

  @override
  String get navAchievements => 'Achievements';

  @override
  String get achievements_title => 'Achievements';

  @override
  String get ach_section_title => 'Goals and Rewards';

  @override
  String get ach_title_wins_50 => '50 Wins';

  @override
  String get ach_title_no_mistakes => 'Iron Will';

  @override
  String get ach_title_streak_3days => '3-Day Streak';

  @override
  String get ach_title_fast_solver => 'Lightning Fast';

  @override
  String get ach_title_wins_100 => '100 Wins';

  @override
  String get ach_desc_wins_50 => 'Win 50 times in Classic mode';

  @override
  String get ach_desc_no_mistakes =>
      'Complete 3 games in a row without hints or mistakes';

  @override
  String get ach_desc_streak_3days => 'Play daily for 3 days in a row';

  @override
  String get ach_desc_fast_solver => 'Solve a sudoku in under 3 minutes';

  @override
  String get ach_desc_wins_100 => 'Win 100 times in Classic mode';

  @override
  String get ach_status_finished => 'Finished';

  @override
  String ach_status_in_progress(int current) {
    return '$current games completed';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Obtained: $date';
  }

  @override
  String get ach_locked => 'Locked';

  @override
  String get dailyStreak => 'Daily streak';

  @override
  String get selectDifficultyTitle => 'Choose difficulty';

  @override
  String get selectDifficultyDailyChallenge => 'Daily challenge';

  @override
  String get playAction => 'Play';

  @override
  String get championshipTitle => 'Championship';

  @override
  String championshipScore(int score) {
    return 'Score $score';
  }

  @override
  String toNextPlace(int points) {
    return 'To next place: $points pts';
  }

  @override
  String get youAreTop => 'You are #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Play this round to boost your championship run.';

  @override
  String get championshipRoundCompletedLabel => 'Completed';

  @override
  String totalScore(String score) {
    return 'Total score: $score';
  }

  @override
  String get meLabel => 'Me';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Place $rank. $name. $points points';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'My place $rank. $points points';
  }

  @override
  String get pointsShort => 'pts';

  @override
  String get championshipAutoScroll => 'Auto-scroll to my position';

  @override
  String get bestLabel => 'Best';

  @override
  String get play => 'Play';

  @override
  String get battleTitle => 'Battle';

  @override
  String battleWinRate(int count) {
    return 'Wins $count%';
  }

  @override
  String get battleYouLabel => 'You';

  @override
  String get battleVictoryTitle => 'You won!';

  @override
  String get battleDefeatTitle => 'Opponent finished first';

  @override
  String battleDefeatMessage(String name) {
    return '$name solved the puzzle before you.';
  }

  @override
  String get battleSimpleDefeatTitle => 'You lost';

  @override
  String get battleExitToMainMenu => 'Main menu';

  @override
  String get playerFlagSettingTitle => 'Player flag';

  @override
  String get selectPlayerFlag => 'Choose your flag';

  @override
  String get confirmFlagSelectionTitle => 'Confirm your flag';

  @override
  String get confirmFlagSelectionMessage =>
      'Are you sure you want to choose this flag? You can change your flag later in the game settings.';

  @override
  String get confirmFlagSelectionConfirm => 'Confirm';

  @override
  String get startAction => 'Start';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Level $level — $difficulty';
  }

  @override
  String get rankProgress => 'Rank progress';

  @override
  String rankLabel(int rank) {
    return 'Rank $rank';
  }

  @override
  String get newGame => 'New game';

  @override
  String get continueGame => 'Continue game';

  @override
  String get weeklyProgress => 'Weekly progress';

  @override
  String get rewardsTitle => 'Rewards';

  @override
  String get rewardNoMistakesTitle => 'Finish the challenge without mistakes';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# hearts',
      one: '# heart',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Complete three challenges in a row';

  @override
  String get rewardUniqueTrophy => 'Unique trophy';

  @override
  String get rewardSevenDayTitle => 'Maintain a 7-day streak';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# stars',
      one: '# star',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Today\'s puzzle';

  @override
  String get todayPuzzleDescription =>
      'Finish the sudoku to earn an extra reward and keep your streak alive.';

  @override
  String get continueAction => 'Continue';

  @override
  String get adMessage => 'Ad: Find hidden objects! Play now.';

  @override
  String get adPlay => 'Play';

  @override
  String get undo => 'Undo';

  @override
  String get erase => 'Erase';

  @override
  String get autoNotes => 'Auto notes';

  @override
  String get statusOn => 'ON';

  @override
  String get statusOff => 'OFF';

  @override
  String get notes => 'Notes';

  @override
  String get hint => 'Hint';

  @override
  String get undoAdTitle => 'Watch ad to undo';

  @override
  String get undoAdDescription => 'Watch this short ad to undo your last move.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Ad ends in ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Watch ad to get a hint';

  @override
  String get hintAdDescription => 'Watch this short ad to earn a hint.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Ad ends in ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Watch ad to restore a heart';

  @override
  String get lifeAdDescription =>
      'Watch this short ad to restore a red heart and keep playing.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Ad ends in ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combo ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Streak $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Speed Bonus $time';
  }

  @override
  String comboX(int count) {
    return 'Combo x$count';
  }

  @override
  String streakN(int count) {
    return 'Streak $count';
  }

  @override
  String speedBonus(String time) {
    return 'Speed Bonus ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'No active game. Return to the home screen.';

  @override
  String get victoryTitle => 'Congratulations!';

  @override
  String victoryMessage(String time) {
    return 'Puzzle solved in $time.';
  }

  @override
  String get backToHome => 'Home';

  @override
  String get playAnother => 'Play again';

  @override
  String get outOfLivesTitle => 'You\'re out of hearts';

  @override
  String get outOfLivesDescription => 'Restore one red heart to keep playing.';

  @override
  String get restoreLifeAction => 'Restore 1 red heart';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get themeSectionTitle => 'Theme';

  @override
  String get themeWhite => 'Classic Light';

  @override
  String get themeCream => 'Cream';

  @override
  String get themeGreen => 'Mint';

  @override
  String get themeBlack => 'Dark';

  @override
  String get themePurple => 'Purple Dark';

  @override
  String get themeFontSize => 'Font size';

  @override
  String get fontSizeExtraSmall => 'Extra small';

  @override
  String get fontSizeSmall => 'Small';

  @override
  String get fontSizeMedium => 'Medium';

  @override
  String get fontSizeLarge => 'Large';

  @override
  String get fontSizeExtraLarge => 'Extra large';

  @override
  String get languageSectionTitle => 'Language';

  @override
  String get audioSectionTitle => 'Sound & music';

  @override
  String get soundsEffectsLabel => 'Sound effects';

  @override
  String get vibrationLabel => 'Vibration';

  @override
  String get comboBadgesLabel => 'Combo badges';

  @override
  String get comboHapticsLabel => 'Badge haptics';

  @override
  String get miscSectionTitle => 'Other';

  @override
  String get howToPlayTitle => 'How to play';

  @override
  String get howToPlayRowRule =>
      'Each row has the digits 1 to 9 with no repeats';

  @override
  String get howToPlayColumnRule =>
      'Each column has the digits 1 to 9 with no repeats';

  @override
  String get howToPlayBoxRule =>
      'Each 3×3 box has the digits 1 to 9 with no repeats';

  @override
  String get howToPlayFooter => 'Fill every cell and you win!';

  @override
  String get howToPlayAction => 'Got it';

  @override
  String get championshipLocalSection => 'Championship (local)';

  @override
  String get hideCompletedNumbersLabel => 'Hide completed digits';

  @override
  String get aboutApp => 'About';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get languageIndonesian => 'Bahasa Indonesia';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Nederlands';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'Қазақ тілі';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'Kiswahili';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Slovenčina';

  @override
  String get export => 'Export';

  @override
  String get import => 'Import';

  @override
  String get resetMyScore => 'Reset my score';

  @override
  String get resetMyScoreConfirmation =>
      'Are you sure you want to reset the score? This action cannot be undone.';

  @override
  String get resetAction => 'Reset';

  @override
  String get regenerateOpponents => 'Regenerate opponents';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get done => 'Done';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyAccept => 'I accept';

  @override
  String get privacyPolicyPrompt => 'Do you accept the Privacy Policy?';

  @override
  String get privacyPolicyLearnMore => 'Learn more →';

  @override
  String get privacyPolicyDecline => 'I decline';

  @override
  String get privacyPolicyClose => 'Close';

  @override
  String get privacyPolicyLoadError =>
      'Failed to load privacy policy. Please try again.';

  @override
  String get failed => 'Failed';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rank #$current • +$delta to #$target';
  }

  @override
  String get statsTitle => 'Statistics';

  @override
  String get statsGamesSection => 'Games';

  @override
  String get statsGamesStarted => 'Games started';

  @override
  String get statsGamesWon => 'Games won';

  @override
  String get statsWinRate => 'Win rate';

  @override
  String get statsFlawless => 'Flawless finishes';

  @override
  String get statsTimeSection => 'Time';

  @override
  String get statsBestTime => 'Best time';

  @override
  String get statsAverageTime => 'Average time';

  @override
  String get statsStreakSection => 'Streak';

  @override
  String get statsCurrentStreak => 'Current streak';

  @override
  String get statsBestStreak => 'Best streak';

  @override
  String get difficultyNovice => 'Novice';

  @override
  String get difficultyNoviceShort => 'Nov.';

  @override
  String get difficultyMedium => 'Intermediate';

  @override
  String get difficultyMediumShort => 'Int.';

  @override
  String get difficultyHigh => 'Advanced';

  @override
  String get difficultyHighShort => 'Adv.';

  @override
  String get difficultyExpert => 'Expert';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Master';

  @override
  String get difficultyMasterShort => 'Mst.';

  @override
  String get ach_title_supermind => 'Supermind';

  @override
  String get ach_desc_supermind =>
      'Beat any difficulty without mistakes or hints in under 2 minutes 30 seconds';

  @override
  String get rateDialogTitle => 'Enjoying the game? 💛';

  @override
  String get rateDialogSubtitle =>
      'Your rating will help Sudoku get even better!';

  @override
  String get rateDialogDismiss => 'Exit';

  @override
  String get rateDialogConfirm => 'Yes, awesome!';
}
