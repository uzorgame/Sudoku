// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Nyumbani';

  @override
  String get navDaily => 'Changamoto';

  @override
  String get navAchievements => 'Mafanikio';

  @override
  String get achievements_title => 'Mafanikio';

  @override
  String get ach_section_title => 'Malengo na Zawadi';

  @override
  String get ach_title_wins_50 => 'Ushindi 50';

  @override
  String get ach_title_no_mistakes => 'Nia ya Chuma';

  @override
  String get ach_title_streak_3days => 'Mfululizo wa Siku 3';

  @override
  String get ach_title_fast_solver => 'Mwepesi kama Radi';

  @override
  String get ach_title_wins_100 => 'Ushindi 100';

  @override
  String get ach_desc_wins_50 => 'Shinda mara 50 katika hali ya Classic';

  @override
  String get ach_desc_no_mistakes =>
      'Kamilisha michezo 3 mfululizo bila vidokezo wala makosa';

  @override
  String get ach_desc_streak_3days => 'Cheza kila siku kwa siku 3 mfululizo';

  @override
  String get ach_desc_fast_solver => 'Tatua sudoku ndani ya dakika 3';

  @override
  String get ach_desc_wins_100 => 'Shinda mara 100 katika hali ya Classic';

  @override
  String get ach_status_finished => 'Imekamilika';

  @override
  String ach_status_in_progress(int current) {
    return 'Michezo $current imekamilika';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Ilipatikana: $date';
  }

  @override
  String get ach_locked => 'Imefungwa';

  @override
  String get dailyStreak => 'Kila siku streak';

  @override
  String get selectDifficultyTitle => 'Chagua ugumu';

  @override
  String get selectDifficultyDailyChallenge => 'Changamoto ya kila siku';

  @override
  String get playAction => 'Cheza';

  @override
  String get championshipTitle => 'Mashindano';

  @override
  String championshipScore(int score) {
    return 'Alama $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Kwa mahali palipo: $points pts';
  }

  @override
  String get youAreTop => 'Wewe ni #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Cheza raundi hii ili kuongeza ubingwa wako.';

  @override
  String get championshipRoundCompletedLabel => 'Imekamilika';

  @override
  String totalScore(String score) {
    return 'Jumla ya alama: $score';
  }

  @override
  String get meLabel => 'Mimi';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Weka $rank. $name. $points alama';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Mahali pangu $rank. $points alama';
  }

  @override
  String get pointsShort => 'pts';

  @override
  String get championshipAutoScroll => 'Otomatiki kwa msimamo wangu';

  @override
  String get bestLabel => 'Bora';

  @override
  String get play => 'Cheza';

  @override
  String get battleTitle => 'Vita';

  @override
  String battleWinRate(int count) {
    return 'Inashinda $count%';
  }

  @override
  String get battleYouLabel => 'Wewe';

  @override
  String get battleVictoryTitle => 'Umeshinda!';

  @override
  String get battleDefeatTitle => 'Mpinzani alimaliza kwanza';

  @override
  String battleDefeatMessage(String name) {
    return '$name kutatua puzzle mbele yako.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Umepotea';

  @override
  String get battleExitToMainMenu => 'Menyu kuu';

  @override
  String get playerFlagSettingTitle => 'Bendera ya mchezaji';

  @override
  String get selectPlayerFlag => 'Chagua bendera yako';

  @override
  String get confirmFlagSelectionTitle => 'Thibitisha bendera yako';

  @override
  String get confirmFlagSelectionMessage =>
      'Je! Una uhakika unataka kuchagua bendera hii? Unaweza kubadilisha bendera yako baadaye katika mipangilio ya mchezo.';

  @override
  String get confirmFlagSelectionConfirm => 'Thibitisha';

  @override
  String get startAction => 'Anza';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Kiwango $level - $difficulty';
  }

  @override
  String get rankProgress => 'Maendeleo ya kiwango';

  @override
  String rankLabel(int rank) {
    return 'Nafasi $rank';
  }

  @override
  String get newGame => 'Mchezo mpya';

  @override
  String get continueGame => 'Endelea mchezo';

  @override
  String get weeklyProgress => 'Maendeleo ya kila wiki';

  @override
  String get rewardsTitle => 'Thawabu';

  @override
  String get rewardNoMistakesTitle => 'Maliza changamoto bila makosa';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mioyo',
      one: '# moyo',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Kamilisha changamoto tatu mfululizo';

  @override
  String get rewardUniqueTrophy => 'Nyara ya kipekee';

  @override
  String get rewardSevenDayTitle => 'Dumisha safu ya siku 7';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# nyota',
      one: '# nyota',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Puzzle ya leo';

  @override
  String get todayPuzzleDescription =>
      'Maliza Sudoku kupata thawabu ya ziada na kuweka safu yako hai.';

  @override
  String get continueAction => 'Endelea';

  @override
  String get adMessage => 'AD: Pata vitu vilivyofichwa! Cheza sasa.';

  @override
  String get adPlay => 'Cheza';

  @override
  String get undo => 'Ondoa';

  @override
  String get erase => 'Futa';

  @override
  String get autoNotes => 'Vidokezo vya kiotomatiki';

  @override
  String get statusOn => 'On';

  @override
  String get statusOff => 'Mbali';

  @override
  String get notes => 'Vidokezo';

  @override
  String get hint => 'Dokezo';

  @override
  String get undoAdTitle => 'Tazama tangazo ili kuondoa';

  @override
  String get undoAdDescription =>
      'Tazama tangazo hili fupi ili kuondoa hoja yako ya mwisho.';

  @override
  String undoAdCountdown(int seconds) {
    return 'AD inaisha katika ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Tazama tangazo kupata wazo';

  @override
  String get hintAdDescription => 'Tazama tangazo hili fupi kupata maoni.';

  @override
  String hintAdCountdown(int seconds) {
    return 'AD inaisha katika ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Tazama tangazo ili kurejesha moyo';

  @override
  String get lifeAdDescription =>
      'Tazama tangazo hili fupi ili kurejesha moyo nyekundu na kuendelea kucheza.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'AD inaisha katika ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combo × $count';
  }

  @override
  String streak_n(int count) {
    return 'Mfululizo $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bonasi ya kasi $time';
  }

  @override
  String comboX(int count) {
    return 'Kombo ×$count';
  }

  @override
  String streakN(int count) {
    return 'Mfululizo $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonasi ya kasi ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Hakuna mchezo wa kufanya kazi. Rudi kwenye skrini ya nyumbani.';

  @override
  String get victoryTitle => 'Hongera!';

  @override
  String victoryMessage(String time) {
    return 'Puzzle iliyotatuliwa katika $time.';
  }

  @override
  String get backToHome => 'Nyumbani';

  @override
  String get playAnother => 'Cheza tena';

  @override
  String get outOfLivesTitle => 'Uko nje ya mioyo';

  @override
  String get outOfLivesDescription =>
      'Rejesha moyo mmoja nyekundu ili uendelee kucheza.';

  @override
  String get restoreLifeAction => 'Rejesha moyo 1 nyekundu';

  @override
  String get cancelAction => 'Ghairi';

  @override
  String get settingsTitle => 'Mipangilio';

  @override
  String get themeSectionTitle => 'Mada';

  @override
  String get themeWhite => 'Mwanga wa kawaida';

  @override
  String get themeCream => 'Krimu';

  @override
  String get themeGreen => 'Minty';

  @override
  String get themeBlack => 'Giza';

  @override
  String get themePurple => 'Zambarau giza';

  @override
  String get themeFontSize => 'Saizi ya fonti';

  @override
  String get fontSizeExtraSmall => 'Kidogo kidogo';

  @override
  String get fontSizeSmall => 'Ndogo';

  @override
  String get fontSizeMedium => 'Kati';

  @override
  String get fontSizeLarge => 'Kubwa';

  @override
  String get fontSizeExtraLarge => 'Kubwa ya ziada';

  @override
  String get languageSectionTitle => 'Lugha';

  @override
  String get audioSectionTitle => 'Sauti na Muziki';

  @override
  String get soundsEffectsLabel => 'Athari za sauti';

  @override
  String get vibrationLabel => 'Mtikisiko';

  @override
  String get comboBadgesLabel => 'Beji za combo';

  @override
  String get comboHapticsLabel => 'Mtikisiko wa beji';

  @override
  String get miscSectionTitle => 'Nyingine';

  @override
  String get howToPlayTitle => 'Jinsi ya kucheza';

  @override
  String get howToPlayRowRule => 'Kila safu ina nambari 1 hadi 9 bila kurudiwa';

  @override
  String get howToPlayColumnRule =>
      'Kila safu ina nambari 1 hadi 9 bila kurudiwa';

  @override
  String get howToPlayBoxRule =>
      'Kila sanduku 3 × 3 lina nambari 1 hadi 9 bila kurudiwa';

  @override
  String get howToPlayFooter => 'Jaza kila seli na unashinda!';

  @override
  String get howToPlayAction => 'Nimepata';

  @override
  String get championshipLocalSection => 'Mashindano (ya ndani)';

  @override
  String get hideCompletedNumbersLabel => 'Ficha nambari zilizokamilishwa';

  @override
  String get aboutApp => 'Kuhusu';

  @override
  String versionLabel(String version) {
    return 'Toleo $version';
  }

  @override
  String get aboutLegalese => 'UZOR';

  @override
  String get languageEnglish => 'Kiingereza';

  @override
  String get languageRussian => 'Руский';

  @override
  String get languageUkrainian => 'Українська';

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
  String get languageVietnamese => 'Tiếng việt';

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
  String get languageNepali => 'नेप';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'Kiswahili';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Slovenčina';

  @override
  String get export => 'Kuuza nje';

  @override
  String get import => 'Kuagiza';

  @override
  String get resetMyScore => 'Rudisha alama yangu';

  @override
  String get resetMyScoreConfirmation =>
      'Je! Una uhakika unataka kuweka upya alama? Kitendo hiki hakiwezi kufutwa.';

  @override
  String get resetAction => 'Rudisha';

  @override
  String get regenerateOpponents => 'Wapinzani upya';

  @override
  String get confirm => 'Thibitisha';

  @override
  String get cancel => 'Ghairi';

  @override
  String get done => 'Imekamilika';

  @override
  String get privacyPolicyTitle => 'Sera ya faragha';

  @override
  String get privacyPolicyAccept => 'Nakubali';

  @override
  String get privacyPolicyPrompt => 'Je! Unakubali sera ya faragha?';

  @override
  String get privacyPolicyLearnMore => 'Jifunze zaidi →';

  @override
  String get privacyPolicyDecline => 'Ninapungua';

  @override
  String get privacyPolicyClose => 'Karibu';

  @override
  String get privacyPolicyLoadError =>
      'Imeshindwa kupakia sera ya faragha. Tafadhali jaribu tena.';

  @override
  String get failed => 'Imeshindwa';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Nafasi #$current • +$delta hadi #$target';
  }

  @override
  String get statsTitle => 'Takwimu';

  @override
  String get statsGamesSection => 'Michezo';

  @override
  String get statsGamesStarted => 'Michezo ilianza';

  @override
  String get statsGamesWon => 'Michezo ilishinda';

  @override
  String get statsWinRate => 'Kiwango cha kushinda';

  @override
  String get statsFlawless => 'Kumaliza bila makosa';

  @override
  String get statsTimeSection => 'Wakati';

  @override
  String get statsBestTime => 'Wakati mzuri';

  @override
  String get statsAverageTime => 'Wakati wa wastani';

  @override
  String get statsStreakSection => 'Mfululizo';

  @override
  String get statsCurrentStreak => 'Streak ya sasa';

  @override
  String get statsBestStreak => 'Streak bora';

  @override
  String get difficultyNovice => 'Mwanzo';

  @override
  String get difficultyNoviceShort => 'Novemba.';

  @override
  String get difficultyMedium => 'Kati';

  @override
  String get difficultyMediumShort => 'Kat.';

  @override
  String get difficultyHigh => 'Juu';

  @override
  String get difficultyHighShort => 'Ushauri.';

  @override
  String get difficultyExpert => 'Mtaalam';

  @override
  String get difficultyExpertShort => 'Mta.';

  @override
  String get difficultyMaster => 'Mwalimu';

  @override
  String get difficultyMasterShort => 'MST.';

  @override
  String get ach_title_supermind => 'Akili Bora';

  @override
  String get ach_desc_supermind =>
      'Shinda kwa ugumu wowote bila makosa au vidokezo ndani ya dakika 2 na sekunde 30';

  @override
  String get rateDialogTitle => 'Je, unapenda mchezo? 💛';

  @override
  String get rateDialogSubtitle =>
      'Ukadiriaji wako utasaidia Sudoku kuwa bora zaidi!';

  @override
  String get rateDialogDismiss => 'Ondoka';

  @override
  String get rateDialogConfirm => 'Ndiyo, ni nzuri sana!';
}
