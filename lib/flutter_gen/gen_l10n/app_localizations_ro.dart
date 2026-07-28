// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Acasă';

  @override
  String get navDaily => 'Provocare';

  @override
  String get navAchievements => 'Realizări';

  @override
  String get achievements_title => 'Realizări';

  @override
  String get ach_section_title => 'Obiective și recompense';

  @override
  String get ach_title_wins_50 => '50 de victorii';

  @override
  String get ach_title_no_mistakes => 'Voință de fier';

  @override
  String get ach_title_streak_3days => 'Serie de 3 zile';

  @override
  String get ach_title_fast_solver => 'Fulgerător';

  @override
  String get ach_title_wins_100 => '100 de victorii';

  @override
  String get ach_desc_wins_50 => 'Câștigă de 50 de ori în modul Clasic';

  @override
  String get ach_desc_no_mistakes =>
      'Încheie 3 jocuri la rând fără indicii și fără greșeli';

  @override
  String get ach_desc_streak_3days => 'Joacă zilnic timp de 3 zile la rând';

  @override
  String get ach_desc_fast_solver =>
      'Rezolvă un sudoku în mai puțin de 3 minute';

  @override
  String get ach_desc_wins_100 => 'Câștigă de 100 de ori în modul Clasic';

  @override
  String get ach_status_finished => 'Finalizat';

  @override
  String ach_status_in_progress(int current) {
    return '$current jocuri finalizate';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Obținut la: $date';
  }

  @override
  String get ach_locked => 'Blocat';

  @override
  String get dailyStreak => 'Zilnic';

  @override
  String get selectDifficultyTitle => 'Alege dificultăți';

  @override
  String get selectDifficultyDailyChallenge => 'Provocare zilnică';

  @override
  String get playAction => 'Juca';

  @override
  String get championshipTitle => 'Campionat';

  @override
  String championshipScore(int score) {
    return 'Scor $score';
  }

  @override
  String toNextPlace(int points) {
    return 'La locul următor: $points PTS';
  }

  @override
  String get youAreTop => 'Ești #1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Joacă această rundă pentru a -ți stimula alergarea campionatului.';

  @override
  String get championshipRoundCompletedLabel => 'Completat';

  @override
  String totalScore(String score) {
    return 'Scor total: $score';
  }

  @override
  String get meLabel => 'Eu';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Plasați $rank. $name. $points puncte';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Locul meu $rank. $points puncte';
  }

  @override
  String get pointsShort => 'pct';

  @override
  String get championshipAutoScroll => 'Auto-scroll la poziția mea';

  @override
  String get bestLabel => 'Cel mai bun';

  @override
  String get play => 'Juca';

  @override
  String get battleTitle => 'Luptă';

  @override
  String battleWinRate(int count) {
    return 'Câștigă $count%';
  }

  @override
  String get battleYouLabel => 'Tu';

  @override
  String get battleVictoryTitle => 'Ai câștigat!';

  @override
  String get battleDefeatTitle => 'Oponentul a terminat primul';

  @override
  String battleDefeatMessage(String name) {
    return '$name a rezolvat puzzle -ul înaintea voastră.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Ai pierdut';

  @override
  String get battleExitToMainMenu => 'Meniul principal';

  @override
  String get playerFlagSettingTitle => 'Steagul jucătorului';

  @override
  String get selectPlayerFlag => 'Alege -ți steagul';

  @override
  String get confirmFlagSelectionTitle => 'Confirmați -vă steagul';

  @override
  String get confirmFlagSelectionMessage =>
      'Ești sigur că vrei să alegi acest steag? Puteți schimba steagul mai târziu în setările jocului.';

  @override
  String get confirmFlagSelectionConfirm => 'Confirma';

  @override
  String get startAction => 'Început';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Nivel $level - $difficulty';
  }

  @override
  String get rankProgress => 'Progresul de rang';

  @override
  String rankLabel(int rank) {
    return 'Clasament $rank';
  }

  @override
  String get newGame => 'Joc nou';

  @override
  String get continueGame => 'Continuați jocul';

  @override
  String get weeklyProgress => 'Progres săptămânal';

  @override
  String get rewardsTitle => 'Recompense';

  @override
  String get rewardNoMistakesTitle => 'Termină provocarea fără greșeli';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# inimile',
      one: '# inima',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Completați trei provocări la rând';

  @override
  String get rewardUniqueTrophy => 'Trofeu unic';

  @override
  String get rewardSevenDayTitle => 'Mențineți o serie de 7 zile';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# stele',
      one: '# stea',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Puzzle -ul de astăzi';

  @override
  String get todayPuzzleDescription =>
      'Finalizați Sudoku pentru a câștiga o recompensă suplimentară și pentru a vă menține în viață șirul.';

  @override
  String get continueAction => 'Continua';

  @override
  String get adMessage => 'AD: Găsiți obiecte ascunse! Joacă acum.';

  @override
  String get adPlay => 'Juca';

  @override
  String get undo => 'Anula';

  @override
  String get erase => 'Şterge';

  @override
  String get autoNotes => 'Note auto';

  @override
  String get statusOn => 'PE';

  @override
  String get statusOff => 'Oprit';

  @override
  String get notes => 'Note';

  @override
  String get hint => 'Aluzie';

  @override
  String get undoAdTitle => 'Urmăriți anunțul pentru a anula';

  @override
  String get undoAdDescription =>
      'Urmăriți acest scurt anunț pentru a vă anula ultima mișcare.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Anunțul se termină în ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Urmăriți anunțul pentru a obține un indiciu';

  @override
  String get hintAdDescription =>
      'Urmăriți acest scurt anunț pentru a câștiga un indiciu.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Anunțul se termină în ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Urmăriți anunțul pentru a restabili o inimă';

  @override
  String get lifeAdDescription =>
      'Urmăriți acest scurt anunț pentru a restabili o inimă roșie și continuați să vă jucați.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Anunțul se termină în ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combo × $count';
  }

  @override
  String streak_n(int count) {
    return 'Serie $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bonus de viteză $time';
  }

  @override
  String comboX(int count) {
    return 'Combo ×$count';
  }

  @override
  String streakN(int count) {
    return 'Serie $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonus de viteză ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Niciun joc activ. Întoarceți -vă la ecranul de pornire.';

  @override
  String get victoryTitle => 'Felicitări!';

  @override
  String victoryMessage(String time) {
    return 'Puzzle rezolvat în $time.';
  }

  @override
  String get backToHome => 'Acasă';

  @override
  String get playAnother => 'Joacă din nou';

  @override
  String get outOfLivesTitle => 'Ești în afara inimilor';

  @override
  String get outOfLivesDescription =>
      'Restabiliți o inimă roșie pentru a continua să joace.';

  @override
  String get restoreLifeAction => 'Restabiliți 1 inimă roșie';

  @override
  String get cancelAction => 'Anula';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get themeSectionTitle => 'Temă';

  @override
  String get themeWhite => 'Lumina clasică';

  @override
  String get themeCream => 'Cremă';

  @override
  String get themeGreen => 'Mentă';

  @override
  String get themeBlack => 'Întuneric';

  @override
  String get themePurple => 'Întuneric violet';

  @override
  String get themeFontSize => 'Dimensiunea fontului';

  @override
  String get fontSizeExtraSmall => 'Extra mic';

  @override
  String get fontSizeSmall => 'Mic';

  @override
  String get fontSizeMedium => 'Mediu';

  @override
  String get fontSizeLarge => 'Mare';

  @override
  String get fontSizeExtraLarge => 'Extrem de mare';

  @override
  String get languageSectionTitle => 'Limbă';

  @override
  String get audioSectionTitle => 'Sunet și muzică';

  @override
  String get soundsEffectsLabel => 'Efecte sonore';

  @override
  String get vibrationLabel => 'Vibrație';

  @override
  String get comboBadgesLabel => 'Insigne combo';

  @override
  String get comboHapticsLabel => 'Haptics de insigne';

  @override
  String get miscSectionTitle => 'Alte';

  @override
  String get howToPlayTitle => 'Cum să te joci';

  @override
  String get howToPlayRowRule =>
      'Fiecare rând are cifrele de la 1 la 9 fără repetări';

  @override
  String get howToPlayColumnRule =>
      'Fiecare coloană are cifrele de la 1 la 9 fără repetări';

  @override
  String get howToPlayBoxRule =>
      'Fiecare cutie 3 × 3 are cifrele de la 1 la 9 fără repetări';

  @override
  String get howToPlayFooter => 'Completați fiecare celulă și câștigați!';

  @override
  String get howToPlayAction => 'Am înţeles';

  @override
  String get championshipLocalSection => 'Campionat (local)';

  @override
  String get hideCompletedNumbersLabel => 'Ascundeți cifrele completate';

  @override
  String get aboutApp => 'Despre';

  @override
  String versionLabel(String version) {
    return 'Versiunea $version';
  }

  @override
  String get aboutLegalese => 'UZOR';

  @override
  String get languageEnglish => 'Engleză';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Ai';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'Franceză';

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
  String get languagePortuguese => 'portugheză';

  @override
  String get languageIndonesian => 'Bahasa Indonezia';

  @override
  String get languageVietnamese => 'Tiếng việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Olanda';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'ROMÂNĂ';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'Қазақ т т';

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
  String get export => 'Exportă';

  @override
  String get import => 'Importă';

  @override
  String get resetMyScore => 'Resetează -mi scorul';

  @override
  String get resetMyScoreConfirmation =>
      'Ești sigur că vrei să resetezi scorul? Această acțiune nu poate fi anulată.';

  @override
  String get resetAction => 'Resetează';

  @override
  String get regenerateOpponents => 'Regenerarea adversarilor';

  @override
  String get confirm => 'Confirma';

  @override
  String get cancel => 'Anula';

  @override
  String get done => 'Făcut';

  @override
  String get privacyPolicyTitle => 'Politica de confidențialitate';

  @override
  String get privacyPolicyAccept => 'Accept';

  @override
  String get privacyPolicyPrompt => 'Acceptați Politica de confidențialitate?';

  @override
  String get privacyPolicyLearnMore => 'Aflați mai multe →';

  @override
  String get privacyPolicyDecline => 'Eu refuză';

  @override
  String get privacyPolicyClose => 'Aproape';

  @override
  String get privacyPolicyLoadError =>
      'Nu a reușit să încarce politica de confidențialitate. Vă rugăm să încercați din nou.';

  @override
  String get failed => 'Eșuat';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rank #$current • +$delta până la #$target';
  }

  @override
  String get statsTitle => 'Statistici';

  @override
  String get statsGamesSection => 'Jocuri';

  @override
  String get statsGamesStarted => 'A început jocurile';

  @override
  String get statsGamesWon => 'Jocurile au câștigat';

  @override
  String get statsWinRate => 'Rata de câștig';

  @override
  String get statsFlawless => 'Finisaje impecabile';

  @override
  String get statsTimeSection => 'Timp';

  @override
  String get statsBestTime => 'Cel mai bun timp';

  @override
  String get statsAverageTime => 'Timp mediu';

  @override
  String get statsStreakSection => 'Fâșie';

  @override
  String get statsCurrentStreak => 'Streak actual';

  @override
  String get statsBestStreak => 'Cea mai bună dungă';

  @override
  String get difficultyNovice => 'Începător';

  @override
  String get difficultyNoviceShort => 'Înc.';

  @override
  String get difficultyMedium => 'Mediu';

  @override
  String get difficultyMediumShort => 'Med.';

  @override
  String get difficultyHigh => 'Greu';

  @override
  String get difficultyHighShort => 'Greu';

  @override
  String get difficultyExpert => 'Expert';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Maestru';

  @override
  String get difficultyMasterShort => 'Mae.';

  @override
  String get ach_title_supermind => 'Superminte';

  @override
  String get ach_desc_supermind =>
      'Câștigă la orice dificultate fără greșeli sau indicii în mai puțin de 2 minute și 30 de secunde';

  @override
  String get rateDialogTitle => 'Îți place jocul? 💛';

  @override
  String get rateDialogSubtitle =>
      'Evaluarea ta va ajuta Sudoku să devină și mai bun!';

  @override
  String get rateDialogDismiss => 'Ieși';

  @override
  String get rateDialogConfirm => 'Da, e grozavă!';
}
