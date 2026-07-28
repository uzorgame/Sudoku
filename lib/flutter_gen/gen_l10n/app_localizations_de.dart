// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Startseite';

  @override
  String get navDaily => 'Herausforderung';

  @override
  String get navAchievements => 'Erfolge';

  @override
  String get achievements_title => 'Erfolge';

  @override
  String get ach_section_title => 'Ziele und Belohnungen';

  @override
  String get ach_title_wins_50 => '50 Siege';

  @override
  String get ach_title_no_mistakes => 'Eiserner Wille';

  @override
  String get ach_title_streak_3days => '3-Tage-Serie';

  @override
  String get ach_title_fast_solver => 'Blitzschnell';

  @override
  String get ach_title_wins_100 => '100 Siege';

  @override
  String get ach_desc_wins_50 => 'Gewinne 50-mal im Klassikmodus';

  @override
  String get ach_desc_no_mistakes =>
      'Beende 3 Spiele in Folge ohne Hinweise und ohne Fehler';

  @override
  String get ach_desc_streak_3days => 'Spiele 3 Tage in Folge täglich';

  @override
  String get ach_desc_fast_solver => 'Löse ein Sudoku in unter 3 Minuten';

  @override
  String get ach_desc_wins_100 => 'Gewinne 100-mal im Klassikmodus';

  @override
  String get ach_status_finished => 'Abgeschlossen';

  @override
  String ach_status_in_progress(int current) {
    return '$current Spiele abgeschlossen';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Erreicht am: $date';
  }

  @override
  String get ach_locked => 'Gesperrt';

  @override
  String get dailyStreak => 'Tagesserie';

  @override
  String get selectDifficultyTitle => 'Schwierigkeitsgrad wählen';

  @override
  String get selectDifficultyDailyChallenge => 'Tägliche Herausforderung';

  @override
  String get playAction => 'Spielen';

  @override
  String get championshipTitle => 'Meisterschaft';

  @override
  String championshipScore(int score) {
    return 'Punktestand $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Bis zum nächsten Platz: $points Pkt';
  }

  @override
  String get youAreTop => 'Du bist Nr. 1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Spiele diese Runde, um deinen Meisterschaftslauf zu stärken.';

  @override
  String get championshipRoundCompletedLabel => 'Abgeschlossen';

  @override
  String totalScore(String score) {
    return 'Gesamtpunktzahl: $score';
  }

  @override
  String get meLabel => 'Ich';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Platz $rank. $name. $points Punkte';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Mein Platz $rank. $points Punkte';
  }

  @override
  String get pointsShort => 'Pkt.';

  @override
  String get championshipAutoScroll =>
      'Automatisch zu meiner Position scrollen';

  @override
  String get bestLabel => 'Bestleistung';

  @override
  String get play => 'Spielen';

  @override
  String get battleTitle => 'Duell';

  @override
  String battleWinRate(int count) {
    return 'Siege $count%';
  }

  @override
  String get battleYouLabel => 'Du';

  @override
  String get battleVictoryTitle => 'Du hast gewonnen!';

  @override
  String get battleDefeatTitle => 'Der Gegner hat gewonnen';

  @override
  String battleDefeatMessage(String name) {
    return '$name hat das Rätsel vor dir gelöst.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Du hast verloren';

  @override
  String get battleExitToMainMenu => 'Zum Hauptmenü';

  @override
  String get playerFlagSettingTitle => 'Spielerflagge';

  @override
  String get selectPlayerFlag => 'Wähle deine Flagge';

  @override
  String get confirmFlagSelectionTitle => 'Bestätige deine Flagge';

  @override
  String get confirmFlagSelectionMessage =>
      'Bist du sicher, dass du diese Flagge auswählen möchtest? Du kannst deine Flagge später in den Spieleinstellungen ändern.';

  @override
  String get confirmFlagSelectionConfirm => 'Bestätigen';

  @override
  String get startAction => 'Starten';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Stufe $level – $difficulty';
  }

  @override
  String get rankProgress => 'Rangfortschritt';

  @override
  String rankLabel(int rank) {
    return 'Rang $rank';
  }

  @override
  String get newGame => 'Neues Spiel';

  @override
  String get continueGame => 'Spiel fortsetzen';

  @override
  String get weeklyProgress => 'Wochenfortschritt';

  @override
  String get rewardsTitle => 'Belohnungen';

  @override
  String get rewardNoMistakesTitle =>
      'Schließe die Herausforderung ohne Fehler ab';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Herzen',
      one: '# Herz',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle =>
      'Schließe drei Herausforderungen in Folge ab';

  @override
  String get rewardUniqueTrophy => 'Einzigartige Trophäe';

  @override
  String get rewardSevenDayTitle => 'Halte eine Serie von 7 Tagen';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Sterne',
      one: '# Stern',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Heutiges Rätsel';

  @override
  String get todayPuzzleDescription =>
      'Löse das Sudoku, um eine zusätzliche Belohnung zu erhalten und deine Serie fortzusetzen.';

  @override
  String get continueAction => 'Weiter';

  @override
  String get adMessage => 'Anzeige: Finde versteckte Objekte! Jetzt spielen.';

  @override
  String get adPlay => 'Spielen';

  @override
  String get undo => 'Rückgängig';

  @override
  String get erase => 'Löschen';

  @override
  String get autoNotes => 'Auto-Notizen';

  @override
  String get statusOn => 'AN';

  @override
  String get statusOff => 'AUS';

  @override
  String get notes => 'Notizen';

  @override
  String get hint => 'Tipp';

  @override
  String get undoAdTitle => 'Werbung ansehen zum Rückgängig machen';

  @override
  String get undoAdDescription =>
      'Sieh dir diese kurze Werbung an, um deinen letzten Zug rückgängig zu machen.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Werbung endet in $seconds s';
  }

  @override
  String get hintAdTitle => 'Werbung ansehen, um einen Tipp zu erhalten';

  @override
  String get hintAdDescription =>
      'Sieh dir diese kurze Werbung an, um einen Tipp zu erhalten.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Werbung endet in $seconds s';
  }

  @override
  String get lifeAdTitle => 'Werbung ansehen, um ein Herz wiederherzustellen';

  @override
  String get lifeAdDescription =>
      'Sieh dir diese kurze Werbung an, um ein rotes Herz wiederherzustellen und weiterzuspielen.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Werbung endet in $seconds s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combo ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Serie $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Tempo-Bonus $time';
  }

  @override
  String comboX(int count) {
    return 'Kombination x$count';
  }

  @override
  String streakN(int count) {
    return 'Serie $count';
  }

  @override
  String speedBonus(String time) {
    return 'Tempo-Bonus ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Kein aktives Spiel. Kehre zum Startbildschirm zurück.';

  @override
  String get victoryTitle => 'Glückwunsch!';

  @override
  String victoryMessage(String time) {
    return 'Rätsel gelöst in $time.';
  }

  @override
  String get backToHome => 'Start';

  @override
  String get playAnother => 'Noch eins';

  @override
  String get outOfLivesTitle => 'Keine Herzen mehr';

  @override
  String get outOfLivesDescription =>
      'Stelle ein rotes Herz wieder her, um weiterzuspielen.';

  @override
  String get restoreLifeAction => '1 rotes Herz wiederherstellen';

  @override
  String get cancelAction => 'Abbrechen';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get themeSectionTitle => 'Design';

  @override
  String get themeWhite => 'Klassisch hell';

  @override
  String get themeCream => 'Creme';

  @override
  String get themeGreen => 'Minze';

  @override
  String get themeBlack => 'Dunkel';

  @override
  String get themePurple => 'Dunkles Violett';

  @override
  String get themeFontSize => 'Schriftgröße';

  @override
  String get fontSizeExtraSmall => 'Sehr klein';

  @override
  String get fontSizeSmall => 'Klein';

  @override
  String get fontSizeMedium => 'Mittel';

  @override
  String get fontSizeLarge => 'Groß';

  @override
  String get fontSizeExtraLarge => 'Sehr groß';

  @override
  String get languageSectionTitle => 'Sprache';

  @override
  String get audioSectionTitle => 'Sound & Musik';

  @override
  String get soundsEffectsLabel => 'Soundeffekte';

  @override
  String get vibrationLabel => 'Vibrationen';

  @override
  String get comboBadgesLabel => 'Combo-Badges';

  @override
  String get comboHapticsLabel => 'Badge-Haptik';

  @override
  String get miscSectionTitle => 'Sonstiges';

  @override
  String get howToPlayTitle => 'So spielst du';

  @override
  String get howToPlayRowRule =>
      'In jeder Zeile stehen die Ziffern 1 bis 9 ohne Wiederholung';

  @override
  String get howToPlayColumnRule =>
      'In jeder Spalte stehen die Ziffern 1 bis 9 ohne Wiederholung';

  @override
  String get howToPlayBoxRule =>
      'In jedem 3×3-Block stehen die Ziffern 1 bis 9 ohne Wiederholung';

  @override
  String get howToPlayFooter => 'Fülle alle Felder aus – und du gewinnst!';

  @override
  String get howToPlayAction => 'Alles klar';

  @override
  String get championshipLocalSection => 'Meisterschaft (lokal)';

  @override
  String get hideCompletedNumbersLabel => 'Verwendete Ziffern ausblenden';

  @override
  String get aboutApp => 'Über';

  @override
  String versionLabel(String version) {
    return 'Versionsnummer $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageRussian => 'Russisch';

  @override
  String get languageUkrainian => 'Ukraine';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'Ja';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'Spanisch';

  @override
  String get languageItalian => 'Italienisch';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languagePolish => 'Polnisch';

  @override
  String get languagePortuguese => 'Portugiesisch';

  @override
  String get languageIndonesian => 'Bahasa Indonesien';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Niederlande';

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
  String get languageBulgarian => 'Weißrussland';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'Ja';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'Kisuaheli';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Slowenien';

  @override
  String get export => 'Exportieren';

  @override
  String get import => 'Importieren';

  @override
  String get resetMyScore => 'Meinen Punktestand zurücksetzen';

  @override
  String get resetMyScoreConfirmation =>
      'Sind Sie sicher, dass Sie den Punktestand zurücksetzen möchten? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get resetAction => 'Zurücksetzen';

  @override
  String get regenerateOpponents => 'Gegner neu erstellen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get done => 'Fertig';

  @override
  String get privacyPolicyTitle => 'Datenschutzerklärung';

  @override
  String get privacyPolicyAccept => 'Ich stimme zu';

  @override
  String get privacyPolicyPrompt => 'Akzeptieren Sie die Datenschutzerklärung?';

  @override
  String get privacyPolicyLearnMore => 'Mehr erfahren →';

  @override
  String get privacyPolicyDecline => 'Ich lehne ab';

  @override
  String get privacyPolicyClose => 'Schließen';

  @override
  String get privacyPolicyLoadError =>
      'Datenschutzerklärung konnte nicht geladen werden. Bitte versuche es erneut.';

  @override
  String get failed => 'Fehlgeschlagen';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rang #$current • +$delta bis #$target';
  }

  @override
  String get statsTitle => 'Statistiken';

  @override
  String get statsGamesSection => 'Spiele';

  @override
  String get statsGamesStarted => 'Gestartete Spiele';

  @override
  String get statsGamesWon => 'Gewonnene Spiele';

  @override
  String get statsWinRate => 'Siegquote';

  @override
  String get statsFlawless => 'Fehlerfreie Abschlüsse';

  @override
  String get statsTimeSection => 'Zeit';

  @override
  String get statsBestTime => 'Beste Zeit';

  @override
  String get statsAverageTime => 'Durchschnittszeit';

  @override
  String get statsStreakSection => 'Serie';

  @override
  String get statsCurrentStreak => 'Aktuelle Serie';

  @override
  String get statsBestStreak => 'Beste Serie';

  @override
  String get difficultyNovice => 'Neuling';

  @override
  String get difficultyNoviceShort => 'Neu.';

  @override
  String get difficultyMedium => 'Mittel';

  @override
  String get difficultyMediumShort => 'Mit.';

  @override
  String get difficultyHigh => 'Schwer';

  @override
  String get difficultyHighShort => 'Schw.';

  @override
  String get difficultyExpert => 'Experte';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Meister';

  @override
  String get difficultyMasterShort => 'Meis.';

  @override
  String get ach_title_supermind => 'Superhirn';

  @override
  String get ach_desc_supermind =>
      'Gewinne auf jedem Schwierigkeitsgrad ohne Fehler oder Hinweise in unter 2 Minuten und 30 Sekunden';

  @override
  String get rateDialogTitle => 'Gefällt dir das Spiel? 💛';

  @override
  String get rateDialogSubtitle =>
      'Deine Bewertung hilft Sudoku, noch besser zu werden!';

  @override
  String get rateDialogDismiss => 'Schließen';

  @override
  String get rateDialogConfirm => 'Ja, sie ist toll!';
}
