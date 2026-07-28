// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Trang chủ';

  @override
  String get navDaily => 'Thử thách';

  @override
  String get navAchievements => 'Thành tựu';

  @override
  String get achievements_title => 'Thành tựu';

  @override
  String get ach_section_title => 'Mục tiêu và Phần thưởng';

  @override
  String get ach_title_wins_50 => '50 Chiến thắng';

  @override
  String get ach_title_no_mistakes => 'Ý chí thép';

  @override
  String get ach_title_streak_3days => 'Chuỗi 3 Ngày';

  @override
  String get ach_title_fast_solver => 'Nhanh như chớp';

  @override
  String get ach_title_wins_100 => '100 Chiến thắng';

  @override
  String get ach_desc_wins_50 => 'Thắng 50 lần ở chế độ Cổ điển';

  @override
  String get ach_desc_no_mistakes =>
      'Hoàn thành 3 ván liên tiếp không gợi ý và không mắc lỗi';

  @override
  String get ach_desc_streak_3days => 'Chơi mỗi ngày liên tiếp trong 3 ngày';

  @override
  String get ach_desc_fast_solver => 'Giải xong một ván sudoku dưới 3 phút';

  @override
  String get ach_desc_wins_100 => 'Thắng 100 lần ở chế độ Cổ điển';

  @override
  String get ach_status_finished => 'Đã hoàn thành';

  @override
  String ach_status_in_progress(int current) {
    return 'Đã hoàn thành $current ván';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Đạt được: $date';
  }

  @override
  String get ach_locked => 'Đã khóa';

  @override
  String get dailyStreak => 'Chuỗi hàng ngày';

  @override
  String get selectDifficultyTitle => 'Chọn độ khó';

  @override
  String get selectDifficultyDailyChallenge => 'Thử thách hàng ngày';

  @override
  String get playAction => 'Chơi';

  @override
  String get championshipTitle => 'Giải vô địch';

  @override
  String championshipScore(int score) {
    return 'Điểm $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Đến địa điểm tiếp theo: $points điểm';
  }

  @override
  String get youAreTop => 'Bạn là số 1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Chơi vòng này để tăng cường khả năng vô địch của bạn.';

  @override
  String get championshipRoundCompletedLabel => 'Hoàn thành';

  @override
  String totalScore(String score) {
    return 'Tổng số điểm: $score';
  }

  @override
  String get meLabel => 'Tôi';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Địa điểm $rank. $name. $points điểm';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Chỗ của tôi $rank. $points điểm';
  }

  @override
  String get pointsShort => 'điểm';

  @override
  String get championshipAutoScroll => 'Tự động cuộn đến vị trí của tôi';

  @override
  String get bestLabel => 'Tốt nhất';

  @override
  String get play => 'Chơi';

  @override
  String get battleTitle => 'Trận đánh';

  @override
  String battleWinRate(int count) {
    return 'Thắng $count%';
  }

  @override
  String get battleYouLabel => 'Bạn';

  @override
  String get battleVictoryTitle => 'Bạn đã thắng!';

  @override
  String get battleDefeatTitle => 'Đối thủ về đích đầu tiên';

  @override
  String battleDefeatMessage(String name) {
    return '$name đã giải được câu đố trước bạn.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Bạn đã thua';

  @override
  String get battleExitToMainMenu => 'Thực đơn chính';

  @override
  String get playerFlagSettingTitle => 'Cờ người chơi';

  @override
  String get selectPlayerFlag => 'Chọn cờ của bạn';

  @override
  String get confirmFlagSelectionTitle => 'Xác nhận lá cờ của bạn';

  @override
  String get confirmFlagSelectionMessage =>
      'Bạn có chắc chắn muốn chọn lá cờ này không? Bạn có thể thay đổi cờ của mình sau trong cài đặt trò chơi.';

  @override
  String get confirmFlagSelectionConfirm => 'Xác nhận';

  @override
  String get startAction => 'Bắt đầu';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Cấp độ $level — $difficulty';
  }

  @override
  String get rankProgress => 'Tiến độ xếp hạng';

  @override
  String rankLabel(int rank) {
    return 'Xếp hạng $rank';
  }

  @override
  String get newGame => 'Trò chơi mới';

  @override
  String get continueGame => 'Tiếp tục trò chơi';

  @override
  String get weeklyProgress => 'Tiến độ hàng tuần';

  @override
  String get rewardsTitle => 'Phần thưởng';

  @override
  String get rewardNoMistakesTitle =>
      'Hoàn thành thử thách mà không phạm sai lầm';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# trái tim',
      one: '# trái tim',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Hoàn thành ba thử thách liên tiếp';

  @override
  String get rewardUniqueTrophy => 'Chiếc cúp độc nhất';

  @override
  String get rewardSevenDayTitle => 'Duy trì chuỗi 7 ngày';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ngôi sao',
      one: '# ngôi sao',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Câu đố hôm nay';

  @override
  String get todayPuzzleDescription =>
      'Hoàn thành sudoku để kiếm thêm phần thưởng và duy trì chuỗi trận của bạn.';

  @override
  String get continueAction => 'Tiếp tục';

  @override
  String get adMessage => 'Quảng cáo: Tìm đồ vật bị giấu! Chơi ngay bây giờ.';

  @override
  String get adPlay => 'Chơi';

  @override
  String get undo => 'Hoàn tác';

  @override
  String get erase => 'Xóa';

  @override
  String get autoNotes => 'Ghi chú tự động';

  @override
  String get statusOn => 'TRÊN';

  @override
  String get statusOff => 'TẮT';

  @override
  String get notes => 'Ghi chú';

  @override
  String get hint => 'Gợi ý';

  @override
  String get undoAdTitle => 'Xem quảng cáo để hoàn tác';

  @override
  String get undoAdDescription =>
      'Xem quảng cáo ngắn này để hoàn tác bước đi cuối cùng của bạn.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Quảng cáo kết thúc sau $seconds giây';
  }

  @override
  String get hintAdTitle => 'Xem quảng cáo để có gợi ý';

  @override
  String get hintAdDescription => 'Xem quảng cáo ngắn này để nhận được gợi ý.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Quảng cáo kết thúc sau $seconds giây';
  }

  @override
  String get lifeAdTitle => 'Xem quảng cáo để phục hồi trái tim';

  @override
  String get lifeAdDescription =>
      'Hãy xem quảng cáo ngắn này để khôi phục trái tim màu đỏ và tiếp tục chơi.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Quảng cáo kết thúc sau $seconds giây';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Kết hợp ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Vệt $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Phần thưởng tốc độ $time';
  }

  @override
  String comboX(int count) {
    return 'Kết hợp x$count';
  }

  @override
  String streakN(int count) {
    return 'Vệt $count';
  }

  @override
  String speedBonus(String time) {
    return 'Phần thưởng tốc độ ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Không có trò chơi hoạt động. Quay trở lại màn hình chính.';

  @override
  String get victoryTitle => 'Chúc mừng!';

  @override
  String victoryMessage(String time) {
    return 'Câu đố được giải trong $time.';
  }

  @override
  String get backToHome => 'Trang chủ';

  @override
  String get playAnother => 'Chơi lại';

  @override
  String get outOfLivesTitle => 'Bạn hết hồn rồi';

  @override
  String get outOfLivesDescription =>
      'Khôi phục một trái tim màu đỏ để tiếp tục chơi.';

  @override
  String get restoreLifeAction => 'Khôi phục 1 trái tim đỏ';

  @override
  String get cancelAction => 'Hủy bỏ';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get themeSectionTitle => 'chủ đề';

  @override
  String get themeWhite => 'Ánh sáng cổ điển';

  @override
  String get themeCream => 'Kem';

  @override
  String get themeGreen => 'bạc hà';

  @override
  String get themeBlack => 'Tối tăm';

  @override
  String get themePurple => 'Tím đậm';

  @override
  String get themeFontSize => 'Cỡ chữ';

  @override
  String get fontSizeExtraSmall => 'Cực nhỏ';

  @override
  String get fontSizeSmall => 'Bé nhỏ';

  @override
  String get fontSizeMedium => 'Trung bình';

  @override
  String get fontSizeLarge => 'Lớn';

  @override
  String get fontSizeExtraLarge => 'Cực lớn';

  @override
  String get languageSectionTitle => 'Ngôn ngữ';

  @override
  String get audioSectionTitle => 'Âm thanh và âm nhạc';

  @override
  String get soundsEffectsLabel => 'Hiệu ứng âm thanh';

  @override
  String get vibrationLabel => 'Rung';

  @override
  String get comboBadgesLabel => 'Huy hiệu kết hợp';

  @override
  String get comboHapticsLabel => 'Xúc giác huy hiệu';

  @override
  String get miscSectionTitle => 'Khác';

  @override
  String get howToPlayTitle => 'Cách chơi';

  @override
  String get howToPlayRowRule =>
      'Mỗi hàng có các chữ số từ 1 đến 9 không lặp lại';

  @override
  String get howToPlayColumnRule =>
      'Mỗi cột có các chữ số từ 1 đến 9 không lặp lại';

  @override
  String get howToPlayBoxRule =>
      'Mỗi ô 3×3 có các chữ số từ 1 đến 9 không lặp lại';

  @override
  String get howToPlayFooter => 'Điền vào mọi ô và bạn giành chiến thắng!';

  @override
  String get howToPlayAction => 'Hiểu rồi';

  @override
  String get championshipLocalSection => 'Giải vô địch (địa phương)';

  @override
  String get hideCompletedNumbersLabel => 'Ẩn các chữ số đã hoàn thành';

  @override
  String get aboutApp => 'Về';

  @override
  String versionLabel(String version) {
    return 'Phiên bản $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'Tiếng Anh';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'tiếng Đức';

  @override
  String get languageFrench => 'người Pháp';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'tiếng Tây Ban Nha';

  @override
  String get languageItalian => 'tiếng Ý';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languagePolish => 'Tiếng Ba Lan';

  @override
  String get languagePortuguese => 'người Bồ Đào Nha';

  @override
  String get languageIndonesian => 'Tiếng Bahasa Indonesia';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Hà Lan';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'Româna';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'Қазақ тілі';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'Tiếng Bahasa Melayu';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'tiếng Kiswahili';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Tiếng Slovenia';

  @override
  String get export => 'Xuất khẩu';

  @override
  String get import => 'Nhập khẩu';

  @override
  String get resetMyScore => 'Đặt lại điểm của tôi';

  @override
  String get resetMyScoreConfirmation =>
      'Bạn có chắc chắn muốn đặt lại điểm số không? Không thể hoàn tác hành động này.';

  @override
  String get resetAction => 'Cài lại';

  @override
  String get regenerateOpponents => 'Tái sinh đối thủ';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get cancel => 'Hủy bỏ';

  @override
  String get done => 'Xong';

  @override
  String get privacyPolicyTitle => 'Chính sách bảo mật';

  @override
  String get privacyPolicyAccept => 'tôi chấp nhận';

  @override
  String get privacyPolicyPrompt =>
      'Bạn có chấp nhận Chính sách quyền riêng tư không?';

  @override
  String get privacyPolicyLearnMore => 'Tìm hiểu thêm →';

  @override
  String get privacyPolicyDecline => 'tôi từ chối';

  @override
  String get privacyPolicyClose => 'Đóng';

  @override
  String get privacyPolicyLoadError =>
      'Không tải được chính sách quyền riêng tư. Vui lòng thử lại.';

  @override
  String get failed => 'Thất bại';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Xếp hạng #$current • +$delta đến #$target';
  }

  @override
  String get statsTitle => 'Thống kê';

  @override
  String get statsGamesSection => 'Trò chơi';

  @override
  String get statsGamesStarted => 'Trò chơi đã bắt đầu';

  @override
  String get statsGamesWon => 'Trò chơi đã thắng';

  @override
  String get statsWinRate => 'Tỷ lệ thắng';

  @override
  String get statsFlawless => 'Kết thúc hoàn hảo';

  @override
  String get statsTimeSection => 'Thời gian';

  @override
  String get statsBestTime => 'Thời gian tốt nhất';

  @override
  String get statsAverageTime => 'Thời gian trung bình';

  @override
  String get statsStreakSection => 'Vệt';

  @override
  String get statsCurrentStreak => 'Chuỗi hiện tại';

  @override
  String get statsBestStreak => 'Chuỗi tốt nhất';

  @override
  String get difficultyNovice => 'Người mới';

  @override
  String get difficultyNoviceShort => 'Mới';

  @override
  String get difficultyMedium => 'Trung bình';

  @override
  String get difficultyMediumShort => 'TB';

  @override
  String get difficultyHigh => 'Khó';

  @override
  String get difficultyHighShort => 'Khó';

  @override
  String get difficultyExpert => 'Chuyên gia';

  @override
  String get difficultyExpertShort => 'CG';

  @override
  String get difficultyMaster => 'Bậc thầy';

  @override
  String get difficultyMasterShort => 'BT';

  @override
  String get ach_title_supermind => 'Siêu trí tuệ';

  @override
  String get ach_desc_supermind =>
      'Thắng ở mọi độ khó mà không mắc lỗi hay dùng gợi ý dưới 2 phút 30 giây';

  @override
  String get rateDialogTitle => 'Bạn thích trò chơi chứ? 💛';

  @override
  String get rateDialogSubtitle =>
      'Đánh giá của bạn sẽ giúp Sudoku trở nên tốt hơn nữa!';

  @override
  String get rateDialogDismiss => 'Thoát';

  @override
  String get rateDialogConfirm => 'Vâng, tuyệt vời!';
}
