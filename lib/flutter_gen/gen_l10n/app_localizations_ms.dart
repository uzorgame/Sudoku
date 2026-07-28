// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Laman Utama';

  @override
  String get navDaily => 'Cabaran';

  @override
  String get navAchievements => 'Pencapaian';

  @override
  String get achievements_title => 'Pencapaian';

  @override
  String get ach_section_title => 'Matlamat dan Ganjaran';

  @override
  String get ach_title_wins_50 => '50 Kemenangan';

  @override
  String get ach_title_no_mistakes => 'Tekad Besi';

  @override
  String get ach_title_streak_3days => 'Rentetan 3 Hari';

  @override
  String get ach_title_fast_solver => 'Sepantas Kilat';

  @override
  String get ach_title_wins_100 => '100 Kemenangan';

  @override
  String get ach_desc_wins_50 => 'Menang 50 kali dalam mod Klasik';

  @override
  String get ach_desc_no_mistakes =>
      'Selesaikan 3 permainan berturut-turut tanpa petunjuk dan tanpa kesilapan';

  @override
  String get ach_desc_streak_3days =>
      'Bermain setiap hari selama 3 hari berturut-turut';

  @override
  String get ach_desc_fast_solver =>
      'Selesaikan satu sudoku dalam masa kurang 3 minit';

  @override
  String get ach_desc_wins_100 => 'Menang 100 kali dalam mod Klasik';

  @override
  String get ach_status_finished => 'Selesai';

  @override
  String ach_status_in_progress(int current) {
    return '$current permainan selesai';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Diperoleh pada: $date';
  }

  @override
  String get ach_locked => 'Terkunci';

  @override
  String get dailyStreak => 'Coretan harian';

  @override
  String get selectDifficultyTitle => 'Pilih kesukaran';

  @override
  String get selectDifficultyDailyChallenge => 'Cabaran Harian';

  @override
  String get playAction => 'Bermain';

  @override
  String get championshipTitle => 'Kejohanan';

  @override
  String championshipScore(int score) {
    return 'Skor $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Ke tempat seterusnya: $points pts';
  }

  @override
  String get youAreTop => 'Anda #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Mainkan pusingan ini untuk meningkatkan kejohanan anda.';

  @override
  String get championshipRoundCompletedLabel => 'Selesai';

  @override
  String totalScore(String score) {
    return 'Skor Jumlah: $score';
  }

  @override
  String get meLabel => 'Saya';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Letakkan $rank. $name. $points mata';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Tempat saya $rank. $points mata';
  }

  @override
  String get pointsShort => 'pts';

  @override
  String get championshipAutoScroll => 'Skrol automatik ke kedudukan saya';

  @override
  String get bestLabel => 'Terbaik';

  @override
  String get play => 'Bermain';

  @override
  String get battleTitle => 'Pertempuran';

  @override
  String battleWinRate(int count) {
    return 'Menang $count%';
  }

  @override
  String get battleYouLabel => 'Anda';

  @override
  String get battleVictoryTitle => 'Anda menang!';

  @override
  String get battleDefeatTitle => 'Lawan selesai terlebih dahulu';

  @override
  String battleDefeatMessage(String name) {
    return '$name menyelesaikan teka -teki sebelum anda.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Anda hilang';

  @override
  String get battleExitToMainMenu => 'Menu utama';

  @override
  String get playerFlagSettingTitle => 'Bendera pemain';

  @override
  String get selectPlayerFlag => 'Pilih bendera anda';

  @override
  String get confirmFlagSelectionTitle => 'Sahkan bendera anda';

  @override
  String get confirmFlagSelectionMessage =>
      'Adakah anda pasti mahu memilih bendera ini? Anda boleh menukar bendera anda kemudian dalam tetapan permainan.';

  @override
  String get confirmFlagSelectionConfirm => 'Mengesahkan';

  @override
  String get startAction => 'Mula';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Tahap $level - $difficulty';
  }

  @override
  String get rankProgress => 'Kemajuan pangkat';

  @override
  String rankLabel(int rank) {
    return 'Pangkat $rank';
  }

  @override
  String get newGame => 'Permainan baru';

  @override
  String get continueGame => 'Teruskan permainan';

  @override
  String get weeklyProgress => 'Kemajuan mingguan';

  @override
  String get rewardsTitle => 'Ganjaran';

  @override
  String get rewardNoMistakesTitle => 'Menyelesaikan cabaran tanpa kesilapan';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# hati',
      one: '# hati',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Selesaikan tiga cabaran berturut -turut';

  @override
  String get rewardUniqueTrophy => 'Trofi unik';

  @override
  String get rewardSevenDayTitle => 'Mengekalkan coretan 7 hari';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# bintang',
      one: '# bintang',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Teka -teki hari ini';

  @override
  String get todayPuzzleDescription =>
      'Selesaikan Sudoku untuk mendapatkan ganjaran tambahan dan simpan coretan anda hidup.';

  @override
  String get continueAction => 'Teruskan';

  @override
  String get adMessage => 'AD: Cari objek tersembunyi! Main sekarang.';

  @override
  String get adPlay => 'Bermain';

  @override
  String get undo => 'Dibatalkan';

  @override
  String get erase => 'Padam';

  @override
  String get autoNotes => 'Nota automatik';

  @override
  String get statusOn => 'Pada';

  @override
  String get statusOff => 'Mati';

  @override
  String get notes => 'Nota';

  @override
  String get hint => 'Petunjuk';

  @override
  String get undoAdTitle => 'Menonton iklan untuk membatalkan';

  @override
  String get undoAdDescription =>
      'Tonton iklan pendek ini untuk membatalkan langkah terakhir anda.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Iklan berakhir di ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Menonton iklan untuk mendapatkan petunjuk';

  @override
  String get hintAdDescription =>
      'Tonton iklan pendek ini untuk mendapatkan petunjuk.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Iklan berakhir di ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Tonton iklan untuk memulihkan hati';

  @override
  String get lifeAdDescription =>
      'Tonton iklan pendek ini untuk memulihkan hati merah dan terus bermain.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Iklan berakhir di ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combo × $count';
  }

  @override
  String streak_n(int count) {
    return 'Coretan $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bonus Kelajuan $time';
  }

  @override
  String comboX(int count) {
    return 'Combo x$count';
  }

  @override
  String streakN(int count) {
    return 'Coretan $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonus Kelajuan ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Tiada permainan aktif. Kembali ke skrin utama.';

  @override
  String get victoryTitle => 'Tahniah!';

  @override
  String victoryMessage(String time) {
    return 'Teka -teki diselesaikan dalam $time.';
  }

  @override
  String get backToHome => 'Rumah';

  @override
  String get playAnother => 'Main lagi';

  @override
  String get outOfLivesTitle => 'Anda keluar dari hati';

  @override
  String get outOfLivesDescription =>
      'Pulihkan satu hati merah untuk terus bermain.';

  @override
  String get restoreLifeAction => 'Pulihkan 1 Hati Merah';

  @override
  String get cancelAction => 'Batalkan';

  @override
  String get settingsTitle => 'Tetapan';

  @override
  String get themeSectionTitle => 'Tema';

  @override
  String get themeWhite => 'Cahaya klasik';

  @override
  String get themeCream => 'Krim';

  @override
  String get themeGreen => 'Pudina';

  @override
  String get themeBlack => 'Gelap';

  @override
  String get themePurple => 'Ungu gelap';

  @override
  String get themeFontSize => 'Saiz fon';

  @override
  String get fontSizeExtraSmall => 'Tambahan kecil';

  @override
  String get fontSizeSmall => 'Kecil';

  @override
  String get fontSizeMedium => 'Medium';

  @override
  String get fontSizeLarge => 'Besar';

  @override
  String get fontSizeExtraLarge => 'Lebih besar';

  @override
  String get languageSectionTitle => 'Bahasa';

  @override
  String get audioSectionTitle => 'Bunyi & Muzik';

  @override
  String get soundsEffectsLabel => 'Kesan bunyi';

  @override
  String get vibrationLabel => 'Getaran';

  @override
  String get comboBadgesLabel => 'Lencana kombo';

  @override
  String get comboHapticsLabel => 'Haptics lencana';

  @override
  String get miscSectionTitle => 'Yang lain';

  @override
  String get howToPlayTitle => 'Cara bermain';

  @override
  String get howToPlayRowRule =>
      'Setiap baris mempunyai digit 1 hingga 9 tanpa ulangan';

  @override
  String get howToPlayColumnRule =>
      'Setiap lajur mempunyai digit 1 hingga 9 tanpa ulangan';

  @override
  String get howToPlayBoxRule =>
      'Setiap kotak 3 × 3 mempunyai digit 1 hingga 9 tanpa ulangan';

  @override
  String get howToPlayFooter => 'Isi setiap sel dan anda menang!';

  @override
  String get howToPlayAction => 'Mendapatnya';

  @override
  String get championshipLocalSection => 'Kejohanan (Tempatan)';

  @override
  String get hideCompletedNumbersLabel => 'Menyembunyikan digit yang lengkap';

  @override
  String get aboutApp => 'Mengenai';

  @override
  String versionLabel(String version) {
    return 'Versi $version';
  }

  @override
  String get aboutLegalese => 'UZOR';

  @override
  String get languageEnglish => 'Bahasa Inggeris';

  @override
  String get languageRussian => 'Р й';

  @override
  String get languageUkrainian => 'Ураїнаса';

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
  String get languageKazakh => 'Қазақ th';

  @override
  String get languageBulgarian => 'Ъ ъ гси';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'Kiswahili';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Slovenčina';

  @override
  String get export => 'Eksport';

  @override
  String get import => 'Import';

  @override
  String get resetMyScore => 'Tetapkan semula skor saya';

  @override
  String get resetMyScoreConfirmation =>
      'Adakah anda pasti mahu menetapkan semula skor? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get resetAction => 'Tetapkan semula';

  @override
  String get regenerateOpponents => 'Menjana semula lawan';

  @override
  String get confirm => 'Mengesahkan';

  @override
  String get cancel => 'Batalkan';

  @override
  String get done => 'Selesai';

  @override
  String get privacyPolicyTitle => 'Dasar Privasi';

  @override
  String get privacyPolicyAccept => 'Saya terima';

  @override
  String get privacyPolicyPrompt => 'Adakah anda menerima Dasar Privasi?';

  @override
  String get privacyPolicyLearnMore => 'Ketahui lebih lanjut →';

  @override
  String get privacyPolicyDecline => 'Saya menolak';

  @override
  String get privacyPolicyClose => 'Tutup';

  @override
  String get privacyPolicyLoadError =>
      'Gagal memuatkan dasar privasi. Sila cuba lagi.';

  @override
  String get failed => 'Gagal';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Pangkat #$current • +$delta hingga #$target';
  }

  @override
  String get statsTitle => 'Statistik';

  @override
  String get statsGamesSection => 'Permainan';

  @override
  String get statsGamesStarted => 'Permainan bermula';

  @override
  String get statsGamesWon => 'Permainan menang';

  @override
  String get statsWinRate => 'Kadar menang';

  @override
  String get statsFlawless => 'Kemasan sempurna';

  @override
  String get statsTimeSection => 'Masa';

  @override
  String get statsBestTime => 'Masa terbaik';

  @override
  String get statsAverageTime => 'Masa purata';

  @override
  String get statsStreakSection => 'Coretan';

  @override
  String get statsCurrentStreak => 'Coretan semasa';

  @override
  String get statsBestStreak => 'Coretan terbaik';

  @override
  String get difficultyNovice => 'Novice';

  @override
  String get difficultyNoviceShort => 'Nov.';

  @override
  String get difficultyMedium => 'Pertengahan';

  @override
  String get difficultyMediumShort => 'Sdr.';

  @override
  String get difficultyHigh => 'Lanjutan';

  @override
  String get difficultyHighShort => 'Tgg.';

  @override
  String get difficultyExpert => 'Pakar';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Tuan';

  @override
  String get difficultyMasterShort => 'MST.';

  @override
  String get ach_title_supermind => 'Minda Super';

  @override
  String get ach_desc_supermind =>
      'Menang pada mana-mana kesukaran tanpa kesilapan atau petunjuk dalam masa kurang 2 minit 30 saat';

  @override
  String get rateDialogTitle => 'Suka permainan ini? 💛';

  @override
  String get rateDialogSubtitle =>
      'Penilaian anda akan membantu Sudoku menjadi lebih baik lagi!';

  @override
  String get rateDialogDismiss => 'Keluar';

  @override
  String get rateDialogConfirm => 'Ya, hebat!';
}
