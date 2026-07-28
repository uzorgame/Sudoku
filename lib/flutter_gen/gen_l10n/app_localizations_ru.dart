// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Судоку';

  @override
  String get navHome => 'Главная';

  @override
  String get navDaily => 'Испытание';

  @override
  String get navAchievements => 'Достижения';

  @override
  String get achievements_title => 'Достижения';

  @override
  String get ach_section_title => 'Цели и награды';

  @override
  String get ach_title_wins_50 => '50 побед';

  @override
  String get ach_title_no_mistakes => 'Железная воля';

  @override
  String get ach_title_streak_3days => 'Серия 3 дней';

  @override
  String get ach_title_fast_solver => 'Молниеносно';

  @override
  String get ach_title_wins_100 => '100 побед';

  @override
  String get ach_desc_wins_50 => 'Победите 50 раз в классическом режиме';

  @override
  String get ach_desc_no_mistakes =>
      'Пройдите 3 игры подряд без подсказок и без ошибок';

  @override
  String get ach_desc_streak_3days => 'Играйте ежедневно 3 дня подряд';

  @override
  String get ach_desc_fast_solver => 'Решите судоку менее чем за 3 минуты';

  @override
  String get ach_desc_wins_100 => 'Победите 100 раз в классическом режиме';

  @override
  String get ach_status_finished => 'Выполнено';

  @override
  String ach_status_in_progress(int current) {
    return '$current игр завершено';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Получено: $date';
  }

  @override
  String get ach_locked => 'Не получено';

  @override
  String get dailyStreak => 'Серия дней';

  @override
  String get selectDifficultyTitle => 'Выберите сложность';

  @override
  String get selectDifficultyDailyChallenge => 'Ежедневное испытание';

  @override
  String get playAction => 'Играть';

  @override
  String get championshipTitle => 'Чемпионат';

  @override
  String championshipScore(int score) {
    return 'Счёт $score';
  }

  @override
  String toNextPlace(int points) {
    return 'До следующего места: $points оч.';
  }

  @override
  String get youAreTop => 'Вы №1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Сыграйте в этом раунде, чтобы продвинуться в чемпионате.';

  @override
  String get championshipRoundCompletedLabel => 'Завершено';

  @override
  String totalScore(String score) {
    return 'Общий счёт: $score';
  }

  @override
  String get meLabel => 'Я';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Место $rank. $name. $points очков';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Моё место $rank. $points очков';
  }

  @override
  String get pointsShort => 'очк.';

  @override
  String get championshipAutoScroll => 'Автопрокрутка к моему месту';

  @override
  String get bestLabel => 'Лучший результат';

  @override
  String get play => 'Играть';

  @override
  String get battleTitle => 'Битва';

  @override
  String battleWinRate(int count) {
    return 'Побед $count%';
  }

  @override
  String get battleYouLabel => 'Я';

  @override
  String get battleVictoryTitle => 'Ты выиграл!';

  @override
  String get battleDefeatTitle => 'Соперник победил';

  @override
  String battleDefeatMessage(String name) {
    return '$name решил головоломку раньше тебя.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Вы проиграли';

  @override
  String get battleExitToMainMenu => 'Выйти в главное меню';

  @override
  String get playerFlagSettingTitle => 'Флаг игрока';

  @override
  String get selectPlayerFlag => 'Выбери свой флаг';

  @override
  String get confirmFlagSelectionTitle => 'Подтвердите флаг';

  @override
  String get confirmFlagSelectionMessage =>
      'Вы уверены, что хотите выбрать этот флаг? Флаг можно будет изменить в настройках игры.';

  @override
  String get confirmFlagSelectionConfirm => 'Принять';

  @override
  String get startAction => 'Начать';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Уровень $level — $difficulty';
  }

  @override
  String get rankProgress => 'Прогресс ранга';

  @override
  String rankLabel(int rank) {
    return 'Ранг $rank';
  }

  @override
  String get newGame => 'Новая игра';

  @override
  String get continueGame => 'Продолжить игру';

  @override
  String get weeklyProgress => 'Недельный прогресс';

  @override
  String get rewardsTitle => 'Награды';

  @override
  String get rewardNoMistakesTitle => 'Пройдите вызов без ошибок';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# сердца',
      one: '# сердце',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Выполните три вызова подряд';

  @override
  String get rewardUniqueTrophy => 'Уникальный трофей';

  @override
  String get rewardSevenDayTitle => 'Поддерживайте серию 7 дней';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# звезды',
      one: '# звезда',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Сегодняшняя головоломка';

  @override
  String get todayPuzzleDescription =>
      'Решите судоку, чтобы получить дополнительную награду и продолжить серию.';

  @override
  String get continueAction => 'Продолжить';

  @override
  String get adMessage => 'Реклама: Найди скрытые объекты! Играй сейчас.';

  @override
  String get adPlay => 'Играть';

  @override
  String get undo => 'Отменить';

  @override
  String get erase => 'Стереть';

  @override
  String get autoNotes => 'Автозаметки';

  @override
  String get statusOn => 'ВКЛ';

  @override
  String get statusOff => 'ВЫКЛ';

  @override
  String get notes => 'Заметки';

  @override
  String get hint => 'Подсказка';

  @override
  String get undoAdTitle => 'Смотреть рекламу для отмены';

  @override
  String get undoAdDescription =>
      'Посмотрите короткую рекламу, чтобы отменить последний ход.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Реклама завершится через $seconds с';
  }

  @override
  String get hintAdTitle => 'Смотреть рекламу для подсказки';

  @override
  String get hintAdDescription =>
      'Посмотрите короткую рекламу, чтобы получить подсказку.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Реклама завершится через $seconds с';
  }

  @override
  String get lifeAdTitle => 'Смотрите рекламу, чтобы восстановить сердце';

  @override
  String get lifeAdDescription =>
      'Посмотрите эту короткую рекламу, чтобы восстановить красное сердце и продолжить игру.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Реклама завершится через $seconds с';
  }

  @override
  String get gameScreenTitle => 'Судоку';

  @override
  String combo_x(int count) {
    return 'Комбо ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Серия $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Бонус скорости $time';
  }

  @override
  String comboX(int count) {
    return 'Комбо x$count';
  }

  @override
  String streakN(int count) {
    return 'Серия $count';
  }

  @override
  String speedBonus(String time) {
    return 'Бонус скорости ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Нет активной игры. Вернитесь на главный экран.';

  @override
  String get victoryTitle => 'Поздравляем!';

  @override
  String victoryMessage(String time) {
    return 'Головоломка решена за $time.';
  }

  @override
  String get backToHome => 'На главную';

  @override
  String get playAnother => 'Ещё одну';

  @override
  String get outOfLivesTitle => 'Сердца закончились';

  @override
  String get outOfLivesDescription =>
      'Восстановите одно красное сердце, чтобы продолжить игру.';

  @override
  String get restoreLifeAction => 'Восстановить 1 красное сердце';

  @override
  String get cancelAction => 'Отмена';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get themeSectionTitle => 'Тема';

  @override
  String get themeWhite => 'Классическая светлая';

  @override
  String get themeCream => 'Кремовая';

  @override
  String get themeGreen => 'Мятная';

  @override
  String get themeBlack => 'Тёмная';

  @override
  String get themePurple => 'Фиолетовая тёмная';

  @override
  String get themeFontSize => 'Размер шрифта';

  @override
  String get fontSizeExtraSmall => 'Очень маленький';

  @override
  String get fontSizeSmall => 'Маленький';

  @override
  String get fontSizeMedium => 'Средний';

  @override
  String get fontSizeLarge => 'Большой';

  @override
  String get fontSizeExtraLarge => 'Очень большой';

  @override
  String get languageSectionTitle => 'Язык';

  @override
  String get audioSectionTitle => 'Звук и музыка';

  @override
  String get soundsEffectsLabel => 'Звуковые эффекты';

  @override
  String get vibrationLabel => 'Вибрация';

  @override
  String get comboBadgesLabel => 'Бейджи комбо';

  @override
  String get comboHapticsLabel => 'Вибрация бейджей';

  @override
  String get miscSectionTitle => 'Другое';

  @override
  String get howToPlayTitle => 'Как играть';

  @override
  String get howToPlayRowRule => 'В каждой строке цифры от 1 до 9 без повторов';

  @override
  String get howToPlayColumnRule =>
      'В каждом столбце цифры от 1 до 9 без повторов';

  @override
  String get howToPlayBoxRule =>
      'В каждом квадрате 3×3 цифры от 1 до 9 без повторов';

  @override
  String get howToPlayFooter => 'Заполни все клетки — и победа!';

  @override
  String get howToPlayAction => 'ОК';

  @override
  String get championshipLocalSection => 'Чемпионат (локально)';

  @override
  String get hideCompletedNumbersLabel => 'Убирать использованные цифры';

  @override
  String get aboutApp => 'О приложении';

  @override
  String versionLabel(String version) {
    return 'Версия $version';
  }

  @override
  String get aboutLegalese => 'Нахреба УЗОР Инк.';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Украинская';

  @override
  String get languageGerman => 'немецкий';

  @override
  String get languageFrench => 'Франсэ';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'испанский';

  @override
  String get languageItalian => 'Итальяно';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Тюркче';

  @override
  String get languagePolish => 'Польский';

  @override
  String get languagePortuguese => 'Португальский';

  @override
  String get languageIndonesian => 'Бахаса Индонезия';

  @override
  String get languageVietnamese => 'Тианг Вьет';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Нидерланды';

  @override
  String get languageSwedish => 'Свенска';

  @override
  String get languageRomanian => 'Романа';

  @override
  String get languageCzech => 'Чештина';

  @override
  String get languageFinnish => 'Суоми';

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
  String get languageSwahili => 'Кисуахили';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Словенчина';

  @override
  String get export => 'Экспорт';

  @override
  String get import => 'Импорт';

  @override
  String get resetMyScore => 'Сбросить мой счёт';

  @override
  String get resetMyScoreConfirmation =>
      'Вы уверены, что хотите сбросить счёт? Это действие необратимо.';

  @override
  String get resetAction => 'Сбросить';

  @override
  String get regenerateOpponents => 'Перегенерировать соперников';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get cancel => 'Отмена';

  @override
  String get done => 'Готово';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get privacyPolicyAccept => 'Принимаю';

  @override
  String get privacyPolicyPrompt =>
      'Вы принимаете Политику конфиденциальности?';

  @override
  String get privacyPolicyLearnMore => 'Подробнее →';

  @override
  String get privacyPolicyDecline => 'Отклоняю';

  @override
  String get privacyPolicyClose => 'Закрыть';

  @override
  String get privacyPolicyLoadError =>
      'Не удалось загрузить политику конфиденциальности. Повторите попытку.';

  @override
  String get failed => 'Ошибка';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Место #$current • +$delta до #$target';
  }

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsGamesSection => 'Игры';

  @override
  String get statsGamesStarted => 'Начатые игры';

  @override
  String get statsGamesWon => 'Выигранные игры';

  @override
  String get statsWinRate => 'Процент побед';

  @override
  String get statsFlawless => 'Победы без ошибок';

  @override
  String get statsTimeSection => 'Время';

  @override
  String get statsBestTime => 'Лучшее время';

  @override
  String get statsAverageTime => 'Среднее время';

  @override
  String get statsStreakSection => 'Серия';

  @override
  String get statsCurrentStreak => 'Текущая серия';

  @override
  String get statsBestStreak => 'Лучшая серия';

  @override
  String get difficultyNovice => 'Любитель';

  @override
  String get difficultyNoviceShort => 'Люб.';

  @override
  String get difficultyMedium => 'Средний';

  @override
  String get difficultyMediumShort => 'Ср.';

  @override
  String get difficultyHigh => 'Сложный';

  @override
  String get difficultyHighShort => 'Слж.';

  @override
  String get difficultyExpert => 'Эксперт';

  @override
  String get difficultyExpertShort => 'Эксп.';

  @override
  String get difficultyMaster => 'Мастер';

  @override
  String get difficultyMasterShort => 'Маст.';

  @override
  String get ach_title_supermind => 'Сверхразум';

  @override
  String get ach_desc_supermind =>
      'Пройдите любую сложность без ошибок и подсказок менее чем за 2 минуты 30 секунд';

  @override
  String get rateDialogTitle => 'Нравится игра? 💛';

  @override
  String get rateDialogSubtitle =>
      'Твоя оценка поможет Sudoku стать ещё лучше!';

  @override
  String get rateDialogDismiss => 'Выйти';

  @override
  String get rateDialogConfirm => 'Да, классная!';
}
