// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਸੁਡੋਕੂ';

  @override
  String get navHome => 'ਮੁੱਖ';

  @override
  String get navDaily => 'ਚੁਣੌਤੀ';

  @override
  String get navAchievements => 'ਉਪਲਬਧੀਆਂ';

  @override
  String get achievements_title => 'ਉਪਲਬਧੀਆਂ';

  @override
  String get ach_section_title => 'ਲਕਸ਼ ਅਤੇ ਇਨਾਮ';

  @override
  String get ach_title_wins_50 => '50 ਜਿੱਤਾਂ';

  @override
  String get ach_title_no_mistakes => 'ਲੋਹੀ ਇਰਾਦਾ';

  @override
  String get ach_title_streak_3days => '3 ਦਿਨਾਂ ਦੀ ਲੜੀ';

  @override
  String get ach_title_fast_solver => 'ਬਿਜਲੀ ਵਰਗੀ ਤੇਜ਼ੀ';

  @override
  String get ach_title_wins_100 => '100 ਜਿੱਤਾਂ';

  @override
  String get ach_desc_wins_50 => 'ਕਲਾਸਿਕ ਮੋਡ ਵਿੱਚ 50 ਵਾਰ ਜਿੱਤੋ';

  @override
  String get ach_desc_no_mistakes =>
      'ਬਿਨਾ ਸੰਕੇਤਾਂ ਅਤੇ ਬਿਨਾ ਗਲਤੀ ਦੇ ਲਗਾਤਾਰ 3 ਖੇਡਾਂ ਪੂਰੀ ਕਰੋ';

  @override
  String get ach_desc_streak_3days => 'ਲਗਾਤਾਰ 3 ਦਿਨ ਹਰ ਰੋਜ਼ ਖੇਡੋ';

  @override
  String get ach_desc_fast_solver =>
      '3 ਮਿੰਟ ਤੋਂ ਘੱਟ ਸਮੇਂ ਵਿੱਚ ਇੱਕ ਸੁਡੋਕੂ ਹੱਲ ਕਰੋ';

  @override
  String get ach_desc_wins_100 => 'ਕਲਾਸਿਕ ਮੋਡ ਵਿੱਚ 100 ਵਾਰ ਜਿੱਤੋ';

  @override
  String get ach_status_finished => 'ਮੁਕੰਮਲ';

  @override
  String ach_status_in_progress(int current) {
    return '$current ਖੇਡਾਂ ਮੁਕੰਮਲ ਹੋਈਆਂ';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'ਪ੍ਰਾਪਤ: $date';
  }

  @override
  String get ach_locked => 'ਲਾਕ ਕੀਤਾ';

  @override
  String get dailyStreak => 'ਰੋਜ਼ਾਨਾ ਸਟ੍ਰੀਕ';

  @override
  String get selectDifficultyTitle => 'ਮੁਸ਼ਕਲ ਚੁਣੋ';

  @override
  String get selectDifficultyDailyChallenge => 'ਰੋਜ਼ਾਨਾ ਚੁਣੌਤੀ';

  @override
  String get playAction => 'ਖੇਡੋ';

  @override
  String get championshipTitle => 'ਚੈਂਪੀਅਨਸ਼ਿਪ';

  @override
  String championshipScore(int score) {
    return 'ਸਕੋਰ $score';
  }

  @override
  String toNextPlace(int points) {
    return 'ਅਗਲੇ ਸਥਾਨ ਲਈ: $points ਅੰਕ';
  }

  @override
  String get youAreTop => 'ਤੁਸੀਂ #1 ਹੋ';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'ਆਪਣੀ ਚੈਂਪੀਅਨਸ਼ਿਪ ਦੀ ਦੌੜ ਨੂੰ ਵਧਾਉਣ ਲਈ ਇਹ ਦੌਰ ਖੇਡੋ।';

  @override
  String get championshipRoundCompletedLabel => 'ਪੂਰਾ ਹੋਇਆ';

  @override
  String totalScore(String score) {
    return 'ਕੁੱਲ ਸਕੋਰ: $score';
  }

  @override
  String get meLabel => 'ਮੈਂ';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'ਸਥਾਨ $rank। $name। $points ਪੁਆਇੰਟ';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'ਮੇਰੀ ਜਗ੍ਹਾ $rank। $points ਪੁਆਇੰਟ';
  }

  @override
  String get pointsShort => 'ਅੰਕ';

  @override
  String get championshipAutoScroll => 'ਮੇਰੀ ਸਥਿਤੀ ਤੱਕ ਆਟੋ-ਸਕ੍ਰੌਲ ਕਰੋ';

  @override
  String get bestLabel => 'ਵਧੀਆ';

  @override
  String get play => 'ਖੇਡੋ';

  @override
  String get battleTitle => 'ਲੜਾਈ';

  @override
  String battleWinRate(int count) {
    return 'ਜਿੱਤਾਂ $count%';
  }

  @override
  String get battleYouLabel => 'ਤੁਹਾਨੂੰ';

  @override
  String get battleVictoryTitle => 'ਤੁਸੀਂ ਜਿੱਤ ਗਏ!';

  @override
  String get battleDefeatTitle => 'ਵਿਰੋਧੀ ਪਹਿਲੇ ਸਥਾਨ \'ਤੇ ਰਿਹਾ';

  @override
  String battleDefeatMessage(String name) {
    return '$name ਨੇ ਤੁਹਾਡੇ ਸਾਹਮਣੇ ਬੁਝਾਰਤ ਹੱਲ ਕੀਤੀ।';
  }

  @override
  String get battleSimpleDefeatTitle => 'ਤੁਸੀਂ ਹਾਰ ਗਏ ਹੋ';

  @override
  String get battleExitToMainMenu => 'ਮੁੱਖ ਮੀਨੂ';

  @override
  String get playerFlagSettingTitle => 'ਖਿਡਾਰੀ ਝੰਡਾ';

  @override
  String get selectPlayerFlag => 'ਆਪਣਾ ਝੰਡਾ ਚੁਣੋ';

  @override
  String get confirmFlagSelectionTitle => 'ਆਪਣੇ ਝੰਡੇ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get confirmFlagSelectionMessage =>
      'ਕੀ ਤੁਸੀਂ ਯਕੀਨੀ ਤੌਰ \'ਤੇ ਇਹ ਝੰਡਾ ਚੁਣਨਾ ਚਾਹੁੰਦੇ ਹੋ? ਤੁਸੀਂ ਬਾਅਦ ਵਿੱਚ ਗੇਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਆਪਣਾ ਫਲੈਗ ਬਦਲ ਸਕਦੇ ਹੋ।';

  @override
  String get confirmFlagSelectionConfirm => 'ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get startAction => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String levelHeading(int level, String difficulty) {
    return 'ਪੱਧਰ $level — $difficulty';
  }

  @override
  String get rankProgress => 'ਦਰਜਾ ਤਰੱਕੀ';

  @override
  String rankLabel(int rank) {
    return 'ਦਰਜਾ $rank';
  }

  @override
  String get newGame => 'ਨਵੀਂ ਖੇਡ';

  @override
  String get continueGame => 'ਖੇਡ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get weeklyProgress => 'ਹਫਤਾਵਾਰੀ ਤਰੱਕੀ';

  @override
  String get rewardsTitle => 'ਇਨਾਮ';

  @override
  String get rewardNoMistakesTitle => 'ਬਿਨਾਂ ਕਿਸੇ ਗਲਤੀ ਦੇ ਚੁਣੌਤੀ ਨੂੰ ਪੂਰਾ ਕਰੋ';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ਦਿਲ',
      one: '# ਦਿਲ',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'ਲਗਾਤਾਰ ਤਿੰਨ ਚੁਣੌਤੀਆਂ ਨੂੰ ਪੂਰਾ ਕਰੋ';

  @override
  String get rewardUniqueTrophy => 'ਵਿਲੱਖਣ ਟਰਾਫੀ';

  @override
  String get rewardSevenDayTitle => '7-ਦਿਨ ਦੀ ਸਟ੍ਰੀਕ ਬਣਾਈ ਰੱਖੋ';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ਤਾਰੇ',
      one: '# ਤਾਰਾ',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'ਅੱਜ ਦੀ ਬੁਝਾਰਤ';

  @override
  String get todayPuzzleDescription =>
      'ਇੱਕ ਵਾਧੂ ਇਨਾਮ ਕਮਾਉਣ ਅਤੇ ਆਪਣੀ ਸਟ੍ਰੀਕ ਨੂੰ ਜ਼ਿੰਦਾ ਰੱਖਣ ਲਈ ਸੁਡੋਕੁ ਨੂੰ ਪੂਰਾ ਕਰੋ।';

  @override
  String get continueAction => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get adMessage => 'ਵਿਗਿਆਪਨ: ਲੁਕੀਆਂ ਹੋਈਆਂ ਚੀਜ਼ਾਂ ਲੱਭੋ! ਹੁਣੇ ਚਲਾਓ।';

  @override
  String get adPlay => 'ਖੇਡੋ';

  @override
  String get undo => 'ਅਣਡੂ';

  @override
  String get erase => 'ਮਿਟਾਓ';

  @override
  String get autoNotes => 'ਆਟੋ ਨੋਟਸ';

  @override
  String get statusOn => 'ਚਾਲੂ';

  @override
  String get statusOff => 'ਬੰਦ';

  @override
  String get notes => 'ਨੋਟਸ';

  @override
  String get hint => 'ਇਸ਼ਾਰਾ';

  @override
  String get undoAdTitle => 'ਅਨਡੂ ਕਰਨ ਲਈ ਵਿਗਿਆਪਨ ਦੇਖੋ';

  @override
  String get undoAdDescription =>
      'ਆਪਣੀ ਆਖਰੀ ਚਾਲ ਨੂੰ ਅਨਡੂ ਕਰਨ ਲਈ ਇਹ ਛੋਟਾ ਵਿਗਿਆਪਨ ਦੇਖੋ।';

  @override
  String undoAdCountdown(int seconds) {
    return 'ਵਿਗਿਆਪਨ ${seconds}s ਵਿੱਚ ਖਤਮ ਹੁੰਦਾ ਹੈ';
  }

  @override
  String get hintAdTitle => 'ਇੱਕ ਸੰਕੇਤ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਵਿਗਿਆਪਨ ਦੇਖੋ';

  @override
  String get hintAdDescription => 'ਇੱਕ ਸੰਕੇਤ ਕਮਾਉਣ ਲਈ ਇਹ ਛੋਟਾ ਵਿਗਿਆਪਨ ਦੇਖੋ।';

  @override
  String hintAdCountdown(int seconds) {
    return 'ਵਿਗਿਆਪਨ ${seconds}s ਵਿੱਚ ਖਤਮ ਹੁੰਦਾ ਹੈ';
  }

  @override
  String get lifeAdTitle => 'ਦਿਲ ਨੂੰ ਬਹਾਲ ਕਰਨ ਲਈ ਵਿਗਿਆਪਨ ਦੇਖੋ';

  @override
  String get lifeAdDescription =>
      'ਲਾਲ ਦਿਲ ਨੂੰ ਬਹਾਲ ਕਰਨ ਅਤੇ ਖੇਡਦੇ ਰਹਿਣ ਲਈ ਇਹ ਛੋਟਾ ਵਿਗਿਆਪਨ ਦੇਖੋ।';

  @override
  String lifeAdCountdown(int seconds) {
    return 'ਵਿਗਿਆਪਨ ${seconds}s ਵਿੱਚ ਖਤਮ ਹੁੰਦਾ ਹੈ';
  }

  @override
  String get gameScreenTitle => 'ਸੁਡੋਕੁ';

  @override
  String combo_x(int count) {
    return 'ਕੰਬੋ ×$count';
  }

  @override
  String streak_n(int count) {
    return 'ਸਟ੍ਰੀਕ $count';
  }

  @override
  String speed_bonus(String time) {
    return 'ਸਪੀਡ ਬੋਨਸ $time';
  }

  @override
  String comboX(int count) {
    return 'ਕੰਬੋ x$count';
  }

  @override
  String streakN(int count) {
    return 'ਸਟ੍ਰੀਕ $count';
  }

  @override
  String speedBonus(String time) {
    return 'ਸਪੀਡ ਬੋਨਸ ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'ਕੋਈ ਕਿਰਿਆਸ਼ੀਲ ਖੇਡ ਨਹੀਂ ਹੈ। ਹੋਮ ਸਕ੍ਰੀਨ \'ਤੇ ਵਾਪਸ ਜਾਓ।';

  @override
  String get victoryTitle => 'ਵਧਾਈਆਂ!';

  @override
  String victoryMessage(String time) {
    return 'ਬੁਝਾਰਤ $time ਵਿੱਚ ਹੱਲ ਕੀਤੀ ਗਈ।';
  }

  @override
  String get backToHome => 'ਘਰ';

  @override
  String get playAnother => 'ਦੁਬਾਰਾ ਖੇਡੋ';

  @override
  String get outOfLivesTitle => 'ਤੁਸੀਂ ਦਿਲਾਂ ਤੋਂ ਬਾਹਰ ਹੋ';

  @override
  String get outOfLivesDescription => 'ਖੇਡਦੇ ਰਹਿਣ ਲਈ ਇੱਕ ਲਾਲ ਦਿਲ ਨੂੰ ਬਹਾਲ ਕਰੋ।';

  @override
  String get restoreLifeAction => '1 ਲਾਲ ਦਿਲ ਨੂੰ ਬਹਾਲ ਕਰੋ';

  @override
  String get cancelAction => 'ਰੱਦ ਕਰੋ';

  @override
  String get settingsTitle => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get themeSectionTitle => 'ਥੀਮ';

  @override
  String get themeWhite => 'ਕਲਾਸਿਕ ਲਾਈਟ';

  @override
  String get themeCream => 'ਕਰੀਮ';

  @override
  String get themeGreen => 'ਪੁਦੀਨੇ';

  @override
  String get themeBlack => 'ਹਨੇਰਾ';

  @override
  String get themePurple => 'ਜਾਮਨੀ ਗੂੜ੍ਹਾ';

  @override
  String get themeFontSize => 'ਫੌਂਟ ਦਾ ਆਕਾਰ';

  @override
  String get fontSizeExtraSmall => 'ਵਾਧੂ ਛੋਟਾ';

  @override
  String get fontSizeSmall => 'ਛੋਟਾ';

  @override
  String get fontSizeMedium => 'ਦਰਮਿਆਨਾ';

  @override
  String get fontSizeLarge => 'ਵੱਡਾ';

  @override
  String get fontSizeExtraLarge => 'ਵਾਧੂ ਵੱਡਾ';

  @override
  String get languageSectionTitle => 'ਭਾਸ਼ਾ';

  @override
  String get audioSectionTitle => 'ਧੁਨੀ ਅਤੇ ਸੰਗੀਤ';

  @override
  String get soundsEffectsLabel => 'ਧੁਨੀ ਪ੍ਰਭਾਵ';

  @override
  String get vibrationLabel => 'ਵਾਈਬ੍ਰੇਸ਼ਨ';

  @override
  String get comboBadgesLabel => 'ਕੰਬੋ ਬੈਜ';

  @override
  String get comboHapticsLabel => 'ਬੈਜ ਹੈਪਟਿਕਸ';

  @override
  String get miscSectionTitle => 'ਹੋਰ';

  @override
  String get howToPlayTitle => 'ਕਿਵੇਂ ਖੇਡਣਾ ਹੈ';

  @override
  String get howToPlayRowRule =>
      'ਹਰੇਕ ਕਤਾਰ ਵਿੱਚ 1 ਤੋਂ 9 ਅੰਕ ਹੁੰਦੇ ਹਨ, ਬਿਨਾਂ ਦੁਹਰਾਏ';

  @override
  String get howToPlayColumnRule =>
      'ਹਰੇਕ ਕਾਲਮ ਵਿੱਚ 1 ਤੋਂ 9 ਅੰਕ ਹੁੰਦੇ ਹਨ, ਬਿਨਾਂ ਦੁਹਰਾਏ';

  @override
  String get howToPlayBoxRule =>
      'ਹਰੇਕ 3×3 ਬਕਸੇ ਵਿੱਚ 1 ਤੋਂ 9 ਤੱਕ ਅੰਕ ਹੁੰਦੇ ਹਨ, ਬਿਨਾਂ ਦੁਹਰਾਏ';

  @override
  String get howToPlayFooter => 'ਹਰ ਸੈੱਲ ਨੂੰ ਭਰੋ ਅਤੇ ਤੁਸੀਂ ਜਿੱਤੋਗੇ!';

  @override
  String get howToPlayAction => 'ਮਿਲ ਗਿਆ';

  @override
  String get championshipLocalSection => 'ਚੈਂਪੀਅਨਸ਼ਿਪ (ਸਥਾਨਕ)';

  @override
  String get hideCompletedNumbersLabel => 'ਮੁਕੰਮਲ ਹੋਏ ਅੰਕਾਂ ਨੂੰ ਲੁਕਾਓ';

  @override
  String get aboutApp => 'ਬਾਰੇ';

  @override
  String versionLabel(String version) {
    return 'ਸੰਸਕਰਣ $version';
  }

  @override
  String get aboutLegalese => 'ਨਾਹਰੇਬਾ ਉਜ਼ੋਰ ਇੰਕ.';

  @override
  String get languageEnglish => 'ਅੰਗਰੇਜ਼ੀ';

  @override
  String get languageRussian => 'ਰੂਸੀ';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'ਹਿੰਦੀ';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'ਸਪੈਨੋਲ';

  @override
  String get languageItalian => 'ਇਤਾਲਵੀ';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'ਤੁਰਕਸੇ';

  @override
  String get languagePolish => 'ਪੋਲਸਕੀ';

  @override
  String get languagePortuguese => 'ਪੁਰਤਗਾਲੀ';

  @override
  String get languageIndonesian => 'ਬਹਾਸਾ ਇੰਡੋਨੇਸ਼ੀਆ';

  @override
  String get languageVietnamese => 'Việt Tiếng';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'ਨੀਦਰਲੈਂਡਜ਼';

  @override
  String get languageSwedish => 'ਸਵੇਂਸਕਾ';

  @override
  String get languageRomanian => 'ਰੋਮਨਾ';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'ਸੁਓਮੀ';

  @override
  String get languageKazakh => 'Қазақ tilі';

  @override
  String get languageBulgarian => 'ਬਲਗਾਰਸਕੀ';

  @override
  String get languageMalay => 'ਬਹਸਾ ਮੇਲਾਯੁ';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'ਕਿਸਵਹਿਲੀ';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'ਸਲੋਵੇਨਚੀਨਾ';

  @override
  String get export => 'ਨਿਰਯਾਤ';

  @override
  String get import => 'ਆਯਾਤ ਕਰੋ';

  @override
  String get resetMyScore => 'ਮੇਰਾ ਸਕੋਰ ਰੀਸੈਟ ਕਰੋ';

  @override
  String get resetMyScoreConfirmation =>
      'ਕੀ ਤੁਸੀਂ ਯਕੀਨੀ ਤੌਰ \'ਤੇ ਸਕੋਰ ਨੂੰ ਰੀਸੈਟ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਸ ਕਾਰਵਾਈ ਨੂੰ ਅਣਕੀਤਾ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get resetAction => 'ਰੀਸੈਟ ਕਰੋ';

  @override
  String get regenerateOpponents => 'ਵਿਰੋਧੀਆਂ ਨੂੰ ਮੁੜ ਪੈਦਾ ਕਰੋ';

  @override
  String get confirm => 'ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get done => 'ਹੋ ਗਿਆ';

  @override
  String get privacyPolicyTitle => 'ਪਰਾਈਵੇਟ ਨੀਤੀ';

  @override
  String get privacyPolicyAccept => 'ਮੈਂ ਸਵੀਕਾਰ ਕਰਦਾ ਹਾਂ';

  @override
  String get privacyPolicyPrompt =>
      'ਕੀ ਤੁਸੀਂ ਗੋਪਨੀਯਤਾ ਨੀਤੀ ਨੂੰ ਸਵੀਕਾਰ ਕਰਦੇ ਹੋ?';

  @override
  String get privacyPolicyLearnMore => 'ਹੋਰ ਜਾਣੋ →';

  @override
  String get privacyPolicyDecline => 'ਮੈਂ ਇਨਕਾਰ ਕਰਦਾ ਹਾਂ';

  @override
  String get privacyPolicyClose => 'ਬੰਦ ਕਰੋ';

  @override
  String get privacyPolicyLoadError =>
      'ਗੋਪਨੀਯਤਾ ਨੀਤੀ ਨੂੰ ਲੋਡ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get failed => 'ਅਸਫਲ ਰਿਹਾ';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'ਰੈਂਕ #$current • +$delta ਤੋਂ #$target';
  }

  @override
  String get statsTitle => 'ਅੰਕੜੇ';

  @override
  String get statsGamesSection => 'ਖੇਡਾਂ';

  @override
  String get statsGamesStarted => 'ਖੇਡਾਂ ਸ਼ੁਰੂ ਹੋ ਗਈਆਂ';

  @override
  String get statsGamesWon => 'ਖੇਡਾਂ ਜਿੱਤੀਆਂ';

  @override
  String get statsWinRate => 'ਜਿੱਤ ਦਰ';

  @override
  String get statsFlawless => 'ਨਿਰਦੋਸ਼ ਮੁਕੰਮਲ';

  @override
  String get statsTimeSection => 'ਸਮਾਂ';

  @override
  String get statsBestTime => 'ਵਧੀਆ ਸਮਾਂ';

  @override
  String get statsAverageTime => 'ਔਸਤ ਸਮਾਂ';

  @override
  String get statsStreakSection => 'ਸਟ੍ਰੀਕ';

  @override
  String get statsCurrentStreak => 'ਮੌਜੂਦਾ ਸਟ੍ਰੀਕ';

  @override
  String get statsBestStreak => 'ਵਧੀਆ ਸਟ੍ਰੀਕ';

  @override
  String get difficultyNovice => 'ਨਵੀਨਤਮ';

  @override
  String get difficultyNoviceShort => 'ਨਵੰਬਰ';

  @override
  String get difficultyMedium => 'ਵਿਚਕਾਰਲਾ';

  @override
  String get difficultyMediumShort => 'ਇੰਟ.';

  @override
  String get difficultyHigh => 'ਉੱਨਤ';

  @override
  String get difficultyHighShort => 'ਐਡਵੋਕੇਟ';

  @override
  String get difficultyExpert => 'ਮਾਹਰ';

  @override
  String get difficultyExpertShort => 'ਐਕਸਪ.';

  @override
  String get difficultyMaster => 'ਮਾਸਟਰ';

  @override
  String get difficultyMasterShort => 'ਸ਼੍ਰੀਮਤੀ';

  @override
  String get ach_title_supermind => 'ਸੁਪਰਮਾਈਂਡ';

  @override
  String get ach_desc_supermind =>
      'ਕਿਸੇ ਵੀ ਮੁਸ਼ਕਲ ’ਤੇ ਬਿਨਾ ਗਲਤੀ ਅਤੇ ਬਿਨਾ ਸੰਕੇਤ 2 ਮਿੰਟ 30 ਸਕਿੰਟ ਤੋਂ ਘੱਟ ਸਮੇਂ ਵਿੱਚ ਜਿੱਤੋ';

  @override
  String get rateDialogTitle => 'ਕੀ ਤੁਹਾਨੂੰ ਖੇਡ ਪਸੰਦ ਆਈ? 💛';

  @override
  String get rateDialogSubtitle =>
      'ਤੁਹਾਡੀ ਰੇਟਿੰਗ Sudoku ਨੂੰ ਹੋਰ ਵੀ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਮਦਦ ਕਰੇਗੀ!';

  @override
  String get rateDialogDismiss => 'ਬਾਹਰ ਜਾਓ';

  @override
  String get rateDialogConfirm => 'ਹਾਂ, ਵਧੀਆ ਹੈ!';
}
