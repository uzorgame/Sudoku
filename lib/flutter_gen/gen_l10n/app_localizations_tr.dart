// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navDaily => 'Mücadele';

  @override
  String get navAchievements => 'Başarımlar';

  @override
  String get achievements_title => 'Başarımlar';

  @override
  String get ach_section_title => 'Hedefler ve Ödüller';

  @override
  String get ach_title_wins_50 => '50 Galibiyet';

  @override
  String get ach_title_no_mistakes => 'Çelik İrade';

  @override
  String get ach_title_streak_3days => '3 Günlük Seri';

  @override
  String get ach_title_fast_solver => 'Şimşek Hızı';

  @override
  String get ach_title_wins_100 => '100 Galibiyet';

  @override
  String get ach_desc_wins_50 => 'Klasik modda 50 kez kazan';

  @override
  String get ach_desc_no_mistakes =>
      'İpucu ve hata yapmadan art arda 3 oyun tamamla';

  @override
  String get ach_desc_streak_3days => 'Aralıksız 3 gün boyunca her gün oyna';

  @override
  String get ach_desc_fast_solver => 'Bir sudokuyu 3 dakikadan kısa sürede çöz';

  @override
  String get ach_desc_wins_100 => 'Klasik modda 100 kez kazan';

  @override
  String get ach_status_finished => 'Tamamlandı';

  @override
  String ach_status_in_progress(int current) {
    return '$current oyun tamamlandı';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Kazanıldı: $date';
  }

  @override
  String get ach_locked => 'Kilitli';

  @override
  String get dailyStreak => 'Günlük seri';

  @override
  String get selectDifficultyTitle => 'Zorluk seç';

  @override
  String get selectDifficultyDailyChallenge => 'Günlük meydan okuma';

  @override
  String get playAction => 'Oyna';

  @override
  String get championshipTitle => 'Şampiyonluk';

  @override
  String championshipScore(int score) {
    return 'Skor $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Sonraki sıraya: $points puan';
  }

  @override
  String get youAreTop => '1. sıradasınız';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Şampiyonluk koşunuzu artırmak için bu turu oynayın.';

  @override
  String get championshipRoundCompletedLabel => 'Tamamlandı';

  @override
  String totalScore(String score) {
    return 'Toplam puan: $score';
  }

  @override
  String get meLabel => 'Ben';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Sıra $rank. $name. $points puan';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Benim yerim $rank. $points puan';
  }

  @override
  String get pointsShort => 'puan';

  @override
  String get championshipAutoScroll => 'Konumuma otomatik kaydır';

  @override
  String get bestLabel => 'En iyi';

  @override
  String get play => 'Oyna';

  @override
  String get battleTitle => 'Savaş';

  @override
  String battleWinRate(int count) {
    return 'Kazanır $count%';
  }

  @override
  String get battleYouLabel => 'Sen';

  @override
  String get battleVictoryTitle => 'Sen kazandın!';

  @override
  String get battleDefeatTitle => 'Rakip önce bitirdi';

  @override
  String battleDefeatMessage(String name) {
    return '$name bulmacayı senden önce çözdü.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Sen kayıp';

  @override
  String get battleExitToMainMenu => 'Ana menü';

  @override
  String get playerFlagSettingTitle => 'Oyuncu bayrağı';

  @override
  String get selectPlayerFlag => 'Bayrağınızı seçin';

  @override
  String get confirmFlagSelectionTitle => 'Bayrağınızı onaylayın';

  @override
  String get confirmFlagSelectionMessage =>
      'Bu bayrağı seçmek istediğinizden emin misiniz? Bayrağınızı daha sonra oyun ayarlarından değiştirebilirsiniz.';

  @override
  String get confirmFlagSelectionConfirm => 'Onayla';

  @override
  String get startAction => 'Başlat';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Seviye $level — $difficulty';
  }

  @override
  String get rankProgress => 'Sıra ilerlemesi';

  @override
  String rankLabel(int rank) {
    return 'Sıra $rank';
  }

  @override
  String get newGame => 'Yeni oyun';

  @override
  String get continueGame => 'Oyuna devam et';

  @override
  String get weeklyProgress => 'Haftalık ilerleme';

  @override
  String get rewardsTitle => 'Ödüller';

  @override
  String get rewardNoMistakesTitle => 'Mücadeleyi hatasız tamamla';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# kalpler',
      one: '# kalp',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Üç mücadeleyi arka arkaya tamamla';

  @override
  String get rewardUniqueTrophy => 'Benzersiz kupa';

  @override
  String get rewardSevenDayTitle => '7 günlük süreyi sürdür seri';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# yıldızlar',
      one: '# yıldız',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Bugünün bulmacası';

  @override
  String get todayPuzzleDescription =>
      'Ekstra bir ödül kazanmak ve serinizi canlı tutmak için sudoku\'yu bitirin.';

  @override
  String get continueAction => 'Devam';

  @override
  String get adMessage => 'Reklam: Gizli nesneleri bulun! Şimdi oyna.';

  @override
  String get adPlay => 'Oynat';

  @override
  String get undo => 'Geri Al';

  @override
  String get erase => 'Sil';

  @override
  String get autoNotes => 'Otomatik notlar';

  @override
  String get statusOn => 'AÇIK';

  @override
  String get statusOff => 'KAPALI';

  @override
  String get notes => 'Notlar';

  @override
  String get hint => 'İpucu';

  @override
  String get undoAdTitle => 'Geri almak için reklamı izleyin';

  @override
  String get undoAdDescription =>
      'Son hamlenizi geri almak için bu kısa reklamı izleyin.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Reklam ${seconds}s\'de bitiyor';
  }

  @override
  String get hintAdTitle => 'İpucu almak için reklamı izleyin';

  @override
  String get hintAdDescription =>
      'İpucu kazanmak için bu kısa reklamı izleyin.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Reklam ${seconds}s\'de bitiyor ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Kalbi yenilemek için reklamı izleyin';

  @override
  String get lifeAdDescription =>
      'Kırmızı kalbi yenilemek ve oynamaya devam etmek için bu kısa reklamı izleyin.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Reklam ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combo ile bitiyor ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Çizgi $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Hız Bonusu $time';
  }

  @override
  String comboX(int count) {
    return 'Kombo x$count';
  }

  @override
  String streakN(int count) {
    return 'Çizgi $count';
  }

  @override
  String speedBonus(String time) {
    return 'Hız Bonusu ($time)';
  }

  @override
  String get noActiveGameMessage => 'Aktif oyun yok. Ana ekrana dönün.';

  @override
  String get victoryTitle => 'Tebrikler!';

  @override
  String victoryMessage(String time) {
    return 'Bulmaca $time\'da çözüldü.';
  }

  @override
  String get backToHome => 'Ana Sayfa';

  @override
  String get playAnother => 'Tekrar oyna';

  @override
  String get outOfLivesTitle => 'Kalpleriniz bitti';

  @override
  String get outOfLivesDescription =>
      'Oynamaya devam etmek için bir kırmızı kalbi geri yükleyin.';

  @override
  String get restoreLifeAction => '1 kırmızı kalbi geri yükleyin';

  @override
  String get cancelAction => 'İptal';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get themeSectionTitle => 'Tema';

  @override
  String get themeWhite => 'Klasik Açık';

  @override
  String get themeCream => 'Krem';

  @override
  String get themeGreen => 'Nane';

  @override
  String get themeBlack => 'Koyu';

  @override
  String get themePurple => 'Mor Koyu';

  @override
  String get themeFontSize => 'Yazı tipi boyutu';

  @override
  String get fontSizeExtraSmall => 'Ekstra küçük';

  @override
  String get fontSizeSmall => 'Küçük';

  @override
  String get fontSizeMedium => 'Orta';

  @override
  String get fontSizeLarge => 'Büyük';

  @override
  String get fontSizeExtraLarge => 'Ekstra büyük';

  @override
  String get languageSectionTitle => 'Dil';

  @override
  String get audioSectionTitle => 'Ses ve müzik';

  @override
  String get soundsEffectsLabel => 'Ses efektleri';

  @override
  String get vibrationLabel => 'Titreşim';

  @override
  String get comboBadgesLabel => 'Kombo rozetler';

  @override
  String get comboHapticsLabel => 'Rozet dokunuşları';

  @override
  String get miscSectionTitle => 'Diğer';

  @override
  String get howToPlayTitle => 'Nasıl oynanır';

  @override
  String get howToPlayRowRule =>
      'Her satırda tekrarlanmayan 1\'den 9\'a kadar rakamlar bulunur';

  @override
  String get howToPlayColumnRule =>
      'Her sütunda tekrarı olmayan 1\'den 9\'a kadar rakamlar';

  @override
  String get howToPlayBoxRule =>
      'Her 3×3 kutuda tekrarı olmayan 1\'den 9\'a kadar rakamlar bulunur';

  @override
  String get howToPlayFooter => 'Her hücreyi doldurun ve kazanırsınız!';

  @override
  String get howToPlayAction => 'Anladım';

  @override
  String get championshipLocalSection => 'Şampiyonluk (yerel)';

  @override
  String get hideCompletedNumbersLabel => 'Tamamlandı gizle rakamlar';

  @override
  String get aboutApp => 'Hakkında';

  @override
  String versionLabel(String version) {
    return 'Sürüm $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR A.Ş.';

  @override
  String get languageEnglish => 'İngilizce';

  @override
  String get languageRussian => 'Rusça';

  @override
  String get languageUkrainian => 'Ukrayna';

  @override
  String get languageGerman => 'Almanca';

  @override
  String get languageFrench => 'Fransızca';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'evet';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'İspanyolca';

  @override
  String get languageItalian => 'İtalyan';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'Portekizce';

  @override
  String get languageIndonesian => 'Bahasa Endonezya';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Hollanda';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'Romanya';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'bu kadar';

  @override
  String get languageBulgarian => 'Bulgarlar';

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
  String get languageSlovak => 'Slovençina';

  @override
  String get export => 'Dışa aktar';

  @override
  String get import => 'İçe aktar';

  @override
  String get resetMyScore => 'Sıfırla puanım';

  @override
  String get resetMyScoreConfirmation =>
      'Skoru sıfırlamak istediğinizden emin misiniz? Bu işlem geri alınamaz.';

  @override
  String get resetAction => 'Sıfırla';

  @override
  String get regenerateOpponents => 'Rakipleri yeniden oluştur';

  @override
  String get confirm => 'Onayla';

  @override
  String get cancel => 'İptal';

  @override
  String get done => 'Bitti';

  @override
  String get privacyPolicyTitle => 'Gizlilik Politikası';

  @override
  String get privacyPolicyAccept => 'Kabul ediyorum';

  @override
  String get privacyPolicyPrompt =>
      'Gizlilik Politikasını kabul ediyor musunuz?';

  @override
  String get privacyPolicyLearnMore => 'Daha fazla bilgi →';

  @override
  String get privacyPolicyDecline => 'Reddediyorum';

  @override
  String get privacyPolicyClose => 'Kapat';

  @override
  String get privacyPolicyLoadError =>
      'Gizlilik politikası yüklenemedi. Lütfen tekrar deneyin.';

  @override
  String get failed => 'Başarısız';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Sıra #$current • +$delta ile #$target';
  }

  @override
  String get statsTitle => 'İstatistikler';

  @override
  String get statsGamesSection => 'Oyunlar';

  @override
  String get statsGamesStarted => 'Oyunlar başladı';

  @override
  String get statsGamesWon => 'Oyunlar kazanıldı';

  @override
  String get statsWinRate => 'Kazandı oran';

  @override
  String get statsFlawless => 'Kusursuz bitirişler';

  @override
  String get statsTimeSection => 'Zaman';

  @override
  String get statsBestTime => 'En iyi zaman';

  @override
  String get statsAverageTime => 'Ortalama süre';

  @override
  String get statsStreakSection => 'Seri';

  @override
  String get statsCurrentStreak => 'Mevcut galibiyet serisi';

  @override
  String get statsBestStreak => 'En iyi galibiyet serisi';

  @override
  String get difficultyNovice => 'Acemi';

  @override
  String get difficultyNoviceShort => 'Kasım';

  @override
  String get difficultyMedium => 'Orta Düzey';

  @override
  String get difficultyMediumShort => 'Uluslararası';

  @override
  String get difficultyHigh => 'İleri Düzey';

  @override
  String get difficultyHighShort => 'Av.';

  @override
  String get difficultyExpert => 'Uzman';

  @override
  String get difficultyExpertShort => 'Uzm.';

  @override
  String get difficultyMaster => 'Usta';

  @override
  String get difficultyMasterShort => 'Bayan.';

  @override
  String get ach_title_supermind => 'Süper Zihin';

  @override
  String get ach_desc_supermind =>
      'Herhangi bir zorlukta hata ya da ipucu olmadan 2 dakika 30 saniyeden kısa sürede kazan';

  @override
  String get rateDialogTitle => 'Oyunu beğendin mi? 💛';

  @override
  String get rateDialogSubtitle =>
      'Puanın Sudoku\'nun daha da iyi olmasına yardımcı olacak!';

  @override
  String get rateDialogDismiss => 'Çıkış';

  @override
  String get rateDialogConfirm => 'Evet, harika!';
}
