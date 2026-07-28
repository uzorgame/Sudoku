// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Hem';

  @override
  String get navDaily => 'Utmaning';

  @override
  String get navAchievements => 'Prestationer';

  @override
  String get achievements_title => 'Prestationer';

  @override
  String get ach_section_title => 'Mål och belöningar';

  @override
  String get ach_title_wins_50 => '50 vinster';

  @override
  String get ach_title_no_mistakes => 'Järnvilja';

  @override
  String get ach_title_streak_3days => '3-dagars svit';

  @override
  String get ach_title_fast_solver => 'Blixtsnabb';

  @override
  String get ach_title_wins_100 => '100 vinster';

  @override
  String get ach_desc_wins_50 => 'Vinn 50 gånger i klassiskt läge';

  @override
  String get ach_desc_no_mistakes =>
      'Klara 3 matcher i rad utan ledtrådar eller misstag';

  @override
  String get ach_desc_streak_3days => 'Spela dagligen i 3 dagar i rad';

  @override
  String get ach_desc_fast_solver => 'Lös ett sudoku på under 3 minuter';

  @override
  String get ach_desc_wins_100 => 'Vinn 100 gånger i klassiskt läge';

  @override
  String get ach_status_finished => 'Slutförd';

  @override
  String ach_status_in_progress(int current) {
    return '$current spel slutförda';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Erhållen: $date';
  }

  @override
  String get ach_locked => 'Låst';

  @override
  String get dailyStreak => 'Daglig strimma';

  @override
  String get selectDifficultyTitle => 'Välj svårighet';

  @override
  String get selectDifficultyDailyChallenge => 'Daglig utmaning';

  @override
  String get playAction => 'Spela';

  @override
  String get championshipTitle => 'Mästerskap';

  @override
  String championshipScore(int score) {
    return 'Poäng $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Till nästa plats: $points pts';
  }

  @override
  String get youAreTop => 'Du är nr 1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Spela den här omgången för att öka ditt mästerskap.';

  @override
  String get championshipRoundCompletedLabel => 'Avslutad';

  @override
  String totalScore(String score) {
    return 'Total poäng: $score';
  }

  @override
  String get meLabel => 'Mig';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Plats $rank. $name. $points poäng';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Min plats $rank. $points poäng';
  }

  @override
  String get pointsShort => 'punkter';

  @override
  String get championshipAutoScroll => 'Auto-rulla till min position';

  @override
  String get bestLabel => 'Bäst';

  @override
  String get play => 'Spela';

  @override
  String get battleTitle => 'Slåss';

  @override
  String battleWinRate(int count) {
    return 'Vinster $count%';
  }

  @override
  String get battleYouLabel => 'Du';

  @override
  String get battleVictoryTitle => 'Du vann!';

  @override
  String get battleDefeatTitle => 'Motståndaren slutade först';

  @override
  String battleDefeatMessage(String name) {
    return '$name löste pusslet före dig.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Du tappade';

  @override
  String get battleExitToMainMenu => 'Huvudmeny';

  @override
  String get playerFlagSettingTitle => 'Spelflagga';

  @override
  String get selectPlayerFlag => 'Välj din flagga';

  @override
  String get confirmFlagSelectionTitle => 'Bekräfta din flagga';

  @override
  String get confirmFlagSelectionMessage =>
      'Är du säker på att du vill välja den här flaggan? Du kan ändra din flagga senare i spelinställningarna.';

  @override
  String get confirmFlagSelectionConfirm => 'Bekräfta';

  @override
  String get startAction => 'Starta';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Nivå $level - $difficulty';
  }

  @override
  String get rankProgress => 'Rangframsteg';

  @override
  String rankLabel(int rank) {
    return 'Rang $rank';
  }

  @override
  String get newGame => 'Nytt spel';

  @override
  String get continueGame => 'Fortsätt';

  @override
  String get weeklyProgress => 'Veckovisa framsteg';

  @override
  String get rewardsTitle => 'Belöning';

  @override
  String get rewardNoMistakesTitle => 'Avsluta utmaningen utan misstag';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# hjärtan',
      one: '# hjärta',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Slutför tre utmaningar i rad';

  @override
  String get rewardUniqueTrophy => 'Unik trofé';

  @override
  String get rewardSevenDayTitle => 'Behåll en 7-dagars rad';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# stjärnor',
      one: '# stjärna',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Dagens pussel';

  @override
  String get todayPuzzleDescription =>
      'Avsluta Sudoku för att tjäna en extra belöning och hålla din rad vid liv.';

  @override
  String get continueAction => 'Fortsätta';

  @override
  String get adMessage => 'AD: Hitta dolda föremål! Spela nu.';

  @override
  String get adPlay => 'Spela';

  @override
  String get undo => 'Ångra';

  @override
  String get erase => 'Radera';

  @override
  String get autoNotes => 'Auto Notes';

  @override
  String get statusOn => 'PÅ';

  @override
  String get statusOff => 'AV';

  @override
  String get notes => 'Anteckningar';

  @override
  String get hint => 'Antydan';

  @override
  String get undoAdTitle => 'Titta på annonsen att ångra';

  @override
  String get undoAdDescription =>
      'Titta på den här korta annonsen för att ångra ditt sista drag.';

  @override
  String undoAdCountdown(int seconds) {
    return 'AD slutar i ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Titta på annonsen för att få en tips';

  @override
  String get hintAdDescription =>
      'Titta på den här korta annonsen för att tjäna ett tips.';

  @override
  String hintAdCountdown(int seconds) {
    return 'AD slutar i ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Titta på AD för att återställa ett hjärta';

  @override
  String get lifeAdDescription =>
      'Titta på denna korta annons för att återställa ett rött hjärta och fortsätta spela.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'AD slutar i ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combo × $count';
  }

  @override
  String streak_n(int count) {
    return 'Svit $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Hastighetsbonus $time';
  }

  @override
  String comboX(int count) {
    return 'Kombo ×$count';
  }

  @override
  String streakN(int count) {
    return 'Svit $count';
  }

  @override
  String speedBonus(String time) {
    return 'Hastighetsbonus ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Inget aktivt spel. Återgå till hemskärmen.';

  @override
  String get victoryTitle => 'Grattis!';

  @override
  String victoryMessage(String time) {
    return 'Pussel löst i $time.';
  }

  @override
  String get backToHome => 'Hem';

  @override
  String get playAnother => 'Spela igen';

  @override
  String get outOfLivesTitle => 'Du är ur hjärtan';

  @override
  String get outOfLivesDescription =>
      'Återställ ett rött hjärta för att fortsätta spela.';

  @override
  String get restoreLifeAction => 'Återställ 1 rött hjärta';

  @override
  String get cancelAction => 'Avboka';

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get themeSectionTitle => 'Tema';

  @override
  String get themeWhite => 'Klassiskt ljus';

  @override
  String get themeCream => 'Grädde';

  @override
  String get themeGreen => 'Mynta';

  @override
  String get themeBlack => 'Mörk';

  @override
  String get themePurple => 'Lila mörk';

  @override
  String get themeFontSize => 'Fontstorlek';

  @override
  String get fontSizeExtraSmall => 'Extra liten';

  @override
  String get fontSizeSmall => 'Små';

  @override
  String get fontSizeMedium => 'Mellan';

  @override
  String get fontSizeLarge => 'Stor';

  @override
  String get fontSizeExtraLarge => 'Extra stor';

  @override
  String get languageSectionTitle => 'Språk';

  @override
  String get audioSectionTitle => 'Ljud och musik';

  @override
  String get soundsEffectsLabel => 'Ljudeffekter';

  @override
  String get vibrationLabel => 'Vibrationer';

  @override
  String get comboBadgesLabel => 'Combo -märken';

  @override
  String get comboHapticsLabel => 'Märke haptik';

  @override
  String get miscSectionTitle => 'Andra';

  @override
  String get howToPlayTitle => 'Hur man spelar';

  @override
  String get howToPlayRowRule =>
      'Varje rad har siffrorna 1 till 9 utan upprepningar';

  @override
  String get howToPlayColumnRule =>
      'Varje kolumn har siffrorna 1 till 9 utan upprepningar';

  @override
  String get howToPlayBoxRule =>
      'Varje 3 × 3 -låda har siffrorna 1 till 9 utan upprepningar';

  @override
  String get howToPlayFooter => 'Fyll varje cell så vinner du!';

  @override
  String get howToPlayAction => 'Fick';

  @override
  String get championshipLocalSection => 'Mästerskap (lokal)';

  @override
  String get hideCompletedNumbersLabel => 'Dölj slutförda siffror';

  @override
  String get aboutApp => 'Om';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get aboutLegalese => 'UZOR';

  @override
  String get languageEnglish => 'Engelska';

  @override
  String get languageRussian => 'Руский';

  @override
  String get languageUkrainian => 'Du';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageItalian => 'Italiensk';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'Portugis';

  @override
  String get languageIndonesian => 'Bahasa indonesien';

  @override
  String get languageVietnamese => 'Tiếng việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Nederland';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'Қазақ ті';

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
  String get export => 'Exportera';

  @override
  String get import => 'Importera';

  @override
  String get resetMyScore => 'Återställ min poäng';

  @override
  String get resetMyScoreConfirmation =>
      'Är du säker på att du vill återställa poängen? Denna åtgärd kan inte ångras.';

  @override
  String get resetAction => 'Återställa';

  @override
  String get regenerateOpponents => 'Regenerera motståndare';

  @override
  String get confirm => 'Bekräfta';

  @override
  String get cancel => 'Avboka';

  @override
  String get done => 'Gjort';

  @override
  String get privacyPolicyTitle => 'Integritetspolicy';

  @override
  String get privacyPolicyAccept => 'Jag accepterar';

  @override
  String get privacyPolicyPrompt => 'Accepterar du sekretesspolicyn?';

  @override
  String get privacyPolicyLearnMore => 'Lär dig mer →';

  @override
  String get privacyPolicyDecline => 'Jag avvisar';

  @override
  String get privacyPolicyClose => 'Nära';

  @override
  String get privacyPolicyLoadError =>
      'Det gick inte att ladda integritetspolicyn. Försök igen.';

  @override
  String get failed => 'Misslyckad';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rang #$current • +$delta till #$target';
  }

  @override
  String get statsTitle => 'Statistik';

  @override
  String get statsGamesSection => 'Spel';

  @override
  String get statsGamesStarted => 'Spel började';

  @override
  String get statsGamesWon => 'Spel vann';

  @override
  String get statsWinRate => 'Vinstränta';

  @override
  String get statsFlawless => 'Felfri finish';

  @override
  String get statsTimeSection => 'Tid';

  @override
  String get statsBestTime => 'Bästa tiden';

  @override
  String get statsAverageTime => 'Genomsnittlig tid';

  @override
  String get statsStreakSection => 'Strimma';

  @override
  String get statsCurrentStreak => 'Aktuell rad';

  @override
  String get statsBestStreak => 'Bästa strimma';

  @override
  String get difficultyNovice => 'Nybörjare';

  @override
  String get difficultyNoviceShort => 'Nyb.';

  @override
  String get difficultyMedium => 'Medel';

  @override
  String get difficultyMediumShort => 'Med.';

  @override
  String get difficultyHigh => 'Svår';

  @override
  String get difficultyHighShort => 'Svår';

  @override
  String get difficultyExpert => 'Expert';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Mästare';

  @override
  String get difficultyMasterShort => 'Mäs.';

  @override
  String get ach_title_supermind => 'Superhjärna';

  @override
  String get ach_desc_supermind =>
      'Vinn på valfri svårighetsgrad utan misstag eller ledtrådar på under 2 minuter och 30 sekunder';

  @override
  String get rateDialogTitle => 'Gillar du spelet? 💛';

  @override
  String get rateDialogSubtitle =>
      'Ditt betyg hjälper Sudoku att bli ännu bättre!';

  @override
  String get rateDialogDismiss => 'Avsluta';

  @override
  String get rateDialogConfirm => 'Ja, den är grym!';
}
