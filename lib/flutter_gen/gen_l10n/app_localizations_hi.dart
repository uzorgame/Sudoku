// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'सुडोकू';

  @override
  String get navHome => 'होम';

  @override
  String get navDaily => 'चुनौती';

  @override
  String get navAchievements => 'उपलब्धियाँ';

  @override
  String get achievements_title => 'उपलब्धियाँ';

  @override
  String get ach_section_title => 'लक्ष्य और पुरस्कार';

  @override
  String get ach_title_wins_50 => '50 जीत';

  @override
  String get ach_title_no_mistakes => 'लोहे की इच्छा';

  @override
  String get ach_title_streak_3days => '3 दिन की श्रृंखला';

  @override
  String get ach_title_fast_solver => 'बिजली सी तेज़';

  @override
  String get ach_title_wins_100 => '100 जीत';

  @override
  String get ach_desc_wins_50 => 'क्लासिक मोड में 50 बार जीतें';

  @override
  String get ach_desc_no_mistakes =>
      'लगातार 3 खेल बिना संकेत और बिना गलती के पूरा करें';

  @override
  String get ach_desc_streak_3days => 'लगातार 3 दिनों तक रोज़ खेलें';

  @override
  String get ach_desc_fast_solver => '3 मिनट से कम समय में एक सुडोकू हल करें';

  @override
  String get ach_desc_wins_100 => 'क्लासिक मोड में 100 बार जीतें';

  @override
  String get ach_status_finished => 'पूरा हुआ';

  @override
  String ach_status_in_progress(int current) {
    return '$current खेल पूरे हुए';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'प्राप्ति तिथि: $date';
  }

  @override
  String get ach_locked => 'लॉक';

  @override
  String get dailyStreak => 'दैनिक श्रृंखला';

  @override
  String get selectDifficultyTitle => 'कठिनाई चुनें';

  @override
  String get selectDifficultyDailyChallenge => 'दैनिक चुनौती';

  @override
  String get playAction => 'खेलें';

  @override
  String get championshipTitle => 'चैम्पियनशिप';

  @override
  String championshipScore(int score) {
    return 'स्कोर $score';
  }

  @override
  String toNextPlace(int points) {
    return 'अगले स्थान तक: $points अंक';
  }

  @override
  String get youAreTop => 'आप नं. 1 हैं';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'इस राउंड को खेलें और अपने चैम्पियनशिप सफर को आगे बढ़ाएँ।';

  @override
  String get championshipRoundCompletedLabel => 'पूरा हुआ';

  @override
  String totalScore(String score) {
    return 'कुल स्कोर: $score';
  }

  @override
  String get meLabel => 'मैं';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'स्थान $rank. $name. $points अंक';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'मेरा स्थान $rank. $points अंक';
  }

  @override
  String get pointsShort => 'अंक';

  @override
  String get championshipAutoScroll => 'मेरी स्थिति तक स्वतः स्क्रॉल करें';

  @override
  String get bestLabel => 'श्रेष्ठ';

  @override
  String get play => 'खेलें';

  @override
  String get battleTitle => 'बैटल';

  @override
  String battleWinRate(int count) {
    return 'जीतें $count%';
  }

  @override
  String get battleYouLabel => 'आप';

  @override
  String get battleVictoryTitle => 'आप जीत गए!';

  @override
  String get battleDefeatTitle => 'प्रतिद्वंदी जीत गया';

  @override
  String battleDefeatMessage(String name) {
    return '$name ने आपसे पहले पहेली हल कर ली।';
  }

  @override
  String get battleSimpleDefeatTitle => 'आप हार गए';

  @override
  String get battleExitToMainMenu => 'मुख्य मेनू पर जाएं';

  @override
  String get playerFlagSettingTitle => 'खिलाड़ी का झंडा';

  @override
  String get selectPlayerFlag => 'अपना झंडा चुनें';

  @override
  String get confirmFlagSelectionTitle => 'अपने झंडे की पुष्टि करें';

  @override
  String get confirmFlagSelectionMessage =>
      'क्या आप सुनिश्चित हैं कि आप इस झंडे को चुनना चाहते हैं? आप बाद में खेल की सेटिंग्स में अपना झंडा बदल सकते हैं।';

  @override
  String get confirmFlagSelectionConfirm => 'पुष्टि करें';

  @override
  String get startAction => 'शुरू करें';

  @override
  String levelHeading(int level, String difficulty) {
    return 'स्तर $level — $difficulty';
  }

  @override
  String get rankProgress => 'रैंक प्रगति';

  @override
  String rankLabel(int rank) {
    return 'रैंक $rank';
  }

  @override
  String get newGame => 'नया खेल';

  @override
  String get continueGame => 'खेल जारी रखें';

  @override
  String get weeklyProgress => 'साप्ताहिक प्रगति';

  @override
  String get rewardsTitle => 'इनाम';

  @override
  String get rewardNoMistakesTitle => 'बिना गलती के चुनौती पूरी करें';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# दिल',
      one: '# दिल',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'लगातार तीन चुनौतियाँ पूरी करें';

  @override
  String get rewardUniqueTrophy => 'विशेष ट्रॉफी';

  @override
  String get rewardSevenDayTitle => '7-दिन की श्रृंखला बनाए रखें';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# सितारे',
      one: '# तारा',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'आज की पहेली';

  @override
  String get todayPuzzleDescription =>
      'अतिरिक्त इनाम पाने और श्रृंखला बनाए रखने के लिए सुडोकू पूरा करें।';

  @override
  String get continueAction => 'जारी रखें';

  @override
  String get adMessage => 'विज्ञापन: छिपी वस्तुएँ खोजें! अभी खेलें।';

  @override
  String get adPlay => 'खेलें';

  @override
  String get undo => 'पूर्ववत् करें';

  @override
  String get erase => 'मिटाएँ';

  @override
  String get autoNotes => 'स्वचालित नोट्स';

  @override
  String get statusOn => 'चालू';

  @override
  String get statusOff => 'बंद';

  @override
  String get notes => 'नोट्स';

  @override
  String get hint => 'संकेत';

  @override
  String get undoAdTitle => 'पूर्ववत करने के लिए विज्ञापन देखें';

  @override
  String get undoAdDescription =>
      'अपनी पिछली चाल पूर्ववत करने के लिए यह छोटा विज्ञापन देखें।';

  @override
  String undoAdCountdown(int seconds) {
    return 'विज्ञापन $seconds सेकंड में समाप्त होगा';
  }

  @override
  String get hintAdTitle => 'संकेत पाने के लिए विज्ञापन देखें';

  @override
  String get hintAdDescription =>
      'एक संकेत पाने के लिए यह छोटा विज्ञापन देखें।';

  @override
  String hintAdCountdown(int seconds) {
    return 'विज्ञापन $seconds सेकंड में समाप्त होगा';
  }

  @override
  String get lifeAdTitle => 'दिल बहाल करने के लिए विज्ञापन देखें';

  @override
  String get lifeAdDescription =>
      'यह छोटा विज्ञापन देखें ताकि लाल दिल बहाल हो और खेल जारी रखें।';

  @override
  String lifeAdCountdown(int seconds) {
    return 'विज्ञापन $seconds सेकंड में समाप्त होगा';
  }

  @override
  String get gameScreenTitle => 'सुडोकू';

  @override
  String combo_x(int count) {
    return 'कॉम्बो ×$count';
  }

  @override
  String streak_n(int count) {
    return 'स्ट्रिक $count';
  }

  @override
  String speed_bonus(String time) {
    return 'स्पीड बोनस $time';
  }

  @override
  String comboX(int count) {
    return 'कॉम्बो x$count';
  }

  @override
  String streakN(int count) {
    return 'स्ट्रिक $count';
  }

  @override
  String speedBonus(String time) {
    return 'स्पीड बोनस ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'कोई सक्रिय खेल नहीं। होम स्क्रीन पर लौटें।';

  @override
  String get victoryTitle => 'बधाई!';

  @override
  String victoryMessage(String time) {
    return '$time में पहेली हल हुई।';
  }

  @override
  String get backToHome => 'होम';

  @override
  String get playAnother => 'फिर से खेलें';

  @override
  String get outOfLivesTitle => 'दिल समाप्त';

  @override
  String get outOfLivesDescription =>
      'खेल जारी रखने के लिए एक लाल दिल पुनर्स्थापित करें।';

  @override
  String get restoreLifeAction => '1 लाल दिल पुनर्स्थापित करें';

  @override
  String get cancelAction => 'रद्द करें';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get themeSectionTitle => 'थीम';

  @override
  String get themeWhite => 'क्लासिक हल्की';

  @override
  String get themeCream => 'क्रीमी';

  @override
  String get themeGreen => 'मिंट';

  @override
  String get themeBlack => 'डार्क';

  @override
  String get themePurple => 'गहरा बैंगनी';

  @override
  String get themeFontSize => 'फ़ॉन्ट आकार';

  @override
  String get fontSizeExtraSmall => 'अतिरिक्त छोटा';

  @override
  String get fontSizeSmall => 'छोटा';

  @override
  String get fontSizeMedium => 'मध्यम';

  @override
  String get fontSizeLarge => 'बड़ा';

  @override
  String get fontSizeExtraLarge => 'अतिरिक्त बड़ा';

  @override
  String get languageSectionTitle => 'भाषा';

  @override
  String get audioSectionTitle => 'ध्वनि और संगीत';

  @override
  String get soundsEffectsLabel => 'ध्वनि प्रभाव';

  @override
  String get vibrationLabel => 'कंपन';

  @override
  String get comboBadgesLabel => 'कॉम्बो बैज';

  @override
  String get comboHapticsLabel => 'बैज हैप्टिक्स';

  @override
  String get miscSectionTitle => 'अन्य';

  @override
  String get howToPlayTitle => 'कैसे खेलें';

  @override
  String get howToPlayRowRule =>
      'हर पंक्ति में 1 से 9 तक अंक बिना दोहराव के होने चाहिए';

  @override
  String get howToPlayColumnRule =>
      'हर स्तंभ में 1 से 9 तक अंक बिना दोहराव के होने चाहिए';

  @override
  String get howToPlayBoxRule =>
      'हर 3×3 बॉक्स में 1 से 9 तक अंक बिना दोहराव के होने चाहिए';

  @override
  String get howToPlayFooter => 'सभी खाने भरें और जीत जाएँ!';

  @override
  String get howToPlayAction => 'ठीक है';

  @override
  String get championshipLocalSection => 'चैम्पियनशिप (स्थानीय)';

  @override
  String get hideCompletedNumbersLabel => 'प्रयुक्त अंकों को छुपाएँ';

  @override
  String get aboutApp => 'ऐप के बारे में';

  @override
  String versionLabel(String version) {
    return 'संस्करण $version';
  }

  @override
  String get aboutLegalese => 'नहरेबा उज़ोर इंक.';

  @override
  String get languageEnglish => 'अंग्रेज़ी';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'deutsch';

  @override
  String get languageFrench => 'फ़्रांसीसी';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'धन्यवाद';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languageJapanese => 'ठीक है';

  @override
  String get languageKorean => 'धन्यवाद';

  @override
  String get languageTurkish => 'तुर्कसे';

  @override
  String get languagePolish => 'पोल्स्की';

  @override
  String get languagePortuguese => 'पुर्तगाली';

  @override
  String get languageIndonesian => 'बहासा इंडोनेशिया';

  @override
  String get languageVietnamese => 'तियांग वियत';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'नीदरलैंड';

  @override
  String get languageSwedish => 'स्वेन्स्का';

  @override
  String get languageRomanian => 'रोमाना';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'सुओमी';

  @override
  String get languageKazakh => 'Қазақ тілі';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'बहासा मेलायु';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'धन्यवाद';

  @override
  String get languageSwahili => 'Kiswahili';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'स्लोवेनसिना';

  @override
  String get export => 'निर्यात';

  @override
  String get import => 'आयात';

  @override
  String get resetMyScore => 'मेरा स्कोर रीसेट करें';

  @override
  String get resetMyScoreConfirmation =>
      'क्या आप वाकई स्कोर रीसेट करना चाहते हैं? यह कार्रवाई अपरिवर्तनीय है।';

  @override
  String get resetAction => 'रीसेट करें';

  @override
  String get regenerateOpponents => 'प्रतिद्वंद्वी पुनः उत्पन्न करें';

  @override
  String get confirm => 'पुष्टि करें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get done => 'पूर्ण';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get privacyPolicyAccept => 'मैं सहमत हूँ';

  @override
  String get privacyPolicyPrompt =>
      'क्या आप गोपनीयता नीति को स्वीकार करते हैं?';

  @override
  String get privacyPolicyLearnMore => 'अधिक जानें →';

  @override
  String get privacyPolicyDecline => 'मैं अस्वीकार करता हूँ';

  @override
  String get privacyPolicyClose => 'बंद करें';

  @override
  String get privacyPolicyLoadError =>
      'गोपनीयता नीति लोड नहीं हो सकी। कृपया दोबारा प्रयास करें।';

  @override
  String get failed => 'असफल';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'रैंक #$current • +$delta से #$target';
  }

  @override
  String get statsTitle => 'आँकड़े';

  @override
  String get statsGamesSection => 'खेल';

  @override
  String get statsGamesStarted => 'शुरू किए गए खेल';

  @override
  String get statsGamesWon => 'जीते गए खेल';

  @override
  String get statsWinRate => 'जीत दर';

  @override
  String get statsFlawless => 'बिना गलती की जीतें';

  @override
  String get statsTimeSection => 'समय';

  @override
  String get statsBestTime => 'सर्वश्रेष्ठ समय';

  @override
  String get statsAverageTime => 'औसत समय';

  @override
  String get statsStreakSection => 'श्रृंखला';

  @override
  String get statsCurrentStreak => 'वर्तमान श्रृंखला';

  @override
  String get statsBestStreak => 'सर्वश्रेष्ठ श्रृंखला';

  @override
  String get difficultyNovice => 'नवागंतुक';

  @override
  String get difficultyNoviceShort => 'नवा.';

  @override
  String get difficultyMedium => 'मध्यम';

  @override
  String get difficultyMediumShort => 'मध्.';

  @override
  String get difficultyHigh => 'कठिन';

  @override
  String get difficultyHighShort => 'कठि.';

  @override
  String get difficultyExpert => 'विशेषज्ञ';

  @override
  String get difficultyExpertShort => 'विशे.';

  @override
  String get difficultyMaster => 'मास्टर';

  @override
  String get difficultyMasterShort => 'मास्.';

  @override
  String get ach_title_supermind => 'सुपरमाइंड';

  @override
  String get ach_desc_supermind =>
      'किसी भी कठिनाई पर बिना गलती और बिना संकेत के 2 मिनट 30 सेकंड से कम में जीतें';

  @override
  String get rateDialogTitle => 'क्या आपको खेल पसंद आया? 💛';

  @override
  String get rateDialogSubtitle =>
      'आपकी रेटिंग Sudoku को और बेहतर बनाने में मदद करेगी!';

  @override
  String get rateDialogDismiss => 'बाहर निकलें';

  @override
  String get rateDialogConfirm => 'हाँ, कमाल है!';
}
