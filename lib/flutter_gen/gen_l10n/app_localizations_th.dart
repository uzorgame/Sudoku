// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'ซูโดกุ';

  @override
  String get navHome => 'บ้าน';

  @override
  String get navDaily => 'ท้าทาย';

  @override
  String get navAchievements => 'ความสำเร็จ';

  @override
  String get achievements_title => 'ความสำเร็จ';

  @override
  String get ach_section_title => 'เป้าหมายและรางวัล';

  @override
  String get ach_title_wins_50 => 'ชนะ 50 ครั้ง';

  @override
  String get ach_title_no_mistakes => 'ใจเหล็ก';

  @override
  String get ach_title_streak_3days => 'ต่อเนื่อง 3 วัน';

  @override
  String get ach_title_fast_solver => 'เร็วสายฟ้า';

  @override
  String get ach_title_wins_100 => 'ชนะ 100 ครั้ง';

  @override
  String get ach_desc_wins_50 => 'ชนะ 50 ครั้งในโหมดคลาสสิก';

  @override
  String get ach_desc_no_mistakes =>
      'จบเกมให้ครบ 3 เกมติดโดยไม่มีคำใบ้และไม่พลาด';

  @override
  String get ach_desc_streak_3days => 'เล่นทุกวันต่อเนื่อง 3 วัน';

  @override
  String get ach_desc_fast_solver => 'แก้ซูโดกุให้เสร็จภายใน 3 นาที';

  @override
  String get ach_desc_wins_100 => 'ชนะ 100 ครั้งในโหมดคลาสสิก';

  @override
  String get ach_status_finished => 'เสร็จสิ้น';

  @override
  String ach_status_in_progress(int current) {
    return 'จบแล้ว $current เกม';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'ได้รับเมื่อ: $date';
  }

  @override
  String get ach_locked => 'ล็อก';

  @override
  String get dailyStreak => 'สตรีครายวัน';

  @override
  String get selectDifficultyTitle => 'เลือกความยากลำบาก';

  @override
  String get selectDifficultyDailyChallenge => 'ความท้าทายรายวัน';

  @override
  String get playAction => 'เล่น';

  @override
  String get championshipTitle => 'แชมป์';

  @override
  String championshipScore(int score) {
    return 'คะแนน $score';
  }

  @override
  String toNextPlace(int points) {
    return 'ไปยังสถานที่ถัดไป: $points แต้ม';
  }

  @override
  String get youAreTop => 'คุณคือ #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'เล่นรอบนี้เพื่อเพิ่มแชมป์ของคุณ';

  @override
  String get championshipRoundCompletedLabel => 'สมบูรณ์';

  @override
  String totalScore(String score) {
    return 'คะแนนรวม: $score';
  }

  @override
  String get meLabel => 'ฉัน';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'สถานที่ $rank $name. $points คะแนน';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'สถานที่ของฉัน $rank $points คะแนน';
  }

  @override
  String get pointsShort => 'คะแนน';

  @override
  String get championshipAutoScroll => 'เลื่อนอัตโนมัติไปยังตำแหน่งของฉัน';

  @override
  String get bestLabel => 'ดีที่สุด';

  @override
  String get play => 'เล่น';

  @override
  String get battleTitle => 'การต่อสู้';

  @override
  String battleWinRate(int count) {
    return 'ชนะ $count%';
  }

  @override
  String get battleYouLabel => 'คุณ';

  @override
  String get battleVictoryTitle => 'คุณชนะ!';

  @override
  String get battleDefeatTitle => 'ฝ่ายตรงข้ามจบก่อน';

  @override
  String battleDefeatMessage(String name) {
    return '$name ไขปริศนาก่อนคุณ';
  }

  @override
  String get battleSimpleDefeatTitle => 'คุณแพ้';

  @override
  String get battleExitToMainMenu => 'เมนูหลัก';

  @override
  String get playerFlagSettingTitle => 'ธงผู้เล่น';

  @override
  String get selectPlayerFlag => 'เลือกธงของคุณ';

  @override
  String get confirmFlagSelectionTitle => 'ยืนยันธงของคุณ';

  @override
  String get confirmFlagSelectionMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการเลือกธงนี้ คุณสามารถเปลี่ยนธงของคุณได้ในภายหลังในการตั้งค่าเกม';

  @override
  String get confirmFlagSelectionConfirm => 'ยืนยัน';

  @override
  String get startAction => 'เริ่ม';

  @override
  String levelHeading(int level, String difficulty) {
    return 'ระดับ $level — $difficulty';
  }

  @override
  String get rankProgress => 'ความก้าวหน้าของอันดับ';

  @override
  String rankLabel(int rank) {
    return 'อันดับ $rank';
  }

  @override
  String get newGame => 'เกมใหม่';

  @override
  String get continueGame => 'เล่นเกมต่อ';

  @override
  String get weeklyProgress => 'ความคืบหน้ารายสัปดาห์';

  @override
  String get rewardsTitle => 'รางวัล';

  @override
  String get rewardNoMistakesTitle => 'จบการท้าทายโดยไม่มีข้อผิดพลาด';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# หัวใจ',
      one: '# หัวใจ',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'พิชิตความท้าทายสามรายการติดต่อกัน';

  @override
  String get rewardUniqueTrophy => 'ถ้วยรางวัลที่ไม่ซ้ำใคร';

  @override
  String get rewardSevenDayTitle => 'รักษาแนว 7 วัน';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ดาว',
      one: '# ดาว',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'ปริศนาวันนี้';

  @override
  String get todayPuzzleDescription =>
      'จบซูโดกุเพื่อรับรางวัลพิเศษและรักษาสถิติของคุณเอาไว้';

  @override
  String get continueAction => 'ดำเนินการต่อ';

  @override
  String get adMessage => 'โฆษณา: ค้นหาวัตถุที่ซ่อนอยู่! เล่นเลย';

  @override
  String get adPlay => 'เล่น';

  @override
  String get undo => 'เลิกทำ';

  @override
  String get erase => 'ลบ';

  @override
  String get autoNotes => 'บันทึกอัตโนมัติ';

  @override
  String get statusOn => 'บน';

  @override
  String get statusOff => 'ปิด';

  @override
  String get notes => 'หมายเหตุ';

  @override
  String get hint => 'คำใบ้';

  @override
  String get undoAdTitle => 'ดูโฆษณาเพื่อเลิกทำ';

  @override
  String get undoAdDescription =>
      'ดูโฆษณาสั้นๆ นี้เพื่อเลิกทำการเคลื่อนไหวครั้งล่าสุดของคุณ';

  @override
  String undoAdCountdown(int seconds) {
    return 'โฆษณาสิ้นสุดใน ${seconds}s';
  }

  @override
  String get hintAdTitle => 'ดูโฆษณาเพื่อรับคำแนะนำ';

  @override
  String get hintAdDescription => 'ดูโฆษณาสั้นๆ นี้เพื่อรับคำแนะนำ';

  @override
  String hintAdCountdown(int seconds) {
    return 'โฆษณาสิ้นสุดใน ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'ดูโฆษณาเพื่อฟื้นคืนหัวใจ';

  @override
  String get lifeAdDescription =>
      'ดูโฆษณาสั้นๆ นี้เพื่อฟื้นคืนหัวใจสีแดงและเล่นต่อ';

  @override
  String lifeAdCountdown(int seconds) {
    return 'โฆษณาสิ้นสุดใน ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'ซูโดกุ';

  @override
  String combo_x(int count) {
    return 'คอมโบ ×$count';
  }

  @override
  String streak_n(int count) {
    return 'สตรีค $count';
  }

  @override
  String speed_bonus(String time) {
    return 'โบนัสความเร็ว $time';
  }

  @override
  String comboX(int count) {
    return 'คอมโบ x$count';
  }

  @override
  String streakN(int count) {
    return 'สตรีค $count';
  }

  @override
  String speedBonus(String time) {
    return 'โบนัสความเร็ว ($time)';
  }

  @override
  String get noActiveGameMessage => 'ไม่มีเกมที่ใช้งานอยู่ กลับไปที่หน้าจอหลัก';

  @override
  String get victoryTitle => 'ยินดีด้วย!';

  @override
  String victoryMessage(String time) {
    return 'ไขปริศนาได้ใน $time';
  }

  @override
  String get backToHome => 'บ้าน';

  @override
  String get playAnother => 'เล่นอีกครั้ง';

  @override
  String get outOfLivesTitle => 'คุณหมดใจแล้ว';

  @override
  String get outOfLivesDescription =>
      'เรียกคืนหัวใจสีแดงหนึ่งดวงเพื่อเล่นต่อไป';

  @override
  String get restoreLifeAction => 'ฟื้นฟูหัวใจสีแดง 1 อัน';

  @override
  String get cancelAction => 'ยกเลิก';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get themeSectionTitle => 'ธีม';

  @override
  String get themeWhite => 'แสงคลาสสิก';

  @override
  String get themeCream => 'ครีม';

  @override
  String get themeGreen => 'มิ้นต์';

  @override
  String get themeBlack => 'มืด';

  @override
  String get themePurple => 'สีม่วงเข้ม';

  @override
  String get themeFontSize => 'ขนาดตัวอักษร';

  @override
  String get fontSizeExtraSmall => 'เล็กพิเศษ';

  @override
  String get fontSizeSmall => 'เล็ก';

  @override
  String get fontSizeMedium => 'ปานกลาง';

  @override
  String get fontSizeLarge => 'ใหญ่';

  @override
  String get fontSizeExtraLarge => 'ใหญ่พิเศษ';

  @override
  String get languageSectionTitle => 'ภาษา';

  @override
  String get audioSectionTitle => 'เสียงและดนตรี';

  @override
  String get soundsEffectsLabel => 'เอฟเฟกต์เสียง';

  @override
  String get vibrationLabel => 'การสั่นสะเทือน';

  @override
  String get comboBadgesLabel => 'ป้ายคำสั่งผสม';

  @override
  String get comboHapticsLabel => 'ระบบสัมผัสของป้ายสถานะ';

  @override
  String get miscSectionTitle => 'อื่น';

  @override
  String get howToPlayTitle => 'วิธีการเล่น';

  @override
  String get howToPlayRowRule => 'แต่ละแถวมีตัวเลข 1 ถึง 9 โดยไม่มีเลขซ้ำ';

  @override
  String get howToPlayColumnRule =>
      'แต่ละคอลัมน์มีตัวเลข 1 ถึง 9 โดยไม่มีการซ้ำ';

  @override
  String get howToPlayBoxRule =>
      'แต่ละกล่องขนาด 3×3 มีตัวเลข 1 ถึง 9 โดยไม่มีเลขซ้ำ';

  @override
  String get howToPlayFooter => 'เติมทุกเซลล์แล้วคุณจะชนะ!';

  @override
  String get howToPlayAction => 'เข้าใจแล้ว';

  @override
  String get championshipLocalSection => 'แชมเปี้ยนชิพ (ท้องถิ่น)';

  @override
  String get hideCompletedNumbersLabel => 'ซ่อนตัวเลขที่เสร็จสมบูรณ์';

  @override
  String get aboutApp => 'เกี่ยวกับ';

  @override
  String versionLabel(String version) {
    return 'เวอร์ชัน $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'ภาษาอังกฤษ';

  @override
  String get languageRussian => 'รัสเซีย';

  @override
  String get languageUkrainian => 'Украйнська';

  @override
  String get languageGerman => 'เยอรมัน';

  @override
  String get languageFrench => 'ฝรั่งเศส';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქრთულวิดีโอ';

  @override
  String get languageSpanish => 'สเปน';

  @override
  String get languageItalian => 'อิตาเลียโน่';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => 'เกาหลี';

  @override
  String get languageTurkish => 'เติร์กเช่';

  @override
  String get languagePolish => 'โพลสกี้';

  @override
  String get languagePortuguese => 'ภาษาโปรตุเกส';

  @override
  String get languageIndonesian => 'บาฮาซาอินโดนีเซีย';

  @override
  String get languageVietnamese => 'เตียงเวียต';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'เนเธอร์แลนด์';

  @override
  String get languageSwedish => 'สเวนสกา';

  @override
  String get languageRomanian => 'โรมาเนีย';

  @override
  String get languageCzech => 'เชสตินา';

  @override
  String get languageFinnish => 'ซูโอมิ';

  @override
  String get languageKazakh => 'Қазақ тілі';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'บาฮาซามลายู';

  @override
  String get languageNepali => 'เนปาล';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'คิสวาฮิลี';

  @override
  String get languageTamil => 'தமிழͪ';

  @override
  String get languageSlovak => 'สโลเวนชินา';

  @override
  String get export => 'ส่งออก';

  @override
  String get import => 'นำเข้า';

  @override
  String get resetMyScore => 'รีเซ็ตคะแนนของฉัน';

  @override
  String get resetMyScoreConfirmation =>
      'คุณแน่ใจหรือไม่ว่าต้องการรีเซ็ตคะแนน การดำเนินการนี้ไม่สามารถยกเลิกได้';

  @override
  String get resetAction => 'รีเซ็ต';

  @override
  String get regenerateOpponents => 'สร้างฝ่ายตรงข้ามขึ้นมาใหม่';

  @override
  String get confirm => 'ยืนยัน';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get done => 'เสร็จแล้ว';

  @override
  String get privacyPolicyTitle => 'นโยบายความเป็นส่วนตัว';

  @override
  String get privacyPolicyAccept => 'ฉันยอมรับ';

  @override
  String get privacyPolicyPrompt => 'คุณยอมรับนโยบายความเป็นส่วนตัวหรือไม่?';

  @override
  String get privacyPolicyLearnMore => 'เรียนรู้เพิ่มเติม →';

  @override
  String get privacyPolicyDecline => 'ฉันปฏิเสธ';

  @override
  String get privacyPolicyClose => 'ปิด';

  @override
  String get privacyPolicyLoadError =>
      'โหลดนโยบายความเป็นส่วนตัวไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get failed => 'ล้มเหลว';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'อันดับ #$current • +$delta ถึง #$target';
  }

  @override
  String get statsTitle => 'สถิติ';

  @override
  String get statsGamesSection => 'เกมส์';

  @override
  String get statsGamesStarted => 'เกมส์เริ่มแล้ว';

  @override
  String get statsGamesWon => 'เกมส์ชนะ';

  @override
  String get statsWinRate => 'อัตราการชนะ';

  @override
  String get statsFlawless => 'เสร็จสิ้นไร้ที่ติ';

  @override
  String get statsTimeSection => 'เวลา';

  @override
  String get statsBestTime => 'เวลาที่ดีที่สุด';

  @override
  String get statsAverageTime => 'เวลาเฉลี่ย';

  @override
  String get statsStreakSection => 'ริ้ว';

  @override
  String get statsCurrentStreak => 'แนวปัจจุบัน';

  @override
  String get statsBestStreak => 'แนวที่ดีที่สุด';

  @override
  String get difficultyNovice => 'มือใหม่';

  @override
  String get difficultyNoviceShort => 'ใหม่';

  @override
  String get difficultyMedium => 'ปานกลาง';

  @override
  String get difficultyMediumShort => 'กลาง';

  @override
  String get difficultyHigh => 'ยาก';

  @override
  String get difficultyHighShort => 'ยาก';

  @override
  String get difficultyExpert => 'ผู้เชี่ยวชาญ';

  @override
  String get difficultyExpertShort => 'เชี่ยว';

  @override
  String get difficultyMaster => 'ปรมาจารย์';

  @override
  String get difficultyMasterShort => 'ปรม.';

  @override
  String get ach_title_supermind => 'สุดยอดมันสมอง';

  @override
  String get ach_desc_supermind =>
      'ชนะทุกระดับความยากโดยไม่ใช้คำใบ้และไม่พลาดภายใน 2 นาที 30 วินาที';

  @override
  String get rateDialogTitle => 'ชอบเกมนี้ไหม? 💛';

  @override
  String get rateDialogSubtitle =>
      'การให้คะแนนของคุณจะช่วยให้ Sudoku ดีขึ้นกว่าเดิม!';

  @override
  String get rateDialogDismiss => 'ออก';

  @override
  String get rateDialogConfirm => 'ใช่ เยี่ยมมาก!';
}
