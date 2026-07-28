// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'sudoku';

  @override
  String get navHome => 'Domov';

  @override
  String get navDaily => 'Výzva';

  @override
  String get navAchievements => 'Úspechy';

  @override
  String get achievements_title => 'Úspechy';

  @override
  String get ach_section_title => 'Ciele a odmeny';

  @override
  String get ach_title_wins_50 => '50 výhier';

  @override
  String get ach_title_no_mistakes => 'Železná vôľa';

  @override
  String get ach_title_streak_3days => 'Séria 3 dní';

  @override
  String get ach_title_fast_solver => 'Bleskurýchly';

  @override
  String get ach_title_wins_100 => '100 výhier';

  @override
  String get ach_desc_wins_50 => 'Vyhraj 50-krát v klasickom režime';

  @override
  String get ach_desc_no_mistakes =>
      'Dokončite 3 hry po sebe bez rád a bez chýb';

  @override
  String get ach_desc_streak_3days => 'Hraj každý deň 3 dni po sebe';

  @override
  String get ach_desc_fast_solver => 'Vyrieš sudoku za menej než 3 minúty';

  @override
  String get ach_desc_wins_100 => 'Vyhraj 100-krát v klasickom režime';

  @override
  String get ach_status_finished => 'Dokončené';

  @override
  String ach_status_in_progress(int current) {
    return 'Dokončené hry: $current';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Získané: $date';
  }

  @override
  String get ach_locked => 'Zamknuté';

  @override
  String get dailyStreak => 'Denná séria';

  @override
  String get selectDifficultyTitle => 'Vyberte si obtiažnosť';

  @override
  String get selectDifficultyDailyChallenge => 'Denná výzva';

  @override
  String get playAction => 'Hrať';

  @override
  String get championshipTitle => 'majstrovstvá';

  @override
  String championshipScore(int score) {
    return 'Skóre $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Na ďalšie miesto: $points bodov';
  }

  @override
  String get youAreTop => 'Si #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Zahrajte si toto kolo, aby ste zvýšili svoj majstrovský beh.';

  @override
  String get championshipRoundCompletedLabel => 'Dokončené';

  @override
  String totalScore(String score) {
    return 'Celkové skóre: $score';
  }

  @override
  String get meLabel => 'Ja';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Miesto $rank. $name. $points bodov';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Moje miesto $rank. $points bodov';
  }

  @override
  String get pointsShort => 'bodov';

  @override
  String get championshipAutoScroll => 'Automatické posúvanie na moju pozíciu';

  @override
  String get bestLabel => 'Najlepšie';

  @override
  String get play => 'Hrať';

  @override
  String get battleTitle => 'Bitka';

  @override
  String battleWinRate(int count) {
    return 'Vyhráva $count%';
  }

  @override
  String get battleYouLabel => 'vy';

  @override
  String get battleVictoryTitle => 'Vyhrali ste!';

  @override
  String get battleDefeatTitle => 'Súper skončil prvý';

  @override
  String battleDefeatMessage(String name) {
    return '$name vyriešil hádanku pred vami.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Prehrali ste';

  @override
  String get battleExitToMainMenu => 'Hlavné menu';

  @override
  String get playerFlagSettingTitle => 'Vlajka hráča';

  @override
  String get selectPlayerFlag => 'Vyberte si vlajku';

  @override
  String get confirmFlagSelectionTitle => 'Potvrďte svoju vlajku';

  @override
  String get confirmFlagSelectionMessage =>
      'Naozaj chcete vybrať túto vlajku? Svoju vlajku môžete neskôr zmeniť v nastaveniach hry.';

  @override
  String get confirmFlagSelectionConfirm => 'Potvrďte';

  @override
  String get startAction => 'Štart';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Úroveň $level – $difficulty';
  }

  @override
  String get rankProgress => 'Postup v poradí';

  @override
  String rankLabel(int rank) {
    return 'Hodnotenie $rank';
  }

  @override
  String get newGame => 'Nová hra';

  @override
  String get continueGame => 'Pokračovať v hre';

  @override
  String get weeklyProgress => 'Týždenný pokrok';

  @override
  String get rewardsTitle => 'Odmeny';

  @override
  String get rewardNoMistakesTitle => 'Dokončite výzvu bez chýb';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# srdiečka',
      one: '# srdce',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Splňte tri výzvy za sebou';

  @override
  String get rewardUniqueTrophy => 'Jedinečná trofej';

  @override
  String get rewardSevenDayTitle => 'Udržujte 7-dňovú sériu';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# hviezdy',
      one: '# hviezda',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Dnešná hádanka';

  @override
  String get todayPuzzleDescription =>
      'Dokončite sudoku a získajte extra odmenu a udržte si sériu nažive.';

  @override
  String get continueAction => 'Pokračovať';

  @override
  String get adMessage => 'Reklama: Nájdite skryté predmety! Hrajte teraz.';

  @override
  String get adPlay => 'Hrať';

  @override
  String get undo => 'Vrátiť späť';

  @override
  String get erase => 'Vymazať';

  @override
  String get autoNotes => 'Automatické poznámky';

  @override
  String get statusOn => 'ZAP.';

  @override
  String get statusOff => 'VYPNUTÉ';

  @override
  String get notes => 'Poznámky';

  @override
  String get hint => 'Nápoveda';

  @override
  String get undoAdTitle => 'Pozrite si reklamu, ktorú chcete vrátiť späť';

  @override
  String get undoAdDescription =>
      'Pozrite si túto krátku reklamu a zrušte svoj posledný krok.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Reklama sa skončí o ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Pozrite si reklamu a získajte tip';

  @override
  String get hintAdDescription =>
      'Pozrite si túto krátku reklamu a získajte tip.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Reklama sa skončí o ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Pozrite si reklamu na obnovenie srdca';

  @override
  String get lifeAdDescription =>
      'Pozrite si túto krátku reklamu a obnovte červené srdce a hrajte ďalej.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Reklama sa skončí o ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'sudoku';

  @override
  String combo_x(int count) {
    return 'Kombinácia ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Pruh $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bonus za rýchlosť $time';
  }

  @override
  String comboX(int count) {
    return 'Kombinácia x$count';
  }

  @override
  String streakN(int count) {
    return 'Pruh $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonus za rýchlosť ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Žiadna aktívna hra. Vráťte sa na domovskú obrazovku.';

  @override
  String get victoryTitle => 'Gratulujem!';

  @override
  String victoryMessage(String time) {
    return 'Hádanka vyriešená za $time.';
  }

  @override
  String get backToHome => 'Domov';

  @override
  String get playAnother => 'Hrajte znova';

  @override
  String get outOfLivesTitle => 'Si bez srdca';

  @override
  String get outOfLivesDescription =>
      'Obnovte jedno červené srdce, aby ste mohli hrať ďalej.';

  @override
  String get restoreLifeAction => 'Obnovte 1 červené srdce';

  @override
  String get cancelAction => 'Zrušiť';

  @override
  String get settingsTitle => 'Nastavenia';

  @override
  String get themeSectionTitle => 'Téma';

  @override
  String get themeWhite => 'Klasické svetlo';

  @override
  String get themeCream => 'Krém';

  @override
  String get themeGreen => 'Mincovňa';

  @override
  String get themeBlack => 'Tmavý';

  @override
  String get themePurple => 'Fialová Tmavá';

  @override
  String get themeFontSize => 'Veľkosť písma';

  @override
  String get fontSizeExtraSmall => 'Extra malý';

  @override
  String get fontSizeSmall => 'Malý';

  @override
  String get fontSizeMedium => 'Stredná';

  @override
  String get fontSizeLarge => 'Veľký';

  @override
  String get fontSizeExtraLarge => 'Extra veľké';

  @override
  String get languageSectionTitle => 'Jazyk';

  @override
  String get audioSectionTitle => 'Zvuk a hudba';

  @override
  String get soundsEffectsLabel => 'Zvukové efekty';

  @override
  String get vibrationLabel => 'Vibrácie';

  @override
  String get comboBadgesLabel => 'Kombinované odznaky';

  @override
  String get comboHapticsLabel => 'Haptika odznaku';

  @override
  String get miscSectionTitle => 'Iné';

  @override
  String get howToPlayTitle => 'Ako hrať';

  @override
  String get howToPlayRowRule =>
      'Každý riadok má číslice 1 až 9 bez opakovania';

  @override
  String get howToPlayColumnRule =>
      'Každý stĺpec obsahuje číslice 1 až 9 bez opakovania';

  @override
  String get howToPlayBoxRule =>
      'Každé políčko 3×3 má číslice 1 až 9 bez opakovania';

  @override
  String get howToPlayFooter => 'Vyplňte každú bunku a vyhráte!';

  @override
  String get howToPlayAction => 'Dobre';

  @override
  String get championshipLocalSection => 'majstrovstvá (miestne)';

  @override
  String get hideCompletedNumbersLabel => 'Skryť dokončené číslice';

  @override
  String get aboutApp => 'O';

  @override
  String versionLabel(String version) {
    return 'Verzia $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'angličtina';

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
  String get languageSpanish => 'Španielčina';

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
  String get languageIndonesian => 'Bahasa Indonézia';

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
  String get languageCzech => 'čeština';

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
  String get languageSwahili => 'kiswahilčina';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'slovenčina';

  @override
  String get export => 'Exportovať';

  @override
  String get import => 'Importovať';

  @override
  String get resetMyScore => 'Obnoviť moje skóre';

  @override
  String get resetMyScoreConfirmation =>
      'Naozaj chcete obnoviť skóre? Túto akciu nie je možné vrátiť späť.';

  @override
  String get resetAction => 'Resetovať';

  @override
  String get regenerateOpponents => 'Regenerovať protivníkov';

  @override
  String get confirm => 'Potvrďte';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get done => 'Hotovo';

  @override
  String get privacyPolicyTitle => 'Zásady ochrany osobných údajov';

  @override
  String get privacyPolicyAccept => 'akceptujem';

  @override
  String get privacyPolicyPrompt =>
      'Súhlasíte so Zásadami ochrany osobných údajov?';

  @override
  String get privacyPolicyLearnMore => 'Zistite viac →';

  @override
  String get privacyPolicyDecline => 'odmietam';

  @override
  String get privacyPolicyClose => 'Zavrieť';

  @override
  String get privacyPolicyLoadError =>
      'Nepodarilo sa načítať zásady ochrany osobných údajov. Skúste to znova.';

  @override
  String get failed => 'Nepodarilo sa';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Poradie #$current • +$delta až #$target';
  }

  @override
  String get statsTitle => 'Štatistiky';

  @override
  String get statsGamesSection => 'Hry';

  @override
  String get statsGamesStarted => 'Hry sa začali';

  @override
  String get statsGamesWon => 'Vyhrané hry';

  @override
  String get statsWinRate => 'Miera výhry';

  @override
  String get statsFlawless => 'Bezchybné povrchové úpravy';

  @override
  String get statsTimeSection => 'Čas';

  @override
  String get statsBestTime => 'Najlepší čas';

  @override
  String get statsAverageTime => 'Priemerný čas';

  @override
  String get statsStreakSection => 'Pruhovať';

  @override
  String get statsCurrentStreak => 'Aktuálna séria';

  @override
  String get statsBestStreak => 'Najlepšia séria';

  @override
  String get difficultyNovice => 'nováčik';

  @override
  String get difficultyNoviceShort => 'Zač.';

  @override
  String get difficultyMedium => 'Stredne pokročilý';

  @override
  String get difficultyMediumShort => 'Str.';

  @override
  String get difficultyHigh => 'Pokročilé';

  @override
  String get difficultyHighShort => 'Pok.';

  @override
  String get difficultyExpert => 'Expert';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Majster';

  @override
  String get difficultyMasterShort => 'Maj.';

  @override
  String get ach_title_supermind => 'Supermyseľ';

  @override
  String get ach_desc_supermind =>
      'Vyhrajte na ľubovoľnej obtiažnosti bez chýb či rád za menej ako 2 minúty a 30 sekúnd';

  @override
  String get rateDialogTitle => 'Páči sa ti hra? 💛';

  @override
  String get rateDialogSubtitle =>
      'Tvoje hodnotenie pomôže Sudokuu byť ešte lepším!';

  @override
  String get rateDialogDismiss => 'Odísť';

  @override
  String get rateDialogConfirm => 'Áno, je skvelá!';
}
