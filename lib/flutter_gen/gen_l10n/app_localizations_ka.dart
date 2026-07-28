// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'სუდოკუ';

  @override
  String get navHome => 'მთავარი';

  @override
  String get navDaily => 'გამოწვევა';

  @override
  String get navAchievements => 'მიღწევები';

  @override
  String get achievements_title => 'მიღწევები';

  @override
  String get ach_section_title => 'მიზნები და ჯილდოები';

  @override
  String get ach_title_wins_50 => '50 გამარჯვება';

  @override
  String get ach_title_no_mistakes => 'რკინის ნება';

  @override
  String get ach_title_streak_3days => '3-დღიანი სერია';

  @override
  String get ach_title_fast_solver => 'ელვისებური სისწრაფე';

  @override
  String get ach_title_wins_100 => '100 გამარჯვება';

  @override
  String get ach_desc_wins_50 => 'მოიგე 50-ჯერ კლასიკურ რეჟიმში';

  @override
  String get ach_desc_no_mistakes =>
      'დაასრულეთ ზედიზედ 3 თამაში მინიშნებებისა და შეცდომების გარეშე';

  @override
  String get ach_desc_streak_3days => 'ითამაშე ყოველდღე ზედიზედ 3 დღე';

  @override
  String get ach_desc_fast_solver => 'ამოხსენი სუდოკუ 3 წუთზე ნაკლებ დროში';

  @override
  String get ach_desc_wins_100 => 'მოიგე 100-ჯერ კლასიკურ რეჟიმში';

  @override
  String get ach_status_finished => 'დასრულებულია';

  @override
  String ach_status_in_progress(int current) {
    return 'დასრულებული თამაშები: $current';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'მიღებულია: $date';
  }

  @override
  String get ach_locked => 'დაბლოკილია';

  @override
  String get dailyStreak => 'დღიური სერია';

  @override
  String get selectDifficultyTitle => 'აირჩიეთ სირთულე';

  @override
  String get selectDifficultyDailyChallenge => 'ყოველდღიური გამოწვევა';

  @override
  String get playAction => 'თამაში';

  @override
  String get championshipTitle => 'ჩემპიონატი';

  @override
  String championshipScore(int score) {
    return 'ქულები $score';
  }

  @override
  String toNextPlace(int points) {
    return 'შემდეგ ადგილზე გადასასვლელად: $points ქულა';
  }

  @override
  String get youAreTop => 'თქვენ ხართ #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'ითამაშეთ ეს რაუნდი, რომ გააძლიეროთ თქვენი ჩემპიონატის სერია.';

  @override
  String get championshipRoundCompletedLabel => 'დასრულებულია';

  @override
  String totalScore(String score) {
    return 'საერთო ქულები: $score';
  }

  @override
  String get meLabel => 'მე';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'ადგილი $rank. $name. $points ქულა';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'ჩემი ადგილი $rank. $points ქულა';
  }

  @override
  String get pointsShort => 'ქულ.';

  @override
  String get championshipAutoScroll => 'ავტომატურად გადახვევა ჩემს პოზიციაზე';

  @override
  String get bestLabel => 'საუკეთესო';

  @override
  String get play => 'თამაში';

  @override
  String get battleTitle => 'ბრძოლა';

  @override
  String battleWinRate(int count) {
    return 'მოგებები $count%';
  }

  @override
  String get battleYouLabel => 'შენ';

  @override
  String get battleVictoryTitle => 'შენ გაიმარჯვე!';

  @override
  String get battleDefeatTitle => 'მეტოქემ გაიმარჯვა';

  @override
  String battleDefeatMessage(String name) {
    return '$name-მა შენზე ადრე ამოხსნა თავსატეხი.';
  }

  @override
  String get battleSimpleDefeatTitle => 'თქვენ დამარცხდით';

  @override
  String get battleExitToMainMenu => 'მთავარ მენიუში დაბრუნება';

  @override
  String get playerFlagSettingTitle => 'მოთამაშის დროშა';

  @override
  String get selectPlayerFlag => 'აირჩიე შენი დროშა';

  @override
  String get confirmFlagSelectionTitle => 'დაადასტურე შენი დროშა';

  @override
  String get confirmFlagSelectionMessage =>
      'დარწმუნებული ხარ, რომ ამ დროშას ირჩევ? შეგიძლია მოგვიანებით შეცვალო დროშა თამაშის პარამეტრებში.';

  @override
  String get confirmFlagSelectionConfirm => 'დადასტურება';

  @override
  String get startAction => 'დაწყება';

  @override
  String levelHeading(int level, String difficulty) {
    return 'დონე $level — $difficulty';
  }

  @override
  String get rankProgress => 'რეიტინგის პროგრესი';

  @override
  String rankLabel(int rank) {
    return 'რეიტინგი $rank';
  }

  @override
  String get newGame => 'ახალი თამაში';

  @override
  String get continueGame => 'გაგრძელება';

  @override
  String get weeklyProgress => 'კვირეული პროგრესი';

  @override
  String get rewardsTitle => 'ჯილდოები';

  @override
  String get rewardNoMistakesTitle => 'დაასრულეთ გამოწვევა შეცდომების გარეშე';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# გულები',
      one: '# გული',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'დაასრულეთ სამი გამოწვევა ზედიზედ';

  @override
  String get rewardUniqueTrophy => 'უნიკალური თასი';

  @override
  String get rewardSevenDayTitle => 'შეინარჩუნეთ 7-დღიანი სერია';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ვარსკვლავები',
      one: '# ვარსკვლავი',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'დღევანდელი თავსატეხი';

  @override
  String get todayPuzzleDescription =>
      'დაასრულეთ სუდოკუ, რათა მიიღოთ დამატებითი ჯილდო და შეინარჩუნოთ სერია.';

  @override
  String get continueAction => 'გაგრძელება';

  @override
  String get adMessage =>
      'რეკლამა: იპოვეთ დამალული ობიექტები! ითამაშეთ ახლავე.';

  @override
  String get adPlay => 'თამაში';

  @override
  String get undo => 'გაუქმება';

  @override
  String get erase => 'წაშლა';

  @override
  String get autoNotes => 'ავტო შენიშვნები';

  @override
  String get statusOn => 'ჩართული';

  @override
  String get statusOff => 'გამორთული';

  @override
  String get notes => 'შენიშვნები';

  @override
  String get hint => 'მინიშნება';

  @override
  String get undoAdTitle => 'უყურეთ რეკლამას გასაუქმებლად';

  @override
  String get undoAdDescription =>
      'უყურეთ ამ მოკლე რეკლამას, რომ გააუქმოთ ბოლო სვლა.';

  @override
  String undoAdCountdown(int seconds) {
    return 'რეკლამა დასრულდება $seconds წმ-ში';
  }

  @override
  String get hintAdTitle => 'უყურეთ რეკლამას მინიშნების მისაღებად';

  @override
  String get hintAdDescription =>
      'უყურეთ ამ მოკლე რეკლამას, რათა მიიღოთ მინიშნება.';

  @override
  String hintAdCountdown(int seconds) {
    return 'რეკლამა დასრულდება $seconds წმ-ში';
  }

  @override
  String get lifeAdTitle => 'უყურეთ რეკლამას გულის აღსადგენად';

  @override
  String get lifeAdDescription =>
      'უყურეთ ამ მოკლე რეკლამას, რათა აღდგეს წითელი გული და გააგრძელოთ თამაში.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'რეკლამა დასრულდება $seconds წმ-ში';
  }

  @override
  String get gameScreenTitle => 'სუდოკუ';

  @override
  String combo_x(int count) {
    return 'კომბო ×$count';
  }

  @override
  String streak_n(int count) {
    return 'სერია $count';
  }

  @override
  String speed_bonus(String time) {
    return 'სისწრაფის ბონუსი $time';
  }

  @override
  String comboX(int count) {
    return 'კომბო x$count';
  }

  @override
  String streakN(int count) {
    return 'სერია $count';
  }

  @override
  String speedBonus(String time) {
    return 'სისწრაფის ბონუსი ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'აქტიური თამაში არ არის. დაბრუნდით მთავარ ეკრანზე.';

  @override
  String get victoryTitle => 'გილოცავთ!';

  @override
  String victoryMessage(String time) {
    return 'თავსატეხი ამოხსნილია $time-ში.';
  }

  @override
  String get backToHome => 'მთავარი';

  @override
  String get playAnother => 'კიდევ თამაში';

  @override
  String get outOfLivesTitle => 'გულები აღარ დარჩა';

  @override
  String get outOfLivesDescription =>
      'თამაშის გასაგრძელებლად აღადგინეთ ერთი წითელი გული.';

  @override
  String get restoreLifeAction => '1 წითელი გულის აღდგენა';

  @override
  String get cancelAction => 'გაუქმება';

  @override
  String get settingsTitle => 'პარამეტრები';

  @override
  String get themeSectionTitle => 'თემა';

  @override
  String get themeWhite => 'კლასიკური ღია';

  @override
  String get themeCream => 'კრემისფერი';

  @override
  String get themeGreen => 'მინტი';

  @override
  String get themeBlack => 'მუქი';

  @override
  String get themePurple => 'იისფერი მუქი';

  @override
  String get themeFontSize => 'ფონტის ზომა';

  @override
  String get fontSizeExtraSmall => 'ძალიან პატარა';

  @override
  String get fontSizeSmall => 'პატარა';

  @override
  String get fontSizeMedium => 'საშუალო';

  @override
  String get fontSizeLarge => 'დიდი';

  @override
  String get fontSizeExtraLarge => 'ძალიან დიდი';

  @override
  String get languageSectionTitle => 'ენა';

  @override
  String get audioSectionTitle => 'ხმა და მუსიკა';

  @override
  String get soundsEffectsLabel => 'ხმის ეფექტები';

  @override
  String get vibrationLabel => 'ვიბრაცია';

  @override
  String get comboBadgesLabel => 'კომბო ბეჯები';

  @override
  String get comboHapticsLabel => 'ბეჯების ჰაპტიკა';

  @override
  String get miscSectionTitle => 'სხვა';

  @override
  String get howToPlayTitle => 'როგორ ვითამაშოთ';

  @override
  String get howToPlayRowRule =>
      'ყოველ რიგში უნდა იყოს ციფრები 1-დან 9-მდე გამეორებების გარეშე';

  @override
  String get howToPlayColumnRule =>
      'ყოველ სვეტში უნდა იყოს ციფრები 1-დან 9-მდე გამეორებების გარეშე';

  @override
  String get howToPlayBoxRule =>
      'ყოველ 3×3 კვადრატში უნდა იყოს ციფრები 1-დან 9-მდე გამეორებების გარეშე';

  @override
  String get howToPlayFooter => 'შეავსე ყველა უჯრა და გაიმარჯვე!';

  @override
  String get howToPlayAction => 'გასაგებია';

  @override
  String get championshipLocalSection => 'ჩემპიონატი (ლოკალური)';

  @override
  String get hideCompletedNumbersLabel => 'დამალე დასრულებული ციფრები';

  @override
  String get aboutApp => 'აპლიკაციის შესახებ';

  @override
  String versionLabel(String version) {
    return 'ვერსია $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'ინგლისური';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'უკრაინული';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'ფრანგული';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'ესპანოლი';

  @override
  String get languageItalian => 'იტალიური';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'თურქჩე';

  @override
  String get languagePolish => 'პოლსკი';

  @override
  String get languagePortuguese => 'პორტუგალიელები';

  @override
  String get languageIndonesian => 'ბაჰასური ინდონეზია';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'Ṅทย';

  @override
  String get languageDutch => 'ნიდერლანდები';

  @override
  String get languageSwedish => 'სვენსკა';

  @override
  String get languageRomanian => 'რომანი';

  @override
  String get languageCzech => 'ჩესტინა';

  @override
  String get languageFinnish => 'სუომი';

  @override
  String get languageKazakh => 'Қазақ тілі';

  @override
  String get languageBulgarian => 'ბულგარული';

  @override
  String get languageMalay => 'ბაჰასა მელაიუ';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'კისუაჰილი';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'სლოვენია';

  @override
  String get export => 'ექსპორტი';

  @override
  String get import => 'იმპორტი';

  @override
  String get resetMyScore => 'ჩემი ქულების განულება';

  @override
  String get resetMyScoreConfirmation =>
      'დარწმუნებული ხართ, რომ გსურთ ქულების განულება? ეს ქმედება შეუქცევადია.';

  @override
  String get resetAction => 'განულება';

  @override
  String get regenerateOpponents => 'მოწინააღმდეგეების განახლება';

  @override
  String get confirm => 'დადასტურება';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get done => 'დასრულდა';

  @override
  String get privacyPolicyTitle => 'კონფიდენციალურობის პოლიტიკა';

  @override
  String get privacyPolicyAccept => 'ვეთანხმები';

  @override
  String get privacyPolicyPrompt => 'ეთანხმებით კონფიდენციალურობის პოლიტიკას?';

  @override
  String get privacyPolicyLearnMore => 'გაიგეთ მეტი →';

  @override
  String get privacyPolicyDecline => 'ვუარყოფ';

  @override
  String get privacyPolicyClose => 'დახურვა';

  @override
  String get privacyPolicyLoadError =>
      'კონფიდენციალურობის პოლიტიკის ჩატვირთვა ვერ მოხერხდა. გთხოვთ, სცადეთ ხელახლა.';

  @override
  String get failed => 'ვერ შესრულდა';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'რეიტინგი #$current • +$delta რათა მიაღწიოთ #$target';
  }

  @override
  String get statsTitle => 'სტატისტიკა';

  @override
  String get statsGamesSection => 'თამაშები';

  @override
  String get statsGamesStarted => 'დაწყებული თამაშები';

  @override
  String get statsGamesWon => 'მოგებული თამაშები';

  @override
  String get statsWinRate => 'მოგების მაჩვენებელი';

  @override
  String get statsFlawless => 'სრულყოფილი დასრულებები';

  @override
  String get statsTimeSection => 'დრო';

  @override
  String get statsBestTime => 'საუკეთესო დრო';

  @override
  String get statsAverageTime => 'საშუალო დრო';

  @override
  String get statsStreakSection => 'სერია';

  @override
  String get statsCurrentStreak => 'მიმდინარე სერია';

  @override
  String get statsBestStreak => 'საუკეთესო სერია';

  @override
  String get difficultyNovice => 'დამწყები';

  @override
  String get difficultyNoviceShort => 'დამ.';

  @override
  String get difficultyMedium => 'საშუალო';

  @override
  String get difficultyMediumShort => 'საშ.';

  @override
  String get difficultyHigh => 'გამოცდილი';

  @override
  String get difficultyHighShort => 'გამოც.';

  @override
  String get difficultyExpert => 'ექსპერტი';

  @override
  String get difficultyExpertShort => 'ექსპ.';

  @override
  String get difficultyMaster => 'ოსტატი';

  @override
  String get difficultyMasterShort => 'ოსტ.';

  @override
  String get ach_title_supermind => 'სუპერგონება';

  @override
  String get ach_desc_supermind =>
      'მოიგეთ ნებისმიერი სირთულე შეცდომებისა და მინიშნებების გარეშე 2 წუთსა და 30 წამზე ნაკლებში';

  @override
  String get rateDialogTitle => 'თამაში მოგწონს? 💛';

  @override
  String get rateDialogSubtitle =>
      'შენი შეფასება Sudoku-ს კიდევ უფრო გაუმჯობესებაში დაეხმარება!';

  @override
  String get rateDialogDismiss => 'გასვლა';

  @override
  String get rateDialogConfirm => 'დიახ, მშვენიერია!';
}
