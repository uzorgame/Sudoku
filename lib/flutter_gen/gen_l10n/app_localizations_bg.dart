// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Судоку';

  @override
  String get navHome => 'Начало';

  @override
  String get navDaily => 'Предизвикателство';

  @override
  String get navAchievements => 'Постижения';

  @override
  String get achievements_title => 'Постижения';

  @override
  String get ach_section_title => 'Цели и награди';

  @override
  String get ach_title_wins_50 => '50 победи';

  @override
  String get ach_title_no_mistakes => 'Железна воля';

  @override
  String get ach_title_streak_3days => 'Серия от 3 дни';

  @override
  String get ach_title_fast_solver => 'Светкавично бърз';

  @override
  String get ach_title_wins_100 => '100 победи';

  @override
  String get ach_desc_wins_50 => 'Спечели 50 пъти в класически режим';

  @override
  String get ach_desc_no_mistakes =>
      'Завършете 3 последователни игри без подсказки и без грешки';

  @override
  String get ach_desc_streak_3days => 'Играй всеки ден 3 поредни дни';

  @override
  String get ach_desc_fast_solver => 'Реши судоку за под 3 минути';

  @override
  String get ach_desc_wins_100 => 'Спечели 100 пъти в класически режим';

  @override
  String get ach_status_finished => 'Завършено';

  @override
  String ach_status_in_progress(int current) {
    return 'Завършени игри: $current';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Получено на: $date';
  }

  @override
  String get ach_locked => 'Заключено';

  @override
  String get dailyStreak => 'Ежедневна поредица';

  @override
  String get selectDifficultyTitle => 'Изберете трудност';

  @override
  String get selectDifficultyDailyChallenge => 'Ежедневно предизвикателство';

  @override
  String get playAction => 'Играйте';

  @override
  String get championshipTitle => 'първенство';

  @override
  String championshipScore(int score) {
    return 'Резултат $score';
  }

  @override
  String toNextPlace(int points) {
    return 'До следващото място: $points точки';
  }

  @override
  String get youAreTop => 'Вие сте №1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Играйте този рунд, за да увеличите своя шампионат.';

  @override
  String get championshipRoundCompletedLabel => 'Завършено';

  @override
  String totalScore(String score) {
    return 'Общ резултат: $score';
  }

  @override
  String get meLabel => 'Аз';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Място $rank. $name. $points точки';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Моето място $rank. $points точки';
  }

  @override
  String get pointsShort => 'точки';

  @override
  String get championshipAutoScroll =>
      'Автоматично превъртане до моята позиция';

  @override
  String get bestLabel => 'Най-доброто';

  @override
  String get play => 'Играйте';

  @override
  String get battleTitle => 'битка';

  @override
  String battleWinRate(int count) {
    return 'Печели $count%';
  }

  @override
  String get battleYouLabel => 'Вие';

  @override
  String get battleVictoryTitle => 'Вие спечелихте!';

  @override
  String get battleDefeatTitle => 'Противникът завърши първи';

  @override
  String battleDefeatMessage(String name) {
    return '$name реши пъзела преди вас.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Ти загуби';

  @override
  String get battleExitToMainMenu => 'Главно меню';

  @override
  String get playerFlagSettingTitle => 'Флаг на играча';

  @override
  String get selectPlayerFlag => 'Изберете вашето знаме';

  @override
  String get confirmFlagSelectionTitle => 'Потвърдете флага си';

  @override
  String get confirmFlagSelectionMessage =>
      'Сигурни ли сте, че искате да изберете този флаг? Можете да промените флага си по-късно в настройките на играта.';

  @override
  String get confirmFlagSelectionConfirm => 'Потвърдете';

  @override
  String get startAction => 'Започнете';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Ниво $level — $difficulty';
  }

  @override
  String get rankProgress => 'Напредък в ранга';

  @override
  String rankLabel(int rank) {
    return 'Ранг $rank';
  }

  @override
  String get newGame => 'Нова игра';

  @override
  String get continueGame => 'Продължете играта';

  @override
  String get weeklyProgress => 'Седмичен напредък';

  @override
  String get rewardsTitle => 'Награди';

  @override
  String get rewardNoMistakesTitle =>
      'Завършете предизвикателството без грешки';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# сърца',
      one: '# сърце',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle =>
      'Изпълнете три последователни предизвикателства';

  @override
  String get rewardUniqueTrophy => 'Уникален трофей';

  @override
  String get rewardSevenDayTitle => 'Поддържайте 7-дневна серия';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# звезди',
      one: '# звезда',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Днешният пъзел';

  @override
  String get todayPuzzleDescription =>
      'Завършете судокуто, за да спечелите допълнителна награда и да запазите поредицата си жива.';

  @override
  String get continueAction => 'Продължи';

  @override
  String get adMessage => 'Реклама: Намерете скрити предмети! Играйте сега.';

  @override
  String get adPlay => 'Играйте';

  @override
  String get undo => 'Отмяна';

  @override
  String get erase => 'Изтриване';

  @override
  String get autoNotes => 'Автоматични бележки';

  @override
  String get statusOn => 'ВКЛ';

  @override
  String get statusOff => 'ИЗКЛ';

  @override
  String get notes => 'Бележки';

  @override
  String get hint => 'Подсказка';

  @override
  String get undoAdTitle => 'Гледайте реклама за отмяна';

  @override
  String get undoAdDescription =>
      'Гледайте тази кратка реклама, за да отмените последния си ход.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Рекламата приключва след ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Гледайте реклама, за да получите подсказка';

  @override
  String get hintAdDescription =>
      'Гледайте тази кратка реклама, за да спечелите подсказка.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Рекламата приключва след ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Гледайте реклама, за да възстановите сърце';

  @override
  String get lifeAdDescription =>
      'Гледайте тази кратка реклама, за да възстановите червено сърце и да продължите да играете.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Рекламата приключва след ${seconds}s';
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
    return 'Бонус за скорост $time';
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
    return 'Бонус за скорост ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Няма активна игра. Върнете се към началния екран.';

  @override
  String get victoryTitle => 'честито!';

  @override
  String victoryMessage(String time) {
    return 'Пъзелът е решен в $time.';
  }

  @override
  String get backToHome => 'Начало';

  @override
  String get playAnother => 'Играйте отново';

  @override
  String get outOfLivesTitle => 'Нямате сърца';

  @override
  String get outOfLivesDescription =>
      'Възстановете едно червено сърце, за да продължите да играете.';

  @override
  String get restoreLifeAction => 'Възстановете 1 червено сърце';

  @override
  String get cancelAction => 'Отказ';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get themeSectionTitle => 'Тема';

  @override
  String get themeWhite => 'Класическа светлина';

  @override
  String get themeCream => 'крем';

  @override
  String get themeGreen => 'Мента';

  @override
  String get themeBlack => 'Тъмно';

  @override
  String get themePurple => 'Лилаво Тъмно';

  @override
  String get themeFontSize => 'Размер на шрифта';

  @override
  String get fontSizeExtraSmall => 'Изключително малък';

  @override
  String get fontSizeSmall => 'малък';

  @override
  String get fontSizeMedium => 'Среден';

  @override
  String get fontSizeLarge => 'Голям';

  @override
  String get fontSizeExtraLarge => 'Изключително голям';

  @override
  String get languageSectionTitle => 'език';

  @override
  String get audioSectionTitle => 'Звук и музика';

  @override
  String get soundsEffectsLabel => 'Звукови ефекти';

  @override
  String get vibrationLabel => 'Вибрация';

  @override
  String get comboBadgesLabel => 'Комбинирани значки';

  @override
  String get comboHapticsLabel => 'Бадж хаптика';

  @override
  String get miscSectionTitle => 'други';

  @override
  String get howToPlayTitle => 'Как се играе';

  @override
  String get howToPlayRowRule => 'Всеки ред има цифри от 1 до 9 без повторения';

  @override
  String get howToPlayColumnRule =>
      'Всяка колона има цифри от 1 до 9 без повторения';

  @override
  String get howToPlayBoxRule =>
      'Всяка кутия 3×3 има цифри от 1 до 9 без повторения';

  @override
  String get howToPlayFooter => 'Попълнете всяка клетка и печелите!';

  @override
  String get howToPlayAction => 'разбрах';

  @override
  String get championshipLocalSection => 'Шампионат (местен)';

  @override
  String get hideCompletedNumbersLabel => 'Скриване на завършените цифри';

  @override
  String get aboutApp => 'За';

  @override
  String versionLabel(String version) {
    return 'Версия $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'английски';

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
  String get languageItalian => 'Италиано';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'турски';

  @override
  String get languagePolish => 'Полски';

  @override
  String get languagePortuguese => 'португалски';

  @override
  String get languageIndonesian => 'Bahasa Indonesia';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Холандия';

  @override
  String get languageSwedish => 'Свенска';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageCzech => 'Чещина';

  @override
  String get languageFinnish => 'Суоми';

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
  String get languageSwahili => 'кисуахили';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Словенчина';

  @override
  String get export => 'Експортиране';

  @override
  String get import => 'Импортиране';

  @override
  String get resetMyScore => 'Нулирай резултата ми';

  @override
  String get resetMyScoreConfirmation =>
      'Сигурни ли сте, че искате да нулирате резултата? Това действие не може да бъде отменено.';

  @override
  String get resetAction => 'Нулиране';

  @override
  String get regenerateOpponents => 'Регенерирайте опонентите';

  @override
  String get confirm => 'Потвърдете';

  @override
  String get cancel => 'Отказ';

  @override
  String get done => 'Готово';

  @override
  String get privacyPolicyTitle => 'Политика за поверителност';

  @override
  String get privacyPolicyAccept => 'приемам';

  @override
  String get privacyPolicyPrompt => 'Приемате ли Политиката за поверителност?';

  @override
  String get privacyPolicyLearnMore => 'Научете повече →';

  @override
  String get privacyPolicyDecline => 'отказвам';

  @override
  String get privacyPolicyClose => 'затвори';

  @override
  String get privacyPolicyLoadError =>
      'Неуспешно зареждане на политиката за поверителност. Моля, опитайте отново.';

  @override
  String get failed => 'Неуспешно';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Ранг #$current • +$delta до #$target';
  }

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsGamesSection => 'игри';

  @override
  String get statsGamesStarted => 'Игрите започнаха';

  @override
  String get statsGamesWon => 'Спечелени игри';

  @override
  String get statsWinRate => 'Степен на печалба';

  @override
  String get statsFlawless => 'Безупречни покрития';

  @override
  String get statsTimeSection => 'време';

  @override
  String get statsBestTime => 'Най-доброто време';

  @override
  String get statsAverageTime => 'Средно време';

  @override
  String get statsStreakSection => 'Ивица';

  @override
  String get statsCurrentStreak => 'Текуща серия';

  @override
  String get statsBestStreak => 'Най-добра серия';

  @override
  String get difficultyNovice => 'Новак';

  @override
  String get difficultyNoviceShort => 'ноем.';

  @override
  String get difficultyMedium => 'Междинен';

  @override
  String get difficultyMediumShort => 'Вътр.';

  @override
  String get difficultyHigh => 'Разширено';

  @override
  String get difficultyHighShort => 'адв.';

  @override
  String get difficultyExpert => 'експерт';

  @override
  String get difficultyExpertShort => 'Експ.';

  @override
  String get difficultyMaster => 'майстор';

  @override
  String get difficultyMasterShort => 'Майс.';

  @override
  String get ach_title_supermind => 'Суперум';

  @override
  String get ach_desc_supermind =>
      'Спечелете на която и да е трудност без грешки или подсказки за под 2 минути и 30 секунди';

  @override
  String get rateDialogTitle => 'Хареса ли ти играта? 💛';

  @override
  String get rateDialogSubtitle =>
      'Твоята оценка ще помогне Sudoku да стане още по-добра!';

  @override
  String get rateDialogDismiss => 'Изход';

  @override
  String get rateDialogConfirm => 'Да, страхотна е!';
}
