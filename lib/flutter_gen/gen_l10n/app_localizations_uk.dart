// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Судоку';

  @override
  String get navHome => 'Головна';

  @override
  String get navDaily => 'Виклик';

  @override
  String get navAchievements => 'Досягнення';

  @override
  String get achievements_title => 'Досягнення';

  @override
  String get ach_section_title => 'Цілі та нагороди';

  @override
  String get ach_title_wins_50 => '50 перемог';

  @override
  String get ach_title_no_mistakes => 'Залізна воля';

  @override
  String get ach_title_streak_3days => 'Серія 3 днів';

  @override
  String get ach_title_fast_solver => 'Блискавично';

  @override
  String get ach_title_wins_100 => '100 перемог';

  @override
  String get ach_desc_wins_50 => 'Переможіть 50 разів у класиці';

  @override
  String get ach_desc_no_mistakes =>
      'Пройдіть 3 ігри поспіль без підказок і без помилок';

  @override
  String get ach_desc_streak_3days => 'Грайте щодня 3 дні поспіль';

  @override
  String get ach_desc_fast_solver => 'Розв’яжіть судоку менш ніж за 3 хвилини';

  @override
  String get ach_desc_wins_100 => 'Переможіть 100 разів у класиці';

  @override
  String get ach_status_finished => 'Завершено';

  @override
  String ach_status_in_progress(int current) {
    return '$current ігор завершено';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Отримано: $date';
  }

  @override
  String get ach_locked => 'Заблоковано';

  @override
  String get dailyStreak => 'Ланцюг днів';

  @override
  String get selectDifficultyTitle => 'Виберіть складність';

  @override
  String get selectDifficultyDailyChallenge => 'Щоденний виклик';

  @override
  String get playAction => 'Грати';

  @override
  String get championshipTitle => 'Чемпіонат';

  @override
  String championshipScore(int score) {
    return 'Рахунок $score';
  }

  @override
  String toNextPlace(int points) {
    return 'До наступного місця: $points оч.';
  }

  @override
  String get youAreTop => 'Ви №1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Зіграйте в цьому раунді, щоб просунутися в чемпіонаті.';

  @override
  String get championshipRoundCompletedLabel => 'Завершено';

  @override
  String totalScore(String score) {
    return 'Загальний рахунок: $score';
  }

  @override
  String get meLabel => 'Я';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Місце $rank. $name. $points очок';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Моє місце $rank. $points очок';
  }

  @override
  String get pointsShort => 'оч.';

  @override
  String get championshipAutoScroll => 'Автоскрол до мого місця';

  @override
  String get bestLabel => 'Найкращий результат';

  @override
  String get play => 'Грати';

  @override
  String get battleTitle => 'Битва';

  @override
  String battleWinRate(int count) {
    return 'Перемог $count%';
  }

  @override
  String get battleYouLabel => 'Я';

  @override
  String get battleVictoryTitle => 'Ти переміг!';

  @override
  String get battleDefeatTitle => 'Суперник переміг';

  @override
  String battleDefeatMessage(String name) {
    return '$name розв\'язав головоломку раніше за тебе.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Ви програли';

  @override
  String get battleExitToMainMenu => 'Головне меню';

  @override
  String get playerFlagSettingTitle => 'Прапор гравця';

  @override
  String get selectPlayerFlag => 'Обери свій прапор';

  @override
  String get confirmFlagSelectionTitle => 'Підтвердь свій прапор';

  @override
  String get confirmFlagSelectionMessage =>
      'Ти впевнений, що хочеш обрати цей прапор? Ти зможеш змінити прапор пізніше в налаштуваннях гри.';

  @override
  String get confirmFlagSelectionConfirm => 'Приймаю';

  @override
  String get startAction => 'Почати';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Рівень $level — $difficulty';
  }

  @override
  String get rankProgress => 'Прогрес рангу';

  @override
  String rankLabel(int rank) {
    return 'Ранг $rank';
  }

  @override
  String get newGame => 'Нова гра';

  @override
  String get continueGame => 'Продовжити гру';

  @override
  String get weeklyProgress => 'Тижневий прогрес';

  @override
  String get rewardsTitle => 'Нагороди';

  @override
  String get rewardNoMistakesTitle => 'Завершіть виклик без помилок';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# серця',
      one: '# серце',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Виконайте три виклики поспіль';

  @override
  String get rewardUniqueTrophy => 'Унікальний трофей';

  @override
  String get rewardSevenDayTitle => 'Підтримуйте серію 7 днів';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# зірки',
      one: '# зірка',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Сьогоднішня головоломка';

  @override
  String get todayPuzzleDescription =>
      'Завершіть судоку, щоб отримати додаткову нагороду та продовжити серію.';

  @override
  String get continueAction => 'Продовжити';

  @override
  String get adMessage => 'Реклама: Знайди приховані об\'єкти! Грай зараз.';

  @override
  String get adPlay => 'Грати';

  @override
  String get undo => 'Скасувати';

  @override
  String get erase => 'Стерти';

  @override
  String get autoNotes => 'Автоматичні нотатки';

  @override
  String get statusOn => 'УВІМК';

  @override
  String get statusOff => 'ВИМК';

  @override
  String get notes => 'Нотатки';

  @override
  String get hint => 'Підказка';

  @override
  String get undoAdTitle => 'Перегляд реклами для скасування';

  @override
  String get undoAdDescription =>
      'Перегляньте коротку рекламу, щоб скасувати останній хід.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Реклама завершиться через $seconds с';
  }

  @override
  String get hintAdTitle => 'Перегляньте рекламу, щоб отримати підказку';

  @override
  String get hintAdDescription =>
      'Перегляньте коротку рекламу, щоб отримати підказку.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Реклама завершиться через $seconds с';
  }

  @override
  String get lifeAdTitle => 'Перегляньте рекламу, щоб відновити серце';

  @override
  String get lifeAdDescription =>
      'Перегляньте коротку рекламу, щоб відновити червоне серце й продовжити гру.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Реклама завершиться через $seconds с';
  }

  @override
  String get gameScreenTitle => 'Судоку';

  @override
  String combo_x(int count) {
    return 'Комбо ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Серія $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Бонус швидкості $time';
  }

  @override
  String comboX(int count) {
    return 'Комбо x$count';
  }

  @override
  String streakN(int count) {
    return 'Серія $count';
  }

  @override
  String speedBonus(String time) {
    return 'Бонус швидкості ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Немає активної гри. Поверніться на головний екран.';

  @override
  String get victoryTitle => 'Вітаємо!';

  @override
  String victoryMessage(String time) {
    return 'Головоломку розв\'язано за $time.';
  }

  @override
  String get backToHome => 'На головну';

  @override
  String get playAnother => 'Ще одну';

  @override
  String get outOfLivesTitle => 'Ви втратили всі серця';

  @override
  String get outOfLivesDescription =>
      'Відновіть одне червоне серце, щоб продовжити гру.';

  @override
  String get restoreLifeAction => 'Відновити 1 червоне серце';

  @override
  String get cancelAction => 'Скасувати';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get themeSectionTitle => 'Тема';

  @override
  String get themeWhite => 'Класична світла';

  @override
  String get themeCream => 'Кремова';

  @override
  String get themeGreen => 'М\'ятна';

  @override
  String get themeBlack => 'Темна';

  @override
  String get themePurple => 'Фіолетова темна';

  @override
  String get themeFontSize => 'Розмір шрифту';

  @override
  String get fontSizeExtraSmall => 'Дуже малий';

  @override
  String get fontSizeSmall => 'Малий';

  @override
  String get fontSizeMedium => 'Середній';

  @override
  String get fontSizeLarge => 'Великий';

  @override
  String get fontSizeExtraLarge => 'Дуже великий';

  @override
  String get languageSectionTitle => 'Мова';

  @override
  String get audioSectionTitle => 'Звуки та музика';

  @override
  String get soundsEffectsLabel => 'Звукові ефекти';

  @override
  String get vibrationLabel => 'Вібрація';

  @override
  String get comboBadgesLabel => 'Значки комбо';

  @override
  String get comboHapticsLabel => 'Вібрація значків';

  @override
  String get miscSectionTitle => 'Інше';

  @override
  String get howToPlayTitle => 'Як грати';

  @override
  String get howToPlayRowRule =>
      'У кожному рядку цифри від 1 до 9 без повторів';

  @override
  String get howToPlayColumnRule =>
      'У кожній колонці цифри від 1 до 9 без повторів';

  @override
  String get howToPlayBoxRule =>
      'У кожному квадраті 3×3 цифри від 1 до 9 без повторів';

  @override
  String get howToPlayFooter => 'Заповни всі клітинки — і переможи!';

  @override
  String get howToPlayAction => 'Зрозуміло';

  @override
  String get championshipLocalSection => 'Чемпіонат (локально)';

  @override
  String get hideCompletedNumbersLabel => 'Прибирати використані цифри';

  @override
  String get aboutApp => 'Про застосунок';

  @override
  String versionLabel(String version) {
    return 'Версія $version';
  }

  @override
  String get aboutLegalese => 'Нагреба UZOR Inc.';

  @override
  String get languageEnglish => 'англійська';

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
  String get languageTurkish => 'турецька';

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
  String get languageDutch => 'Нідерланди';

  @override
  String get languageSwedish => 'Свенська';

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
  String get languageMalay => 'Бахаса Мелаю';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'суахілі';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Slovenčina';

  @override
  String get export => 'Експорт';

  @override
  String get import => 'Імпорт';

  @override
  String get resetMyScore => 'Скинути мій рахунок';

  @override
  String get resetMyScoreConfirmation =>
      'Ви впевнені, що хочете скинути рахунок? Цю дію неможливо скасувати.';

  @override
  String get resetAction => 'Скинути';

  @override
  String get regenerateOpponents => 'Перегенерувати суперників';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get cancel => 'Скасувати';

  @override
  String get done => 'Готово';

  @override
  String get privacyPolicyTitle => 'Політика конфіденційності';

  @override
  String get privacyPolicyAccept => 'Приймаю';

  @override
  String get privacyPolicyPrompt => 'Ви приймаєте Політику конфіденційності?';

  @override
  String get privacyPolicyLearnMore => 'Детальніше →';

  @override
  String get privacyPolicyDecline => 'Відхиляю';

  @override
  String get privacyPolicyClose => 'Закрити';

  @override
  String get privacyPolicyLoadError =>
      'Не вдалося завантажити політику конфіденційності. Спробуйте ще раз.';

  @override
  String get failed => 'Помилка';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Місце #$current • +$delta до #$target';
  }

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsGamesSection => 'Ігри';

  @override
  String get statsGamesStarted => 'Розпочаті ігри';

  @override
  String get statsGamesWon => 'Виграні ігри';

  @override
  String get statsWinRate => 'Відсоток перемог';

  @override
  String get statsFlawless => 'Безпомилкові завершення';

  @override
  String get statsTimeSection => 'Час';

  @override
  String get statsBestTime => 'Найкращий час';

  @override
  String get statsAverageTime => 'Середній час';

  @override
  String get statsStreakSection => 'Серія';

  @override
  String get statsCurrentStreak => 'Поточна серія';

  @override
  String get statsBestStreak => 'Найкраща серія';

  @override
  String get difficultyNovice => 'Новачок';

  @override
  String get difficultyNoviceShort => 'Нов.';

  @override
  String get difficultyMedium => 'Середній';

  @override
  String get difficultyMediumShort => 'Сер.';

  @override
  String get difficultyHigh => 'Високий';

  @override
  String get difficultyHighShort => 'Вис.';

  @override
  String get difficultyExpert => 'Експерт';

  @override
  String get difficultyExpertShort => 'Експ.';

  @override
  String get difficultyMaster => 'Майстр';

  @override
  String get difficultyMasterShort => 'Майстр.';

  @override
  String get ach_title_supermind => 'Надрозум';

  @override
  String get ach_desc_supermind =>
      'Пройдіть будь-яку складність без помилок і підказок менш ніж за 2 хвилини 30 секунд';

  @override
  String get rateDialogTitle => 'Сподобалась гра? 💛';

  @override
  String get rateDialogSubtitle =>
      'Ваша оцінка допоможе Sudoku стати ще кращою!';

  @override
  String get rateDialogDismiss => 'Вийти';

  @override
  String get rateDialogConfirm => 'Так, класна!';
}
