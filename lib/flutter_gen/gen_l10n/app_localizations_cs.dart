// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'sudoku';

  @override
  String get navHome => 'Domov';

  @override
  String get navDaily => 'Výzva';

  @override
  String get navAchievements => 'Úspěchy';

  @override
  String get achievements_title => 'Úspěchy';

  @override
  String get ach_section_title => 'Cíle a odměny';

  @override
  String get ach_title_wins_50 => '50 výher';

  @override
  String get ach_title_no_mistakes => 'Železná vůle';

  @override
  String get ach_title_streak_3days => 'Série 3 dnů';

  @override
  String get ach_title_fast_solver => 'Bleskurychlý';

  @override
  String get ach_title_wins_100 => '100 výher';

  @override
  String get ach_desc_wins_50 => 'Vyhrajte 50krát v klasickém režimu';

  @override
  String get ach_desc_no_mistakes =>
      'Dokončete 3 hry po sobě bez nápověd a bez chyb';

  @override
  String get ach_desc_streak_3days => 'Hrajte denně 3 dny po sobě';

  @override
  String get ach_desc_fast_solver => 'Vyřešte sudoku za méně než 3 minuty';

  @override
  String get ach_desc_wins_100 => 'Vyhrajte 100krát v klasickém režimu';

  @override
  String get ach_status_finished => 'Dokončeno';

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
    return 'Získáno: $date';
  }

  @override
  String get ach_locked => 'Zamčeno';

  @override
  String get dailyStreak => 'Denní pruh';

  @override
  String get selectDifficultyTitle => 'Vyberte potíže';

  @override
  String get selectDifficultyDailyChallenge => 'Denní výzva';

  @override
  String get playAction => 'Hrát';

  @override
  String get championshipTitle => 'Mistrovství';

  @override
  String championshipScore(int score) {
    return 'Skóre $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Na další místo: $points PTS';
  }

  @override
  String get youAreTop => 'Jsi #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Zahrajte si toto kolo, abyste zvýšili svůj mistrovský běh.';

  @override
  String get championshipRoundCompletedLabel => 'Dokončeno';

  @override
  String totalScore(String score) {
    return 'Celkové skóre: $score';
  }

  @override
  String get meLabel => 'Mě';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Místo $rank. $name. $points body';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Moje místo $rank. $points body';
  }

  @override
  String get pointsShort => 'Pts';

  @override
  String get championshipAutoScroll => 'Automaticky se zkrátit na mou pozici';

  @override
  String get bestLabel => 'Nejlepší';

  @override
  String get play => 'Hrát';

  @override
  String get battleTitle => 'Bitva';

  @override
  String battleWinRate(int count) {
    return 'Vyhrává $count%';
  }

  @override
  String get battleYouLabel => 'Vy';

  @override
  String get battleVictoryTitle => 'Vyhrál jsi!';

  @override
  String get battleDefeatTitle => 'Soupeř skončil jako první';

  @override
  String battleDefeatMessage(String name) {
    return '$name vyřešil hádanku před vámi.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Ztratil jsi';

  @override
  String get battleExitToMainMenu => 'Hlavní nabídka';

  @override
  String get playerFlagSettingTitle => 'Vlajka hráče';

  @override
  String get selectPlayerFlag => 'Vyberte si vlajku';

  @override
  String get confirmFlagSelectionTitle => 'Potvrďte svoji vlajku';

  @override
  String get confirmFlagSelectionMessage =>
      'Jste si jisti, že si chcete vybrat tento příznak? V příznaku můžete změnit později v nastavení hry.';

  @override
  String get confirmFlagSelectionConfirm => 'Potvrdit';

  @override
  String get startAction => 'Začít';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Úroveň $level - $difficulty';
  }

  @override
  String get rankProgress => 'Rodnost pokroku';

  @override
  String rankLabel(int rank) {
    return 'Pozice $rank';
  }

  @override
  String get newGame => 'Nová hra';

  @override
  String get continueGame => 'Pokračujte ve hře';

  @override
  String get weeklyProgress => 'Týdenní pokrok';

  @override
  String get rewardsTitle => 'Odměny';

  @override
  String get rewardNoMistakesTitle => 'Dokončete výzvu bez chyb';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# srdce',
      one: '# srdce',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Dokončete tři výzvy v řadě';

  @override
  String get rewardUniqueTrophy => 'Unikátní trofej';

  @override
  String get rewardSevenDayTitle => 'Udržujte 7denní pruh';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# hvězdy',
      one: '# hvězda',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Dnešní hádanka';

  @override
  String get todayPuzzleDescription =>
      'Dokončete sudoku a získejte další odměnu a udržujte svůj pruh naživu.';

  @override
  String get continueAction => 'Pokračovat';

  @override
  String get adMessage => 'AD: Najděte skryté objekty! Hrajte hned.';

  @override
  String get adPlay => 'Hrát';

  @override
  String get undo => 'Vrátit zpět';

  @override
  String get erase => 'Vymazat';

  @override
  String get autoNotes => 'Automatické poznámky';

  @override
  String get statusOn => 'NA';

  @override
  String get statusOff => 'Vypnuto';

  @override
  String get notes => 'Poznámky';

  @override
  String get hint => 'Náznak';

  @override
  String get undoAdTitle => 'Sledujte AD a Undo';

  @override
  String get undoAdDescription =>
      'Podívejte se na tuto krátkou reklamu a vrátíte svůj poslední tah.';

  @override
  String undoAdCountdown(int seconds) {
    return 'AD končí v ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Sledujte AD a získejte nápovědu';

  @override
  String get hintAdDescription =>
      'Sledujte tuto krátkou reklamu a získejte nápovědu.';

  @override
  String hintAdCountdown(int seconds) {
    return 'AD končí v ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Sledujte AD a obnovte srdce';

  @override
  String get lifeAdDescription =>
      'Podívejte se na tuto krátkou reklamu a obnovte červené srdce a pokračujte v hraní.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'AD končí v ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'sudoku';

  @override
  String combo_x(int count) {
    return 'Combo × $count';
  }

  @override
  String streak_n(int count) {
    return 'Série $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Rychlý bonus $time';
  }

  @override
  String comboX(int count) {
    return 'Kombo ×$count';
  }

  @override
  String streakN(int count) {
    return 'Série $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonus rychlosti ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Žádná aktivní hra. Vrátit se na domovskou obrazovku.';

  @override
  String get victoryTitle => 'Gratuluji!';

  @override
  String victoryMessage(String time) {
    return 'Hádanka vyřešena v $time.';
  }

  @override
  String get backToHome => 'Domov';

  @override
  String get playAnother => 'Hrát znovu';

  @override
  String get outOfLivesTitle => 'Jsi mimo srdce';

  @override
  String get outOfLivesDescription =>
      'Obnovte jedno červené srdce, abyste mohli hrát.';

  @override
  String get restoreLifeAction => 'Obnovte 1 červené srdce';

  @override
  String get cancelAction => 'Zrušit';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get themeSectionTitle => 'Téma';

  @override
  String get themeWhite => 'Klasické světlo';

  @override
  String get themeCream => 'Krém';

  @override
  String get themeGreen => 'Máta';

  @override
  String get themeBlack => 'Tma';

  @override
  String get themePurple => 'Fialová tma';

  @override
  String get themeFontSize => 'Velikost písma';

  @override
  String get fontSizeExtraSmall => 'Extra malý';

  @override
  String get fontSizeSmall => 'Malý';

  @override
  String get fontSizeMedium => 'Střední';

  @override
  String get fontSizeLarge => 'Velký';

  @override
  String get fontSizeExtraLarge => 'Extra velké';

  @override
  String get languageSectionTitle => 'Jazyk';

  @override
  String get audioSectionTitle => 'Zvuk a hudba';

  @override
  String get soundsEffectsLabel => 'Zvukové efekty';

  @override
  String get vibrationLabel => 'Vibrace';

  @override
  String get comboBadgesLabel => 'Combo odznaky';

  @override
  String get comboHapticsLabel => 'Odznak haptics';

  @override
  String get miscSectionTitle => 'Ostatní';

  @override
  String get howToPlayTitle => 'Jak hrát';

  @override
  String get howToPlayRowRule => 'Každý řádek má číslice 1 až 9 bez opakování';

  @override
  String get howToPlayColumnRule =>
      'Každý sloupec má číslice 1 až 9 bez opakování';

  @override
  String get howToPlayBoxRule =>
      'Každá krabice 3 × 3 má číslice 1 až 9 bez opakování';

  @override
  String get howToPlayFooter => 'Vyplňte každou celu a vyhrajete!';

  @override
  String get howToPlayAction => 'Mám to';

  @override
  String get championshipLocalSection => 'Mistrovství (místní)';

  @override
  String get hideCompletedNumbersLabel => 'Skrýt dokončené číslice';

  @override
  String get aboutApp => 'O';

  @override
  String versionLabel(String version) {
    return 'Verze $version';
  }

  @override
  String get aboutLegalese => 'UZOR';

  @override
  String get languageEnglish => 'angličtina';

  @override
  String get languageRussian => 'Руский';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'německy';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'španělsky';

  @override
  String get languageItalian => 'italština';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Turecko';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'português';

  @override
  String get languageIndonesian => 'Bahasa Indonésie';

  @override
  String get languageVietnamese => 'Tiếng việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Nizozemsko';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'Қазақ т і';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'kiswahilština';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'slovenština';

  @override
  String get export => 'Vývozní';

  @override
  String get import => 'Importovat';

  @override
  String get resetMyScore => 'Resetujte mé skóre';

  @override
  String get resetMyScoreConfirmation =>
      'Jste si jisti, že chcete resetovat skóre? Tuto akci nelze vrátit zpět.';

  @override
  String get resetAction => 'Resetovat';

  @override
  String get regenerateOpponents => 'Regenerujte soupeře';

  @override
  String get confirm => 'Potvrdit';

  @override
  String get cancel => 'Zrušit';

  @override
  String get done => 'Hotovo';

  @override
  String get privacyPolicyTitle => 'Zásady ochrany osobních údajů';

  @override
  String get privacyPolicyAccept => 'Přijímám';

  @override
  String get privacyPolicyPrompt => 'Přijímáte zásady ochrany osobních údajů?';

  @override
  String get privacyPolicyLearnMore => 'Další informace →';

  @override
  String get privacyPolicyDecline => 'Odmítám';

  @override
  String get privacyPolicyClose => 'Blízko';

  @override
  String get privacyPolicyLoadError =>
      'Nepodařilo se načíst zásady ochrany osobních údajů. Zkuste to prosím znovu.';

  @override
  String get failed => 'Selhal';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rank #$current • +$delta až #$target';
  }

  @override
  String get statsTitle => 'Statistika';

  @override
  String get statsGamesSection => 'Hry';

  @override
  String get statsGamesStarted => 'Hry začaly';

  @override
  String get statsGamesWon => 'Hry vyhrály';

  @override
  String get statsWinRate => 'Míra Win';

  @override
  String get statsFlawless => 'Bezchybné povrchové úpravy';

  @override
  String get statsTimeSection => 'Čas';

  @override
  String get statsBestTime => 'Nejlepší čas';

  @override
  String get statsAverageTime => 'Průměrná doba';

  @override
  String get statsStreakSection => 'Pruh';

  @override
  String get statsCurrentStreak => 'Aktuální pruh';

  @override
  String get statsBestStreak => 'Nejlepší pruh';

  @override
  String get difficultyNovice => 'Začátečník';

  @override
  String get difficultyNoviceShort => 'Zač.';

  @override
  String get difficultyMedium => 'Střední';

  @override
  String get difficultyMediumShort => 'Stř.';

  @override
  String get difficultyHigh => 'Obtížné';

  @override
  String get difficultyHighShort => 'Obt.';

  @override
  String get difficultyExpert => 'Expert';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Mistr';

  @override
  String get difficultyMasterShort => 'Mistr';

  @override
  String get ach_title_supermind => 'Supermysl';

  @override
  String get ach_desc_supermind =>
      'Vyhrajte na libovolné obtížnosti bez chyb či nápověd do 2 minut a 30 sekund';

  @override
  String get rateDialogTitle => 'Baví tě hra? 💛';

  @override
  String get rateDialogSubtitle =>
      'Tvé hodnocení pomůže Sudokuu být ještě lepší!';

  @override
  String get rateDialogDismiss => 'Odejít';

  @override
  String get rateDialogConfirm => 'Ano, je skvělá!';
}
