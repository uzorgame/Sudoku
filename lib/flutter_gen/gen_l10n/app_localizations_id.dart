// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Rumah';

  @override
  String get navDaily => 'Tantangan';

  @override
  String get navAchievements => 'Pencapaian';

  @override
  String get achievements_title => 'Pencapaian';

  @override
  String get ach_section_title => 'Target dan Hadiah';

  @override
  String get ach_title_wins_50 => '50 Kemenangan';

  @override
  String get ach_title_no_mistakes => 'Tekad Baja';

  @override
  String get ach_title_streak_3days => 'Rekor 3 Hari';

  @override
  String get ach_title_fast_solver => 'Secepat Kilat';

  @override
  String get ach_title_wins_100 => '100 Kemenangan';

  @override
  String get ach_desc_wins_50 => 'Menang 50 kali di mode Klasik';

  @override
  String get ach_desc_no_mistakes =>
      'Selesaikan 3 permainan berturut-turut tanpa petunjuk dan tanpa kesalahan';

  @override
  String get ach_desc_streak_3days =>
      'Main setiap hari selama 3 hari berturut-turut';

  @override
  String get ach_desc_fast_solver =>
      'Selesaikan satu sudoku dalam waktu kurang dari 3 menit';

  @override
  String get ach_desc_wins_100 => 'Menang 100 kali di mode Klasik';

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
    return 'Diperoleh: $date';
  }

  @override
  String get ach_locked => 'Terkunci';

  @override
  String get dailyStreak => 'Pukulan harian';

  @override
  String get selectDifficultyTitle => 'Pilih tingkat kesulitan';

  @override
  String get selectDifficultyDailyChallenge => 'Tantangan harian';

  @override
  String get playAction => 'Bermain';

  @override
  String get championshipTitle => 'Kejuaraan';

  @override
  String championshipScore(int score) {
    return 'Skor $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Ke tempat berikutnya: $points poin';
  }

  @override
  String get youAreTop => 'Anda #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Mainkan putaran ini untuk meningkatkan laju kejuaraan Anda.';

  @override
  String get championshipRoundCompletedLabel => 'Selesai';

  @override
  String totalScore(String score) {
    return 'Skor total: $score';
  }

  @override
  String get meLabel => 'Aku';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Tempat $rank. $name. $points poin';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Tempat saya $rank. $points poin';
  }

  @override
  String get pointsShort => 'poin';

  @override
  String get championshipAutoScroll => 'Gulir otomatis ke posisi saya';

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
  String get battleDefeatTitle => 'Lawan selesai lebih dulu';

  @override
  String battleDefeatMessage(String name) {
    return '$name memecahkan teka-teki sebelum Anda.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Anda kalah';

  @override
  String get battleExitToMainMenu => 'Menu utama';

  @override
  String get playerFlagSettingTitle => 'Bendera pemain';

  @override
  String get selectPlayerFlag => 'Pilih bendera Anda';

  @override
  String get confirmFlagSelectionTitle => 'Konfirmasikan bendera Anda';

  @override
  String get confirmFlagSelectionMessage =>
      'Apakah Anda yakin ingin memilih bendera ini? Anda dapat mengubah bendera Anda nanti di pengaturan game.';

  @override
  String get confirmFlagSelectionConfirm => 'Mengonfirmasi';

  @override
  String get startAction => 'Awal';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Tingkat $level — $difficulty';
  }

  @override
  String get rankProgress => 'Kemajuan peringkat';

  @override
  String rankLabel(int rank) {
    return 'Peringkat $rank';
  }

  @override
  String get newGame => 'Permainan baru';

  @override
  String get continueGame => 'Lanjutkan permainan';

  @override
  String get weeklyProgress => 'Kemajuan mingguan';

  @override
  String get rewardsTitle => 'Hadiah';

  @override
  String get rewardNoMistakesTitle => 'Selesaikan tantangan tanpa kesalahan';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# hati',
      one: '# jantung',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle =>
      'Selesaikan tiga tantangan berturut-turut';

  @override
  String get rewardUniqueTrophy => 'Piala unik';

  @override
  String get rewardSevenDayTitle => 'Pertahankan rekor 7 hari berturut-turut';

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
  String get todayPuzzle => 'Teka-teki hari ini';

  @override
  String get todayPuzzleDescription =>
      'Selesaikan sudoku untuk mendapatkan hadiah ekstra dan pertahankan pukulan Anda tetap hidup.';

  @override
  String get continueAction => 'Melanjutkan';

  @override
  String get adMessage => 'Iklan: Temukan benda tersembunyi! Mainkan sekarang.';

  @override
  String get adPlay => 'Bermain';

  @override
  String get undo => 'Membuka';

  @override
  String get erase => 'Menghapus';

  @override
  String get autoNotes => 'Catatan otomatis';

  @override
  String get statusOn => 'PADA';

  @override
  String get statusOff => 'MATI';

  @override
  String get notes => 'Catatan';

  @override
  String get hint => 'Petunjuk';

  @override
  String get undoAdTitle => 'Tonton iklan untuk membatalkan';

  @override
  String get undoAdDescription =>
      'Tonton iklan singkat ini untuk membatalkan langkah terakhir Anda.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Iklan berakhir dalam ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Tonton iklan untuk mendapatkan petunjuk';

  @override
  String get hintAdDescription =>
      'Tonton iklan singkat ini untuk mendapatkan petunjuk.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Iklan berakhir dalam ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Tonton iklan untuk memulihkan hati';

  @override
  String get lifeAdDescription =>
      'Tonton iklan singkat ini untuk mengembalikan hati yang merah dan terus bermain.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Iklan berakhir dalam ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Kombo ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Garis $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bonus Kecepatan $time';
  }

  @override
  String comboX(int count) {
    return 'Kombo x$count';
  }

  @override
  String streakN(int count) {
    return 'Garis $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonus Kecepatan ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Tidak ada permainan aktif. Kembali ke layar beranda.';

  @override
  String get victoryTitle => 'Selamat!';

  @override
  String victoryMessage(String time) {
    return 'Teka-teki terpecahkan dalam $time.';
  }

  @override
  String get backToHome => 'Rumah';

  @override
  String get playAnother => 'Mainkan lagi';

  @override
  String get outOfLivesTitle => 'Kamu kehabisan hati';

  @override
  String get outOfLivesDescription =>
      'Kembalikan satu hati merah untuk terus bermain.';

  @override
  String get restoreLifeAction => 'Kembalikan 1 hati merah';

  @override
  String get cancelAction => 'Membatalkan';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get themeSectionTitle => 'Tema';

  @override
  String get themeWhite => 'Cahaya Klasik';

  @override
  String get themeCream => 'Krim';

  @override
  String get themeGreen => 'daun mint';

  @override
  String get themeBlack => 'Gelap';

  @override
  String get themePurple => 'Ungu Gelap';

  @override
  String get themeFontSize => 'Ukuran huruf';

  @override
  String get fontSizeExtraSmall => 'Sangat kecil';

  @override
  String get fontSizeSmall => 'Kecil';

  @override
  String get fontSizeMedium => 'Sedang';

  @override
  String get fontSizeLarge => 'Besar';

  @override
  String get fontSizeExtraLarge => 'Ekstra besar';

  @override
  String get languageSectionTitle => 'Bahasa';

  @override
  String get audioSectionTitle => 'Suara & musik';

  @override
  String get soundsEffectsLabel => 'Efek suara';

  @override
  String get vibrationLabel => 'Getaran';

  @override
  String get comboBadgesLabel => 'Lencana kombo';

  @override
  String get comboHapticsLabel => 'Haptik lencana';

  @override
  String get miscSectionTitle => 'Lainnya';

  @override
  String get howToPlayTitle => 'Cara bermain';

  @override
  String get howToPlayRowRule =>
      'Setiap baris memiliki angka 1 hingga 9 tanpa pengulangan';

  @override
  String get howToPlayColumnRule =>
      'Setiap kolom memiliki angka 1 sampai 9 tanpa pengulangan';

  @override
  String get howToPlayBoxRule =>
      'Setiap kotak 3x3 memiliki angka 1 sampai 9 tanpa pengulangan';

  @override
  String get howToPlayFooter => 'Isi setiap sel dan Anda menang!';

  @override
  String get howToPlayAction => 'Mengerti';

  @override
  String get championshipLocalSection => 'Kejuaraan (lokal)';

  @override
  String get hideCompletedNumbersLabel =>
      'Sembunyikan digit yang sudah selesai';

  @override
  String get aboutApp => 'Tentang';

  @override
  String versionLabel(String version) {
    return 'Versi $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'Bahasa inggris';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Jerman';

  @override
  String get languageFrench => 'Perancis';

  @override
  String get languageChinese => 'tidak';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'Spanyol';

  @override
  String get languageItalian => 'Italia';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Turki';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'Portugis';

  @override
  String get languageIndonesian => 'Bahasa Indonesia';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ya';

  @override
  String get languageDutch => 'Belanda';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'Romawi';

  @override
  String get languageCzech => 'Ceština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'begitulah';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'baiklah';

  @override
  String get languageSwahili => 'Kiswahili';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Slovenia';

  @override
  String get export => 'Ekspor';

  @override
  String get import => 'Impor';

  @override
  String get resetMyScore => 'Atur ulang skor saya';

  @override
  String get resetMyScoreConfirmation =>
      'Apakah Anda yakin ingin mengatur ulang skor? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get resetAction => 'Mengatur ulang';

  @override
  String get regenerateOpponents => 'Regenerasi lawan';

  @override
  String get confirm => 'Mengonfirmasi';

  @override
  String get cancel => 'Membatalkan';

  @override
  String get done => 'Selesai';

  @override
  String get privacyPolicyTitle => 'Kebijakan Privasi';

  @override
  String get privacyPolicyAccept => 'saya terima';

  @override
  String get privacyPolicyPrompt => 'Apakah Anda menerima Kebijakan Privasi?';

  @override
  String get privacyPolicyLearnMore => 'Pelajari lebih lanjut →';

  @override
  String get privacyPolicyDecline => 'saya menolak';

  @override
  String get privacyPolicyClose => 'Menutup';

  @override
  String get privacyPolicyLoadError =>
      'Gagal memuat kebijakan privasi. Silakan coba lagi.';

  @override
  String get failed => 'Gagal';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Peringkat #$current • +$delta hingga #$target';
  }

  @override
  String get statsTitle => 'Statistik';

  @override
  String get statsGamesSection => 'Pertandingan';

  @override
  String get statsGamesStarted => 'Permainan dimulai';

  @override
  String get statsGamesWon => 'Permainan dimenangkan';

  @override
  String get statsWinRate => 'Tingkat kemenangan';

  @override
  String get statsFlawless => 'Hasil akhir yang sempurna';

  @override
  String get statsTimeSection => 'Waktu';

  @override
  String get statsBestTime => 'Waktu terbaik';

  @override
  String get statsAverageTime => 'Waktu rata-rata';

  @override
  String get statsStreakSection => 'Garis';

  @override
  String get statsCurrentStreak => 'Pukulan saat ini';

  @override
  String get statsBestStreak => 'Pukulan terbaik';

  @override
  String get difficultyNovice => 'Pemula';

  @override
  String get difficultyNoviceShort => 'Pem.';

  @override
  String get difficultyMedium => 'Menengah';

  @override
  String get difficultyMediumShort => 'Men.';

  @override
  String get difficultyHigh => 'Sulit';

  @override
  String get difficultyHighShort => 'Sul.';

  @override
  String get difficultyExpert => 'Ahli';

  @override
  String get difficultyExpertShort => 'Ahl.';

  @override
  String get difficultyMaster => 'Mahir';

  @override
  String get difficultyMasterShort => 'Mah.';

  @override
  String get ach_title_supermind => 'Super Otak';

  @override
  String get ach_desc_supermind =>
      'Menangkan level apa pun tanpa kesalahan atau petunjuk dalam waktu kurang dari 2 menit 30 detik';

  @override
  String get rateDialogTitle => 'Suka dengan gamenya? 💛';

  @override
  String get rateDialogSubtitle =>
      'Rating kamu akan membantu Sudoku jadi lebih baik lagi!';

  @override
  String get rateDialogDismiss => 'Keluar';

  @override
  String get rateDialogConfirm => 'Ya, keren!';
}
