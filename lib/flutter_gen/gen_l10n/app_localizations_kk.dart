// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Судоку';

  @override
  String get navHome => 'Үй';

  @override
  String get navDaily => 'Шақыру';

  @override
  String get navAchievements => 'Жетістіктер';

  @override
  String get achievements_title => 'Жетістіктер';

  @override
  String get ach_section_title => 'Мақсаттар мен сыйақылар';

  @override
  String get ach_title_wins_50 => '50 жеңіс';

  @override
  String get ach_title_no_mistakes => 'Темір жігер';

  @override
  String get ach_title_streak_3days => '3 күн қатарынан';

  @override
  String get ach_title_fast_solver => 'Найзағайдай жылдам';

  @override
  String get ach_title_wins_100 => '100 жеңіс';

  @override
  String get ach_desc_wins_50 => 'Классикалық режимде 50 рет жеңіңіз';

  @override
  String get ach_desc_no_mistakes =>
      'Көмексіз әрі қателіксіз қатарынан 3 ойынды аяқтаңыз';

  @override
  String get ach_desc_streak_3days => 'Үш күн қатарынан күн сайын ойнаңыз';

  @override
  String get ach_desc_fast_solver => '3 минуттан кем уақытта судоку шешіңіз';

  @override
  String get ach_desc_wins_100 => 'Классикалық режимде 100 рет жеңіңіз';

  @override
  String get ach_status_finished => 'Аяқталды';

  @override
  String ach_status_in_progress(int current) {
    return '$current ойын аяқталды';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Алынған күні: $date';
  }

  @override
  String get ach_locked => 'Құлыпталған';

  @override
  String get dailyStreak => 'Күнделікті жолақ';

  @override
  String get selectDifficultyTitle => 'Қиындықты таңдаңыз';

  @override
  String get selectDifficultyDailyChallenge => 'Күнделікті қиындық';

  @override
  String get playAction => 'Ойнау';

  @override
  String get championshipTitle => 'Чемпионат';

  @override
  String championshipScore(int score) {
    return 'Ұпай $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Келесі жерге: $points pts';
  }

  @override
  String get youAreTop => 'Сіз # 1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Чемпионат жүгіруді арттыру үшін осы турды ойнаңыз.';

  @override
  String get championshipRoundCompletedLabel => 'Орындалды';

  @override
  String totalScore(String score) {
    return 'Жалпы балл: $score';
  }

  @override
  String get meLabel => 'Мені';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Орын $rank қойыңыз. $name. $points нүктелер';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Менің орным $rank. $points нүктелер';
  }

  @override
  String get pointsShort => 'п.';

  @override
  String get championshipAutoScroll =>
      'Менің позицияммен автоматты түрде айналдырыңыз';

  @override
  String get bestLabel => 'Ең жақсы';

  @override
  String get play => 'Ойнау';

  @override
  String get battleTitle => 'Шайқас';

  @override
  String battleWinRate(int count) {
    return 'Жеңеді $count%';
  }

  @override
  String get battleYouLabel => 'Сен';

  @override
  String get battleVictoryTitle => 'Сіз жеңдіңіз!';

  @override
  String get battleDefeatTitle => 'Қарсылас алдымен аяқталды';

  @override
  String battleDefeatMessage(String name) {
    return '$name сізден бұрын жұмбақты шешті.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Сіз жоғалттыңыз';

  @override
  String get battleExitToMainMenu => 'Негізгі мәзір';

  @override
  String get playerFlagSettingTitle => 'Ойнатқыштың жалаушасы';

  @override
  String get selectPlayerFlag => 'Туды таңдаңыз';

  @override
  String get confirmFlagSelectionTitle => 'Туды растаңыз';

  @override
  String get confirmFlagSelectionMessage =>
      'Сіз бұл жалаушаны таңдағыңыз келе ме? Туды кейінірек ойын параметрлерінде өзгертуге болады.';

  @override
  String get confirmFlagSelectionConfirm => 'Растау';

  @override
  String get startAction => 'Жүргізу';

  @override
  String levelHeading(int level, String difficulty) {
    return '$level деңгейі - $difficulty';
  }

  @override
  String get rankProgress => 'Жетістік деңгейі';

  @override
  String rankLabel(int rank) {
    return '$rank дәрежесі';
  }

  @override
  String get newGame => 'Жаңа ойын';

  @override
  String get continueGame => 'Ойынды жалғастырыңыз';

  @override
  String get weeklyProgress => 'Апта сайынғы прогресс';

  @override
  String get rewardsTitle => 'Марапаттар';

  @override
  String get rewardNoMistakesTitle => 'Қиындықты қателіктерсіз аяқтаңыз';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# жүректер',
      one: '# жүрек',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Қатарынан үш қиындықты аяқтаңыз';

  @override
  String get rewardUniqueTrophy => 'Бірегей олжа';

  @override
  String get rewardSevenDayTitle => '7 күндік жолақты ұстаңыз';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Жұлдыздар',
      one: '# жұлдыз',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Бүгінгі жұмбақ';

  @override
  String get todayPuzzleDescription =>
      'Sudoku-ды қосымша сыйақы алу үшін аяқтаңыз және сіздің жолыңызды тірі қалдырыңыз.';

  @override
  String get continueAction => 'Жалғастыру';

  @override
  String get adMessage => 'Жарнама: жасырын заттарды табыңыз! Қазір ойнаңыз.';

  @override
  String get adPlay => 'Ойнау';

  @override
  String get undo => 'Күтіп ұстау';

  @override
  String get erase => 'Өшіру';

  @override
  String get autoNotes => 'Авто ескертпелер';

  @override
  String get statusOn => 'Ішінде';

  @override
  String get statusOff => 'Ажыратылған';

  @override
  String get notes => 'ЕСталдар';

  @override
  String get hint => 'Тұспал';

  @override
  String get undoAdTitle => 'Болдырмау үшін жарнаманы қараңыз';

  @override
  String get undoAdDescription =>
      'Соңғы жылжыту үшін осы қысқа жарнаманы қараңыз.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Жарнама ${seconds}s-де аяқталады';
  }

  @override
  String get hintAdTitle => 'Жарнаманы кеңес алу үшін қараңыз';

  @override
  String get hintAdDescription => 'Осы қысқа жарнаманы кеңес алу үшін қараңыз.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Жарнама ${seconds}s-де аяқталады';
  }

  @override
  String get lifeAdTitle => 'Жүректі қалпына келтіру үшін жарнаманы қараңыз';

  @override
  String get lifeAdDescription =>
      'Қызыл жүректі қалпына келтіру және ойнау үшін осы қысқа жарнаманы қараңыз.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Жарнама ${seconds}s-де аяқталады';
  }

  @override
  String get gameScreenTitle => 'Судоку';

  @override
  String combo_x(int count) {
    return 'Combo × $count';
  }

  @override
  String streak_n(int count) {
    return '$count жол';
  }

  @override
  String speed_bonus(String time) {
    return 'Жылдамдық бонус $time';
  }

  @override
  String comboX(int count) {
    return 'Комбо ×$count';
  }

  @override
  String streakN(int count) {
    return '$count жол';
  }

  @override
  String speedBonus(String time) {
    return 'Жылдамдық бонус ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Белсенді ойын жоқ. Негізгі экранға оралыңыз.';

  @override
  String get victoryTitle => 'Құттықтаймыз!';

  @override
  String victoryMessage(String time) {
    return 'Жұмбақ $time түрінде шешілді.';
  }

  @override
  String get backToHome => 'Үй';

  @override
  String get playAnother => 'Қайтадан ойнаңыз';

  @override
  String get outOfLivesTitle => 'Сіз жүректеріңіз жоқсыз';

  @override
  String get outOfLivesDescription =>
      'Ойнау үшін бір қызыл жүрек қалпына келтіріңіз.';

  @override
  String get restoreLifeAction => '1 қызыл жүректі қалпына келтіріңіз';

  @override
  String get cancelAction => 'Күшін жою';

  @override
  String get settingsTitle => 'Параметрлер';

  @override
  String get themeSectionTitle => 'Тақырып';

  @override
  String get themeWhite => 'Классикалық жарық';

  @override
  String get themeCream => 'Кілегей';

  @override
  String get themeGreen => 'Талшы';

  @override
  String get themeBlack => 'Қараңғы';

  @override
  String get themePurple => 'Күлгін қараңғы';

  @override
  String get themeFontSize => 'Шрифт өлшемі';

  @override
  String get fontSizeExtraSmall => 'Қосымша кішкентай';

  @override
  String get fontSizeSmall => 'Кішкене';

  @override
  String get fontSizeMedium => 'Амал';

  @override
  String get fontSizeLarge => 'Ірі';

  @override
  String get fontSizeExtraLarge => 'Қосымша үлкен';

  @override
  String get languageSectionTitle => 'Тіл';

  @override
  String get audioSectionTitle => 'Дыбыс және музыка';

  @override
  String get soundsEffectsLabel => 'Дыбыстық әсерлер';

  @override
  String get vibrationLabel => 'Діріл';

  @override
  String get comboBadgesLabel => 'Combo төсбелгілері';

  @override
  String get comboHapticsLabel => 'Badge Haptics';

  @override
  String get miscSectionTitle => 'Өзге';

  @override
  String get howToPlayTitle => 'Қалай ойнауға болады';

  @override
  String get howToPlayRowRule => 'Әр жолда 1-ден 9-ға дейін сандар жоқ';

  @override
  String get howToPlayColumnRule =>
      'Әр бағанда 1-ден 9-ға дейін цифрлар қайталанбайды';

  @override
  String get howToPlayBoxRule =>
      'Әр 3 × 3 жолағына 1-ден 9-ға дейін сандар қайталанбайды';

  @override
  String get howToPlayFooter => 'Әр ұяшықты толтырыңыз және сіз жеңесіз!';

  @override
  String get howToPlayAction => 'Алды';

  @override
  String get championshipLocalSection => 'Чемпионат (жергілікті)';

  @override
  String get hideCompletedNumbersLabel => 'Аяқталған сандарды жасыру';

  @override
  String get aboutApp => 'Жөнінде';

  @override
  String versionLabel(String version) {
    return '$version нұсқасы';
  }

  @override
  String get aboutLegalese => 'Nahreba UzOR Inc.';

  @override
  String get languageEnglish => 'Ағылшынша';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Дайтер';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქათულთული';

  @override
  String get languageSpanish => 'Эспенол';

  @override
  String get languageItalian => 'Итальяно';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Түрікче';

  @override
  String get languagePolish => 'Полски';

  @override
  String get languagePortuguese => 'Португалықтар';

  @override
  String get languageIndonesian => 'Бахаса Индонезия';

  @override
  String get languageVietnamese => 'Tiếng việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Nederlands';

  @override
  String get languageSwedish => 'Свенка';

  @override
  String get languageRomanian => 'Романă';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Суоми';

  @override
  String get languageKazakh => 'Қазақ тілі';

  @override
  String get languageBulgarian => 'Блгарски';

  @override
  String get languageMalay => 'Bahasa melayu';

  @override
  String get languageNepali => 'Итер';

  @override
  String get languagePunjabi => 'ੰਜੰਜੀ';

  @override
  String get languageSwahili => 'Кисвахили';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Словенчина';

  @override
  String get export => 'Сыртқа шығару';

  @override
  String get import => 'Импорт';

  @override
  String get resetMyScore => 'Менің ұпайымды қалпына келтіріңіз';

  @override
  String get resetMyScoreConfirmation =>
      'Сіз есепті қалпына келтіргіңіз келе ме? Бұл әрекетті болдырмауға болмайды.';

  @override
  String get resetAction => 'Ысыру';

  @override
  String get regenerateOpponents => 'Қарсыластарды қалпына келтіріңіз';

  @override
  String get confirm => 'Растау';

  @override
  String get cancel => 'Күшін жою';

  @override
  String get done => 'Жасалды';

  @override
  String get privacyPolicyTitle => 'Құпиялылық саясаты';

  @override
  String get privacyPolicyAccept => 'Мен қабылдаймын';

  @override
  String get privacyPolicyPrompt => 'Сіз құпиялылық саясатын қабылдайсыз ба?';

  @override
  String get privacyPolicyLearnMore => 'Қосымша ақпарат →';

  @override
  String get privacyPolicyDecline => 'Мен құлдыраймын';

  @override
  String get privacyPolicyClose => 'Жабу';

  @override
  String get privacyPolicyLoadError =>
      'Құпиялылық саясатын жүктеу сәтсіз аяқталды. Қайталап көріңіз.';

  @override
  String get failed => 'Сәтсіз аяқталды';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return '#$current • + $delta-ге дейін #$target';
  }

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsGamesSection => 'Ойындар';

  @override
  String get statsGamesStarted => 'Ойындар басталды';

  @override
  String get statsGamesWon => 'Ойындар жеңді';

  @override
  String get statsWinRate => 'Жеңіс жылдамдығы';

  @override
  String get statsFlawless => 'Мінсіз әрлеу';

  @override
  String get statsTimeSection => 'Уақыт';

  @override
  String get statsBestTime => 'Ең жақсы уақыт';

  @override
  String get statsAverageTime => 'Орташа уақыт';

  @override
  String get statsStreakSection => 'Жол';

  @override
  String get statsCurrentStreak => 'Ағымдағы жолақ';

  @override
  String get statsBestStreak => 'Ең жақсы жолақ';

  @override
  String get difficultyNovice => 'Жаңадан бастаушы';

  @override
  String get difficultyNoviceShort => 'Жаң.';

  @override
  String get difficultyMedium => 'Орташа';

  @override
  String get difficultyMediumShort => 'Орта.';

  @override
  String get difficultyHigh => 'Қиын';

  @override
  String get difficultyHighShort => 'Қиын';

  @override
  String get difficultyExpert => 'Сарапшы';

  @override
  String get difficultyExpertShort => 'Сар.';

  @override
  String get difficultyMaster => 'Шебер';

  @override
  String get difficultyMasterShort => 'Шеб.';

  @override
  String get ach_title_supermind => 'Суперой';

  @override
  String get ach_desc_supermind =>
      'Кез келген қиындықта қателіксіз, көмексіз 2 минут 30 секундтан аз уақытта жеңіңіз';

  @override
  String get rateDialogTitle => 'Ойын ұнай ма? 💛';

  @override
  String get rateDialogSubtitle =>
      'Бағаңыз Sudoku-дың одан әрі жақсаруына көмектеседі!';

  @override
  String get rateDialogDismiss => 'Шығу';

  @override
  String get rateDialogConfirm => 'Иә, керемет!';
}
