// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Thuis';

  @override
  String get navDaily => 'Uitdaging';

  @override
  String get navAchievements => 'Prestaties';

  @override
  String get achievements_title => 'Prestaties';

  @override
  String get ach_section_title => 'Doelen en Beloningen';

  @override
  String get ach_title_wins_50 => '50 Overwinningen';

  @override
  String get ach_title_no_mistakes => 'IJzeren wil';

  @override
  String get ach_title_streak_3days => '3-daagse Reeks';

  @override
  String get ach_title_fast_solver => 'Bliksemsnel';

  @override
  String get ach_title_wins_100 => '100 Overwinningen';

  @override
  String get ach_desc_wins_50 => 'Win 50 keer in de klassieke modus';

  @override
  String get ach_desc_no_mistakes =>
      'Voltooi 3 spellen op rij zonder hints of fouten';

  @override
  String get ach_desc_streak_3days => 'Speel 3 dagen op rij dagelijks';

  @override
  String get ach_desc_fast_solver =>
      'Los een sudoku op in minder dan 3 minuten';

  @override
  String get ach_desc_wins_100 => 'Win 100 keer in de klassieke modus';

  @override
  String get ach_status_finished => 'Voltooid';

  @override
  String ach_status_in_progress(int current) {
    return '$current spellen voltooid';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Behaald: $date';
  }

  @override
  String get ach_locked => 'Vergrendeld';

  @override
  String get dailyStreak => 'Dagelijkse streak';

  @override
  String get selectDifficultyTitle => 'Kies moeilijkheidsgraad';

  @override
  String get selectDifficultyDailyChallenge => 'Dagelijkse uitdaging';

  @override
  String get playAction => 'Toneelstuk';

  @override
  String get championshipTitle => 'Kampioenschap';

  @override
  String championshipScore(int score) {
    return 'Score: $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Naar volgende plaats: $points punten';
  }

  @override
  String get youAreTop => 'Jij bent #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Speel deze ronde om je kampioenschapsrun een boost te geven.';

  @override
  String get championshipRoundCompletedLabel => 'Voltooid';

  @override
  String totalScore(String score) {
    return 'Totaalscore: $score';
  }

  @override
  String get meLabel => 'Mij';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Plaats $rank. $name. $points punten';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Mijn plaats $rank. $points punten';
  }

  @override
  String get pointsShort => 'punten';

  @override
  String get championshipAutoScroll => 'Scroll automatisch naar mijn positie';

  @override
  String get bestLabel => 'Beste';

  @override
  String get play => 'Toneelstuk';

  @override
  String get battleTitle => 'Strijd';

  @override
  String battleWinRate(int count) {
    return 'Wint $count%';
  }

  @override
  String get battleYouLabel => 'Jij';

  @override
  String get battleVictoryTitle => 'Jij hebt gewonnen!';

  @override
  String get battleDefeatTitle => 'Tegenstander eindigde als eerste';

  @override
  String battleDefeatMessage(String name) {
    return '$name heeft de puzzel vóór jou opgelost.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Jij hebt verloren';

  @override
  String get battleExitToMainMenu => 'Hoofdmenu';

  @override
  String get playerFlagSettingTitle => 'Speler vlag';

  @override
  String get selectPlayerFlag => 'Kies uw vlag';

  @override
  String get confirmFlagSelectionTitle => 'Bevestig uw vlag';

  @override
  String get confirmFlagSelectionMessage =>
      'Weet u zeker dat u deze vlag wilt kiezen? Je kunt je vlag later in de spelinstellingen wijzigen.';

  @override
  String get confirmFlagSelectionConfirm => 'Bevestigen';

  @override
  String get startAction => 'Begin';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Niveau $level — $difficulty';
  }

  @override
  String get rankProgress => 'Rang vooruitgang';

  @override
  String rankLabel(int rank) {
    return 'Rang $rank';
  }

  @override
  String get newGame => 'Nieuw spel';

  @override
  String get continueGame => 'Ga verder met het spel';

  @override
  String get weeklyProgress => 'Wekelijkse voortgang';

  @override
  String get rewardsTitle => 'Beloningen';

  @override
  String get rewardNoMistakesTitle => 'Voltooi de uitdaging zonder fouten';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# harten',
      one: '# hart',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Voltooi drie uitdagingen op rij';

  @override
  String get rewardUniqueTrophy => 'Unieke trofee';

  @override
  String get rewardSevenDayTitle => 'Houd een streak van 7 dagen aan';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# sterren',
      one: '# ster',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'De puzzel van vandaag';

  @override
  String get todayPuzzleDescription =>
      'Voltooi de sudoku om een ​​extra beloning te verdienen en je streak levend te houden.';

  @override
  String get continueAction => 'Doorgaan';

  @override
  String get adMessage => 'Advertentie: Vind verborgen voorwerpen! Speel nu.';

  @override
  String get adPlay => 'Toneelstuk';

  @override
  String get undo => 'Ongedaan maken';

  @override
  String get erase => 'Wissen';

  @override
  String get autoNotes => 'Automatische notities';

  @override
  String get statusOn => 'OP';

  @override
  String get statusOff => 'UIT';

  @override
  String get notes => 'Opmerkingen';

  @override
  String get hint => 'Tip';

  @override
  String get undoAdTitle => 'Bekijk de advertentie om deze ongedaan te maken';

  @override
  String get undoAdDescription =>
      'Bekijk deze korte advertentie om uw laatste zet ongedaan te maken.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Advertentie eindigt over ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Bekijk de advertentie om een ​​hint te krijgen';

  @override
  String get hintAdDescription =>
      'Bekijk deze korte advertentie om een ​​hint te verdienen.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Advertentie eindigt over ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Bekijk de advertentie om een ​​hart te herstellen';

  @override
  String get lifeAdDescription =>
      'Bekijk deze korte advertentie om een ​​rood hart te herstellen en blijf spelen.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Advertentie eindigt over ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combinatie ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Reeks $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Snelheidsbonus $time';
  }

  @override
  String comboX(int count) {
    return 'Combinatie x$count';
  }

  @override
  String streakN(int count) {
    return 'Reeks $count';
  }

  @override
  String speedBonus(String time) {
    return 'Snelheidsbonus ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Geen actief spel. Keer terug naar het startscherm.';

  @override
  String get victoryTitle => 'Gefeliciteerd!';

  @override
  String victoryMessage(String time) {
    return 'Puzzel opgelost in $time.';
  }

  @override
  String get backToHome => 'Thuis';

  @override
  String get playAnother => 'Speel opnieuw';

  @override
  String get outOfLivesTitle => 'Je hebt geen hart meer';

  @override
  String get outOfLivesDescription =>
      'Herstel één rood hart om te blijven spelen.';

  @override
  String get restoreLifeAction => 'Herstel 1 rood hart';

  @override
  String get cancelAction => 'Annuleren';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get themeSectionTitle => 'Thema';

  @override
  String get themeWhite => 'Klassiek licht';

  @override
  String get themeCream => 'Room';

  @override
  String get themeGreen => 'Munt';

  @override
  String get themeBlack => 'Donker';

  @override
  String get themePurple => 'Paars Donker';

  @override
  String get themeFontSize => 'Lettergrootte';

  @override
  String get fontSizeExtraSmall => 'Extra klein';

  @override
  String get fontSizeSmall => 'Klein';

  @override
  String get fontSizeMedium => 'Middel';

  @override
  String get fontSizeLarge => 'Groot';

  @override
  String get fontSizeExtraLarge => 'Extra groot';

  @override
  String get languageSectionTitle => 'Taal';

  @override
  String get audioSectionTitle => 'Geluid & muziek';

  @override
  String get soundsEffectsLabel => 'Geluidseffecten';

  @override
  String get vibrationLabel => 'Trillingen';

  @override
  String get comboBadgesLabel => 'Combi-badges';

  @override
  String get comboHapticsLabel => 'Badge-haptiek';

  @override
  String get miscSectionTitle => 'Ander';

  @override
  String get howToPlayTitle => 'Hoe te spelen';

  @override
  String get howToPlayRowRule =>
      'Elke rij heeft de cijfers 1 tot en met 9 zonder herhalingen';

  @override
  String get howToPlayColumnRule =>
      'Elke kolom heeft de cijfers 1 tot en met 9 zonder herhalingen';

  @override
  String get howToPlayBoxRule =>
      'Elk vakje van 3×3 heeft de cijfers 1 tot en met 9 zonder herhalingen';

  @override
  String get howToPlayFooter => 'Vul elke cel en je wint!';

  @override
  String get howToPlayAction => 'Ik heb het';

  @override
  String get championshipLocalSection => 'Kampioenschap (lokaal)';

  @override
  String get hideCompletedNumbersLabel => 'Voltooide cijfers verbergen';

  @override
  String get aboutApp => 'Over';

  @override
  String versionLabel(String version) {
    return 'Versie $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'Engels';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Duits';

  @override
  String get languageFrench => 'Frans';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'Ja';

  @override
  String get languageGeorgian => 'Ja';

  @override
  String get languageSpanish => 'Spaans';

  @override
  String get languageItalian => 'Italiaans';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Turkçe';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'Portugees';

  @override
  String get languageIndonesian => 'Bahasa Indonesië';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Nederlands';

  @override
  String get languageSwedish => 'Zweeds';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'Het is zo';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'Ja';

  @override
  String get languagePunjabi => 'Ja';

  @override
  String get languageSwahili => 'Kiswahili';

  @override
  String get languageTamil => 'Ja';

  @override
  String get languageSlovak => 'Slovenië';

  @override
  String get export => 'Exporteren';

  @override
  String get import => 'Importeren';

  @override
  String get resetMyScore => 'Reset mijn score';

  @override
  String get resetMyScoreConfirmation =>
      'Weet je zeker dat je de score wilt resetten? Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get resetAction => 'Opnieuw instellen';

  @override
  String get regenerateOpponents => 'Genereer tegenstanders';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get cancel => 'Annuleren';

  @override
  String get done => 'Klaar';

  @override
  String get privacyPolicyTitle => 'Privacybeleid';

  @override
  String get privacyPolicyAccept => 'Ik accepteer';

  @override
  String get privacyPolicyPrompt => 'Accepteert u het privacybeleid?';

  @override
  String get privacyPolicyLearnMore => 'Meer informatie →';

  @override
  String get privacyPolicyDecline => 'Ik weiger';

  @override
  String get privacyPolicyClose => 'Dichtbij';

  @override
  String get privacyPolicyLoadError =>
      'Kan het privacybeleid niet laden. Probeer het opnieuw.';

  @override
  String get failed => 'Mislukt';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rang #$current • +$delta tot #$target';
  }

  @override
  String get statsTitle => 'Statistieken';

  @override
  String get statsGamesSection => 'Spellen';

  @override
  String get statsGamesStarted => 'Spelletjes begonnen';

  @override
  String get statsGamesWon => 'Gewonnen wedstrijden';

  @override
  String get statsWinRate => 'Winstpercentage';

  @override
  String get statsFlawless => 'Onberispelijke afwerkingen';

  @override
  String get statsTimeSection => 'Tijd';

  @override
  String get statsBestTime => 'Beste tijd';

  @override
  String get statsAverageTime => 'Gemiddelde tijd';

  @override
  String get statsStreakSection => 'Streep';

  @override
  String get statsCurrentStreak => 'Huidige reeks';

  @override
  String get statsBestStreak => 'Beste reeks';

  @override
  String get difficultyNovice => 'Beginner';

  @override
  String get difficultyNoviceShort => 'Beg.';

  @override
  String get difficultyMedium => 'Gemiddeld';

  @override
  String get difficultyMediumShort => 'Gem.';

  @override
  String get difficultyHigh => 'Moeilijk';

  @override
  String get difficultyHighShort => 'Moe.';

  @override
  String get difficultyExpert => 'Deskundige';

  @override
  String get difficultyExpertShort => 'Uitv.';

  @override
  String get difficultyMaster => 'Meester';

  @override
  String get difficultyMasterShort => 'Mst.';

  @override
  String get ach_title_supermind => 'Superbrein';

  @override
  String get ach_desc_supermind =>
      'Win op elk niveau zonder fouten of hints in minder dan 2 minuten en 30 seconden';

  @override
  String get rateDialogTitle => 'Vind je het spel leuk? 💛';

  @override
  String get rateDialogSubtitle =>
      'Jouw beoordeling helpt Sudoku nog beter te worden!';

  @override
  String get rateDialogDismiss => 'Afsluiten';

  @override
  String get rateDialogConfirm => 'Ja, geweldig!';
}
