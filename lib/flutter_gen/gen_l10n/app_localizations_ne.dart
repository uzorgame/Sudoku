// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'सुडोकू';

  @override
  String get navHome => 'गृहपृष्ठ';

  @override
  String get navDaily => 'चुनौती';

  @override
  String get navAchievements => 'उपलब्धिहरू';

  @override
  String get achievements_title => 'उपलब्धिहरू';

  @override
  String get ach_section_title => 'लक्ष्य र पुरस्कार';

  @override
  String get ach_title_wins_50 => '५० जित';

  @override
  String get ach_title_no_mistakes => 'फलामे इच्छा';

  @override
  String get ach_title_streak_3days => '३ दिनको श्रृंखला';

  @override
  String get ach_title_fast_solver => 'बिजुलीझैँ छिटो';

  @override
  String get ach_title_wins_100 => '१०० जित';

  @override
  String get ach_desc_wins_50 => 'क्लासिक मोडमा ५० पटक जित्नुहोस्';

  @override
  String get ach_desc_no_mistakes =>
      'संकेत र त्रुटी बिना लगातार ३ खेल पूरा गर्नुहोस्';

  @override
  String get ach_desc_streak_3days => '३ दिन लगातार दैनिक खेल्नुहोस्';

  @override
  String get ach_desc_fast_solver => '३ मिनेट भित्र एक सुडोकु हल गर्नुहोस्';

  @override
  String get ach_desc_wins_100 => 'क्लासिक मोडमा १०० पटक जित्नुहोस्';

  @override
  String get ach_status_finished => 'सम्पन्न';

  @override
  String ach_status_in_progress(int current) {
    return '$current खेल समाप्त';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'प्राप्त मिति: $date';
  }

  @override
  String get ach_locked => 'लक गरिएको';

  @override
  String get dailyStreak => 'दैनिक स्ट्राइक';

  @override
  String get selectDifficultyTitle => 'कठिनाई छान्नुहोस्';

  @override
  String get selectDifficultyDailyChallenge => 'दैनिक चुनौती';

  @override
  String get playAction => 'खेल्नुहोस्';

  @override
  String get championshipTitle => 'च्याम्पियनसिप';

  @override
  String championshipScore(int score) {
    return 'स्कोर $score';
  }

  @override
  String toNextPlace(int points) {
    return 'अर्को ठाउँमा: $points अंक';
  }

  @override
  String get youAreTop => 'तपाईं #1 हुनुहुन्छ';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'आफ्नो च्याम्पियनशिप रन बढाउन यो राउन्ड खेल्नुहोस्।';

  @override
  String get championshipRoundCompletedLabel => 'पूरा भयो';

  @override
  String totalScore(String score) {
    return 'कुल स्कोर: $score';
  }

  @override
  String get meLabel => 'म';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'स्थान $rank। $name। $points अंक';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'मेरो ठाउँ $rank। $points अंक';
  }

  @override
  String get pointsShort => 'अंक';

  @override
  String get championshipAutoScroll => 'मेरो स्थितिमा स्वत: स्क्रोल गर्नुहोस्';

  @override
  String get bestLabel => 'उत्तम';

  @override
  String get play => 'खेल्नुहोस्';

  @override
  String get battleTitle => 'युद्ध';

  @override
  String battleWinRate(int count) {
    return 'जित्यो $count%';
  }

  @override
  String get battleYouLabel => 'तपाईं';

  @override
  String get battleVictoryTitle => 'तपाईंले जित्नुभयो!';

  @override
  String get battleDefeatTitle => 'विपक्षी पहिलो स्थानमा रह्यो';

  @override
  String battleDefeatMessage(String name) {
    return '$name ले तपाइँको अगाडि पजल हल गर्नुभयो।';
  }

  @override
  String get battleSimpleDefeatTitle => 'तिमीले हारे';

  @override
  String get battleExitToMainMenu => 'मुख्य मेनु';

  @override
  String get playerFlagSettingTitle => 'खेलाडी झण्डा';

  @override
  String get selectPlayerFlag => 'आफ्नो झण्डा छान्नुहोस्';

  @override
  String get confirmFlagSelectionTitle => 'आफ्नो झण्डा पुष्टि गर्नुहोस्';

  @override
  String get confirmFlagSelectionMessage =>
      'के तपाइँ यो झण्डा छान्न निश्चित हुनुहुन्छ? तपाईं खेल सेटिङहरूमा पछि आफ्नो झण्डा परिवर्तन गर्न सक्नुहुन्छ।';

  @override
  String get confirmFlagSelectionConfirm => 'पुष्टि गर्नुहोस्';

  @override
  String get startAction => 'सुरु गर्नुहोस्';

  @override
  String levelHeading(int level, String difficulty) {
    return 'स्तर $level — $difficulty';
  }

  @override
  String get rankProgress => 'श्रेणी प्रगति';

  @override
  String rankLabel(int rank) {
    return 'श्रेणी $rank';
  }

  @override
  String get newGame => 'नयाँ खेल';

  @override
  String get continueGame => 'खेल जारी राख्नुहोस्';

  @override
  String get weeklyProgress => 'साप्ताहिक प्रगति';

  @override
  String get rewardsTitle => 'पुरस्कारहरू';

  @override
  String get rewardNoMistakesTitle => 'गल्ती बिना चुनौती समाप्त गर्नुहोस्';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# मुटुहरू',
      one: '# मुटु',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle =>
      'एक पङ्क्तिमा तीन चुनौतीहरू पूरा गर्नुहोस्';

  @override
  String get rewardUniqueTrophy => 'अद्वितीय ट्रफी';

  @override
  String get rewardSevenDayTitle => '7-दिनको स्ट्रीक राख्नुहोस्';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ताराहरू',
      one: '# तारा',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'आजको पजल';

  @override
  String get todayPuzzleDescription =>
      'अतिरिक्त इनाम कमाउन र आफ्नो स्ट्रीक जीवित राख्न sudoku समाप्त गर्नुहोस्।';

  @override
  String get continueAction => 'जारी राख्नुहोस्';

  @override
  String get adMessage =>
      'विज्ञापन: लुकेका वस्तुहरू फेला पार्नुहोस्! अहिले खेल्नुहोस्।';

  @override
  String get adPlay => 'खेल्नुहोस्';

  @override
  String get undo => 'पूर्ववत गर्नुहोस्';

  @override
  String get erase => 'मेटाउनुहोस्';

  @override
  String get autoNotes => 'स्वत: नोटहरू';

  @override
  String get statusOn => 'ON';

  @override
  String get statusOff => 'बन्द';

  @override
  String get notes => 'नोटहरू';

  @override
  String get hint => 'संकेत';

  @override
  String get undoAdTitle => 'पूर्ववत गर्न विज्ञापन हेर्नुहोस्';

  @override
  String get undoAdDescription =>
      'आफ्नो अन्तिम चाल अनडू गर्न यो छोटो विज्ञापन हेर्नुहोस्।';

  @override
  String undoAdCountdown(int seconds) {
    return 'विज्ञापन ${seconds}s मा समाप्त हुन्छ';
  }

  @override
  String get hintAdTitle => 'संकेत प्राप्त गर्न विज्ञापन हेर्नुहोस्';

  @override
  String get hintAdDescription => 'संकेत कमाउन यो छोटो विज्ञापन हेर्नुहोस्।';

  @override
  String hintAdCountdown(int seconds) {
    return 'विज्ञापन ${seconds}s मा समाप्त हुन्छ';
  }

  @override
  String get lifeAdTitle => 'हृदय पुनर्स्थापित गर्न विज्ञापन हेर्नुहोस्';

  @override
  String get lifeAdDescription =>
      'रातो मुटु पुनर्स्थापित गर्न र खेलिरहन यो छोटो विज्ञापन हेर्नुहोस्।';

  @override
  String lifeAdCountdown(int seconds) {
    return 'विज्ञापन ${seconds}s मा समाप्त हुन्छ';
  }

  @override
  String get gameScreenTitle => 'सुडोकु';

  @override
  String combo_x(int count) {
    return 'कम्बो ×$count';
  }

  @override
  String streak_n(int count) {
    return 'स्ट्रीक $count';
  }

  @override
  String speed_bonus(String time) {
    return 'स्पीड बोनस $time';
  }

  @override
  String comboX(int count) {
    return 'कम्बो x$count';
  }

  @override
  String streakN(int count) {
    return 'स्ट्रीक $count';
  }

  @override
  String speedBonus(String time) {
    return 'गति बोनस ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'कुनै सक्रिय खेल छैन। गृह स्क्रिनमा फर्कनुहोस्।';

  @override
  String get victoryTitle => 'बधाई छ!';

  @override
  String victoryMessage(String time) {
    return 'पजल $time मा हल भयो।';
  }

  @override
  String get backToHome => 'घर';

  @override
  String get playAnother => 'फेरि खेल्नुहोस्';

  @override
  String get outOfLivesTitle => 'तिमी मुटु बाहिर छौ';

  @override
  String get outOfLivesDescription =>
      'खेल्न जारी राख्न एउटा रातो हृदय पुनर्स्थापित गर्नुहोस्।';

  @override
  String get restoreLifeAction => '१ रातो मुटु पुनर्स्थापित गर्नुहोस्';

  @override
  String get cancelAction => 'रद्द गर्नुहोस्';

  @override
  String get settingsTitle => 'सेटिङहरू';

  @override
  String get themeSectionTitle => 'विषयवस्तु';

  @override
  String get themeWhite => 'क्लासिक लाइट';

  @override
  String get themeCream => 'क्रीम';

  @override
  String get themeGreen => 'पुदिना';

  @override
  String get themeBlack => 'अँध्यारो';

  @override
  String get themePurple => 'बैजनी गाढा';

  @override
  String get themeFontSize => 'फन्ट साइज';

  @override
  String get fontSizeExtraSmall => 'अतिरिक्त सानो';

  @override
  String get fontSizeSmall => 'सानो';

  @override
  String get fontSizeMedium => 'मध्यम';

  @override
  String get fontSizeLarge => 'ठूलो';

  @override
  String get fontSizeExtraLarge => 'अतिरिक्त ठूलो';

  @override
  String get languageSectionTitle => 'भाषा';

  @override
  String get audioSectionTitle => 'ध्वनि र संगीत';

  @override
  String get soundsEffectsLabel => 'ध्वनि प्रभावहरू';

  @override
  String get vibrationLabel => 'कम्पन';

  @override
  String get comboBadgesLabel => 'कम्बो ब्याजहरू';

  @override
  String get comboHapticsLabel => 'ब्याज ह्याप्टिक्स';

  @override
  String get miscSectionTitle => 'अन्य';

  @override
  String get howToPlayTitle => 'कसरी खेल्ने';

  @override
  String get howToPlayRowRule =>
      'प्रत्येक पङ्क्तिमा 1 देखि 9 सम्म अंकहरू दोहोर्याइएको छैन';

  @override
  String get howToPlayColumnRule =>
      'प्रत्येक स्तम्भमा 1 देखि 9 सम्मको अंकहरू दोहोर्याइएको छैन';

  @override
  String get howToPlayBoxRule =>
      'प्रत्येक 3 × 3 बक्समा 1 देखि 9 सम्म अंकहरू दोहोर्याइएको छैन';

  @override
  String get howToPlayFooter => 'प्रत्येक सेल भर्नुहोस् र तपाईं जित्नुहुन्छ!';

  @override
  String get howToPlayAction => 'बुझियो';

  @override
  String get championshipLocalSection => 'च्याम्पियनशिप (स्थानीय)';

  @override
  String get hideCompletedNumbersLabel => 'पूरा अंकहरू लुकाउनुहोस्';

  @override
  String get aboutApp => 'बारे';

  @override
  String versionLabel(String version) {
    return 'संस्करण $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc।';

  @override
  String get languageEnglish => 'अंग्रेजी';

  @override
  String get languageRussian => 'रुसकी';

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
  String get languageItalian => 'इटालियन';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languagePolish => 'पोल्स्की';

  @override
  String get languagePortuguese => 'पोर्चुगिज';

  @override
  String get languageIndonesian => 'बहासा इन्डोनेसिया';

  @override
  String get languageVietnamese => 'Việt भाषा';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'नेदरल्याण्ड्स';

  @override
  String get languageSwedish => 'स्वेन्स्का';

  @override
  String get languageRomanian => 'रोमाना';

  @override
  String get languageCzech => 'चेस्टिना';

  @override
  String get languageFinnish => 'सुओमी';

  @override
  String get languageKazakh => 'Қазақ tilі';

  @override
  String get languageBulgarian => 'बल्गार्स्की';

  @override
  String get languageMalay => 'बहासा मेलाउ';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'नेपाली';

  @override
  String get languageSwahili => 'किस्वाहिली';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'स्लोभेन्सिना';

  @override
  String get export => 'निर्यात गर्नुहोस्';

  @override
  String get import => 'आयात गर्नुहोस्';

  @override
  String get resetMyScore => 'मेरो स्कोर रिसेट गर्नुहोस्';

  @override
  String get resetMyScoreConfirmation =>
      'के तपाइँ निश्चित रूपमा स्कोर रिसेट गर्न चाहनुहुन्छ? यो कार्य अन्डू गर्न सकिँदैन।';

  @override
  String get resetAction => 'रिसेट गर्नुहोस्';

  @override
  String get regenerateOpponents => 'विपक्षीहरूलाई पुनर्जीवित गर्नुहोस्';

  @override
  String get confirm => 'पुष्टि गर्नुहोस्';

  @override
  String get cancel => 'रद्द गर्नुहोस्';

  @override
  String get done => 'सकियो';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get privacyPolicyAccept => 'म स्वीकार गर्छु';

  @override
  String get privacyPolicyPrompt =>
      'के तपाइँ गोपनीयता नीति स्वीकार गर्नुहुन्छ?';

  @override
  String get privacyPolicyLearnMore => 'थप जान्नुहोस् →';

  @override
  String get privacyPolicyDecline => 'म अस्वीकार गर्छु';

  @override
  String get privacyPolicyClose => 'बन्द गर्नुहोस्';

  @override
  String get privacyPolicyLoadError =>
      'गोपनीयता नीति लोड गर्न असफल भयो। कृपया पुन: प्रयास गर्नुहोस्।';

  @override
  String get failed => 'असफल';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'श्रेणी #$current • +$delta देखि #$target';
  }

  @override
  String get statsTitle => 'तथ्याङ्क';

  @override
  String get statsGamesSection => 'खेलहरू';

  @override
  String get statsGamesStarted => 'खेल सुरु भयो';

  @override
  String get statsGamesWon => 'खेल जित्यो';

  @override
  String get statsWinRate => 'जीत दर';

  @override
  String get statsFlawless => 'निर्दोष समाप्त';

  @override
  String get statsTimeSection => 'समय';

  @override
  String get statsBestTime => 'उत्तम समय';

  @override
  String get statsAverageTime => 'औसत समय';

  @override
  String get statsStreakSection => 'स्ट्रीक';

  @override
  String get statsCurrentStreak => 'वर्तमान स्ट्रीक';

  @override
  String get statsBestStreak => 'उत्कृष्ट स्ट्रीक';

  @override
  String get difficultyNovice => 'नौसिखिया';

  @override
  String get difficultyNoviceShort => 'नोभेम्बर';

  @override
  String get difficultyMedium => 'मध्यवर्ती';

  @override
  String get difficultyMediumShort => 'Int.';

  @override
  String get difficultyHigh => 'उन्नत';

  @override
  String get difficultyHighShort => 'Adv.';

  @override
  String get difficultyExpert => 'विज्ञ';

  @override
  String get difficultyExpertShort => 'समाप्त।';

  @override
  String get difficultyMaster => 'मास्टर';

  @override
  String get difficultyMasterShort => 'सुश्री';

  @override
  String get ach_title_supermind => 'सुपरमाइन्ड';

  @override
  String get ach_desc_supermind =>
      'कुनै पनि कठिनाइमा गल्ती वा संकेत बिना २ मिनेट ३० सेकेन्ड भित्र जित्नुहोस्';

  @override
  String get rateDialogTitle => 'के तपाईंलाई खेल मन पर्‍यो? 💛';

  @override
  String get rateDialogSubtitle =>
      'तपाईंको रेटिङले Sudoku अझ राम्रो बनाउन मद्दत गर्छ!';

  @override
  String get rateDialogDismiss => 'बाहिर निस्कनुहोस्';

  @override
  String get rateDialogConfirm => 'हो, शानदार छ!';
}
