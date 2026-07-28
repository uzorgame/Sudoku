// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Kotiin';

  @override
  String get navDaily => 'Haaste';

  @override
  String get navAchievements => 'Saavutukset';

  @override
  String get achievements_title => 'Saavutukset';

  @override
  String get ach_section_title => 'Tavoitteet ja palkinnot';

  @override
  String get ach_title_wins_50 => '50 voittoa';

  @override
  String get ach_title_no_mistakes => 'Rautainen tahto';

  @override
  String get ach_title_streak_3days => '3 päivän putki';

  @override
  String get ach_title_fast_solver => 'Salamannopea';

  @override
  String get ach_title_wins_100 => '100 voittoa';

  @override
  String get ach_desc_wins_50 => 'Voita 50 kertaa klassisessa tilassa';

  @override
  String get ach_desc_no_mistakes =>
      'Voita 3 peliä peräkkäin ilman vihjeitä ja virheitä';

  @override
  String get ach_desc_streak_3days => 'Pelaa kolmena peräkkäisenä päivänä';

  @override
  String get ach_desc_fast_solver => 'Ratkaise sudoku alle 3 minuutissa';

  @override
  String get ach_desc_wins_100 => 'Voita 100 kertaa klassisessa tilassa';

  @override
  String get ach_status_finished => 'Valmis';

  @override
  String ach_status_in_progress(int current) {
    return '$current peliä suoritettu';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Saavutettu: $date';
  }

  @override
  String get ach_locked => 'Lukittu';

  @override
  String get dailyStreak => 'Päivittäinen viiva';

  @override
  String get selectDifficultyTitle => 'Valitse vaikeus';

  @override
  String get selectDifficultyDailyChallenge => 'Päivittäinen haaste';

  @override
  String get playAction => 'Pelata';

  @override
  String get championshipTitle => 'Mestaruus';

  @override
  String championshipScore(int score) {
    return 'Pisteet $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Seuraavaan paikkaan: $points pts';
  }

  @override
  String get youAreTop => 'Olet #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Pelaa tätä kierrosta parantaaksesi mestaruuskilpailua.';

  @override
  String get championshipRoundCompletedLabel => 'Valmis';

  @override
  String totalScore(String score) {
    return 'Kokonaispistemäärä: $score';
  }

  @override
  String get meLabel => 'Minulle';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Aseta $rank. $name. $points pisteitä';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Minun paikkani $rank. $points pisteitä';
  }

  @override
  String get pointsShort => 'pts';

  @override
  String get championshipAutoScroll => 'Automaattisesti';

  @override
  String get bestLabel => 'Parhaat';

  @override
  String get play => 'Pelata';

  @override
  String get battleTitle => 'Taistelu';

  @override
  String battleWinRate(int count) {
    return 'Voittaa $count%';
  }

  @override
  String get battleYouLabel => 'Sinä';

  @override
  String get battleVictoryTitle => 'Voitit!';

  @override
  String get battleDefeatTitle => 'Vastustaja päättyi ensin';

  @override
  String battleDefeatMessage(String name) {
    return '$name ratkaisi palapelin ennen sinua.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Kadotit';

  @override
  String get battleExitToMainMenu => 'Päävalikko';

  @override
  String get playerFlagSettingTitle => 'Pelaajan lippu';

  @override
  String get selectPlayerFlag => 'Valitse lippu';

  @override
  String get confirmFlagSelectionTitle => 'Vahvista lippu';

  @override
  String get confirmFlagSelectionMessage =>
      'Haluatko varmasti valita tämän lipun? Voit muuttaa lippusi myöhemmin peliasetuksissa.';

  @override
  String get confirmFlagSelectionConfirm => 'Vahvistaa';

  @override
  String get startAction => 'Alkaa';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Taso $level - $difficulty';
  }

  @override
  String get rankProgress => 'Sijoitus';

  @override
  String rankLabel(int rank) {
    return 'Sijoitus $rank';
  }

  @override
  String get newGame => 'Uusi peli';

  @override
  String get continueGame => 'Jatkaa peliä';

  @override
  String get weeklyProgress => 'Viikoittainen edistyminen';

  @override
  String get rewardsTitle => 'Palkkiot';

  @override
  String get rewardNoMistakesTitle => 'Viimeistele haaste ilman virheitä';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# sydämet',
      one: '# sydän',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Suorita kolme haastetta peräkkäin';

  @override
  String get rewardUniqueTrophy => 'Ainutlaatuinen pokaali';

  @override
  String get rewardSevenDayTitle => 'Ylläpitää 7 päivän viiraa';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# tähdet',
      one: '# tähti',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Tämän päivän palapeli';

  @override
  String get todayPuzzleDescription =>
      'Viimeistele Sudoku ansaitaksesi ylimääräisen palkinnon ja pitämään viivasi hengissä.';

  @override
  String get continueAction => 'Jatkaa';

  @override
  String get adMessage => 'AD: Löydä piilotetut esineet! Pelaa nyt.';

  @override
  String get adPlay => 'Pelata';

  @override
  String get undo => 'Kumota';

  @override
  String get erase => 'Poistaa';

  @override
  String get autoNotes => 'Automaattiset muistiinpanot';

  @override
  String get statusOn => '-Lla';

  @override
  String get statusOff => 'POIS';

  @override
  String get notes => 'Muistiinpanot';

  @override
  String get hint => 'Vihje';

  @override
  String get undoAdTitle => 'Katso mainos kumota';

  @override
  String get undoAdDescription =>
      'Katso tämä lyhyt mainos kumotaksesi viimeinen siirto.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Mainos päättyy ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Katso mainos saadaksesi vihjeen';

  @override
  String get hintAdDescription =>
      'Katso tämä lyhyt mainos ansaitaksesi vihjeen.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Mainos päättyy ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Katso mainoksia sydämen palauttamiseksi';

  @override
  String get lifeAdDescription =>
      'Katso tämä lyhyt mainos punaisen sydämen palauttamiseksi ja pelaamiseksi.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Mainos päättyy ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Yhdistelmä × $count';
  }

  @override
  String streak_n(int count) {
    return 'Viiva $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Nopeusbonus $time';
  }

  @override
  String comboX(int count) {
    return 'Kombo ×$count';
  }

  @override
  String streakN(int count) {
    return 'Viiva $count';
  }

  @override
  String speedBonus(String time) {
    return 'Nopeusbonus ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Ei aktiivista peliä. Palaa aloitusnäyttöön.';

  @override
  String get victoryTitle => 'Onnittelut!';

  @override
  String victoryMessage(String time) {
    return 'Palapeli ratkaistu $time.';
  }

  @override
  String get backToHome => 'Kotiin';

  @override
  String get playAnother => 'Pelata uudelleen';

  @override
  String get outOfLivesTitle => 'Olet poissa sydämestä';

  @override
  String get outOfLivesDescription =>
      'Palauta yksi punainen sydän jatkaaksesi pelaamista.';

  @override
  String get restoreLifeAction => 'Palauta 1 punainen sydän';

  @override
  String get cancelAction => 'Peruuttaa';

  @override
  String get settingsTitle => 'Asetukset';

  @override
  String get themeSectionTitle => 'Teema';

  @override
  String get themeWhite => 'Klassinen valo';

  @override
  String get themeCream => 'Kerma';

  @override
  String get themeGreen => 'Minttu';

  @override
  String get themeBlack => 'Tumma';

  @override
  String get themePurple => 'Violetti pimeä';

  @override
  String get themeFontSize => 'Fontin koko';

  @override
  String get fontSizeExtraSmall => 'Ylimääräinen pieni';

  @override
  String get fontSizeSmall => 'Pieni';

  @override
  String get fontSizeMedium => 'Keskipitkä';

  @override
  String get fontSizeLarge => 'Suuri';

  @override
  String get fontSizeExtraLarge => 'Erittäin suuri';

  @override
  String get languageSectionTitle => 'Kieli';

  @override
  String get audioSectionTitle => 'Ääni ja musiikki';

  @override
  String get soundsEffectsLabel => 'Äänitehosteet';

  @override
  String get vibrationLabel => 'Värähtely';

  @override
  String get comboBadgesLabel => 'Yhdistelmämerkit';

  @override
  String get comboHapticsLabel => 'Merkkihaptikat';

  @override
  String get miscSectionTitle => 'Muut';

  @override
  String get howToPlayTitle => 'Kuinka pelata';

  @override
  String get howToPlayRowRule =>
      'Jokaisessa rivissä on numerot 1-9 ilman toistoja';

  @override
  String get howToPlayColumnRule =>
      'Jokaisessa sarakkeessa on numerot 1-9 ilman toistoja';

  @override
  String get howToPlayBoxRule =>
      'Jokaisessa 3 × 3 -laatikossa on numerot 1 - 9 ilman toistoja';

  @override
  String get howToPlayFooter => 'Täytä jokainen solu ja voitat!';

  @override
  String get howToPlayAction => 'Sain sen';

  @override
  String get championshipLocalSection => 'Championship (paikallinen)';

  @override
  String get hideCompletedNumbersLabel => 'Piilota täydet numerot';

  @override
  String get aboutApp => 'Noin';

  @override
  String versionLabel(String version) {
    return 'Versio $version';
  }

  @override
  String get aboutLegalese => 'UZOR';

  @override
  String get languageEnglish => 'englanti';

  @override
  String get languageRussian => 'Рйий';

  @override
  String get languageUkrainian => 'Ураїнса';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'Españolia';

  @override
  String get languageItalian => 'Italialainen';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'portugali';

  @override
  String get languageIndonesian => 'Bahasa Indonesia';

  @override
  String get languageVietnamese => 'Tiput';

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
  String get languageKazakh => 'Қазақ т т т т т т т';

  @override
  String get languageBulgarian => 'Български';

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
  String get export => 'Viedä';

  @override
  String get import => 'Tuoda';

  @override
  String get resetMyScore => 'Nollaa pisteet';

  @override
  String get resetMyScoreConfirmation =>
      'Oletko varma, että haluat nollata pisteet? Tätä toimintaa ei voida kumota.';

  @override
  String get resetAction => 'Nollata';

  @override
  String get regenerateOpponents => 'Uudistaa vastustajia';

  @override
  String get confirm => 'Vahvistaa';

  @override
  String get cancel => 'Peruuttaa';

  @override
  String get done => 'Tehty';

  @override
  String get privacyPolicyTitle => 'Tietosuojakäytäntö';

  @override
  String get privacyPolicyAccept => 'Hyväksyn';

  @override
  String get privacyPolicyPrompt => 'Hyväksytkö tietosuojakäytännön?';

  @override
  String get privacyPolicyLearnMore => 'Lisätietoja →';

  @override
  String get privacyPolicyDecline => 'Minä pudotan';

  @override
  String get privacyPolicyClose => 'Lähellä';

  @override
  String get privacyPolicyLoadError =>
      'Tietosuojakäytännön lataaminen epäonnistui. Yritä uudelleen.';

  @override
  String get failed => 'Epäonnistunut';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Sijoitus #$current • +$delta - #$target';
  }

  @override
  String get statsTitle => 'Tilastot';

  @override
  String get statsGamesSection => 'Pelit';

  @override
  String get statsGamesStarted => 'Pelit alkoivat';

  @override
  String get statsGamesWon => 'Voitti';

  @override
  String get statsWinRate => 'Voittoprosentti';

  @override
  String get statsFlawless => 'Virheetön viimeistely';

  @override
  String get statsTimeSection => 'Aika';

  @override
  String get statsBestTime => 'Paras aika';

  @override
  String get statsAverageTime => 'Keskimääräinen aika';

  @override
  String get statsStreakSection => 'Rivit';

  @override
  String get statsCurrentStreak => 'Nykyinen viiva';

  @override
  String get statsBestStreak => 'Paras viiva';

  @override
  String get difficultyNovice => 'Aloittelija';

  @override
  String get difficultyNoviceShort => 'Alo.';

  @override
  String get difficultyMedium => 'Keskitaso';

  @override
  String get difficultyMediumShort => 'Kes.';

  @override
  String get difficultyHigh => 'Vaikea';

  @override
  String get difficultyHighShort => 'Vai.';

  @override
  String get difficultyExpert => 'Ekspertti';

  @override
  String get difficultyExpertShort => 'Eks.';

  @override
  String get difficultyMaster => 'Mestari';

  @override
  String get difficultyMasterShort => 'Mes.';

  @override
  String get ach_title_supermind => 'Supermieli';

  @override
  String get ach_desc_supermind =>
      'Voita millä tahansa vaikeustasolla ilman virheitä tai vihjeitä alle 2 minuutissa 30 sekunnissa';

  @override
  String get rateDialogTitle => 'Pidätkö pelistä? 💛';

  @override
  String get rateDialogSubtitle =>
      'Arvostelusi auttaa Sudokua paranemaan entisestään!';

  @override
  String get rateDialogDismiss => 'Poistu';

  @override
  String get rateDialogConfirm => 'Kyllä, mahtava!';
}
