// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Casa';

  @override
  String get navDaily => 'Sfida';

  @override
  String get navAchievements => 'Obiettivi';

  @override
  String get achievements_title => 'Obiettivi';

  @override
  String get ach_section_title => 'Obiettivi e ricompense';

  @override
  String get ach_title_wins_50 => '50 vittorie';

  @override
  String get ach_title_no_mistakes => 'Volontà di ferro';

  @override
  String get ach_title_streak_3days => 'Serie di 3 giorni';

  @override
  String get ach_title_fast_solver => 'Fulmineo';

  @override
  String get ach_title_wins_100 => '100 vittorie';

  @override
  String get ach_desc_wins_50 => 'Vinci 50 volte nella modalità Classica';

  @override
  String get ach_desc_no_mistakes =>
      'Completa 3 partite di fila senza suggerimenti né errori';

  @override
  String get ach_desc_streak_3days => 'Gioca ogni giorno per 3 giorni di fila';

  @override
  String get ach_desc_fast_solver => 'Risolvi un sudoku in meno di 3 minuti';

  @override
  String get ach_desc_wins_100 => 'Vinci 100 volte nella modalità Classica';

  @override
  String get ach_status_finished => 'Completato';

  @override
  String ach_status_in_progress(int current) {
    return '$current partite completate';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Ottenuto il: $date';
  }

  @override
  String get ach_locked => 'Bloccato';

  @override
  String get dailyStreak => 'Serie giornaliera';

  @override
  String get selectDifficultyTitle => 'Scegli la difficoltà';

  @override
  String get selectDifficultyDailyChallenge => 'Sfida quotidiana';

  @override
  String get playAction => 'Gioca';

  @override
  String get championshipTitle => 'Campionato';

  @override
  String championshipScore(int score) {
    return 'Punteggio $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Fino al prossimo posto: $points punti';
  }

  @override
  String get youAreTop => 'Sei il nº 1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Gioca questo round per dare slancio alla tua corsa nel campionato.';

  @override
  String get championshipRoundCompletedLabel => 'Completato';

  @override
  String totalScore(String score) {
    return 'Punteggio totale: $score';
  }

  @override
  String get meLabel => 'Io';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Posizione $rank. $name. $points punti';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'La mia posizione $rank. $points punti';
  }

  @override
  String get pointsShort => 'PT';

  @override
  String get championshipAutoScroll =>
      'Scrollare automatico alla mia posizione';

  @override
  String get bestLabel => 'Migliore';

  @override
  String get play => 'Giocare';

  @override
  String get battleTitle => 'Battaglia';

  @override
  String battleWinRate(int count) {
    return 'Vittorie $count%';
  }

  @override
  String get battleYouLabel => 'Tu';

  @override
  String get battleVictoryTitle => 'Hai vinto!';

  @override
  String get battleDefeatTitle => 'L\'avversario ha vinto';

  @override
  String battleDefeatMessage(String name) {
    return '$name ha risolto il sudoku prima di te.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Hai perso';

  @override
  String get battleExitToMainMenu => 'Menu principale';

  @override
  String get playerFlagSettingTitle => 'Bandiera del giocatore';

  @override
  String get selectPlayerFlag => 'Scegli la tua bandiera';

  @override
  String get confirmFlagSelectionTitle => 'Conferma la tua bandiera';

  @override
  String get confirmFlagSelectionMessage =>
      'Sei sicuro di voler scegliere questa bandiera? Potrai cambiare la tua bandiera più tardi nelle impostazioni del gioco.';

  @override
  String get confirmFlagSelectionConfirm => 'Conferma';

  @override
  String get startAction => 'Inizio';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Livello $level — $difficulty';
  }

  @override
  String get rankProgress => 'Progresso di rango';

  @override
  String rankLabel(int rank) {
    return 'Classifica $rank';
  }

  @override
  String get newGame => 'Nuovo gioco';

  @override
  String get continueGame => 'Continua il gioco';

  @override
  String get weeklyProgress => 'Progressi settimanali';

  @override
  String get rewardsTitle => 'Premi';

  @override
  String get rewardNoMistakesTitle => 'Finire la sfida senza errori';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# cuori',
      one: '# cuore',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Completa tre sfide di seguito';

  @override
  String get rewardUniqueTrophy => 'Trofeo unico';

  @override
  String get rewardSevenDayTitle => 'Mantenere una serie di 7 giorni';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# stelle',
      one: '# stella',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Il puzzle di oggi';

  @override
  String get todayPuzzleDescription =>
      'Termina il Sudoku per guadagnare una ricompensa extra e mantenere viva la tua serie.';

  @override
  String get continueAction => 'Continuare';

  @override
  String get adMessage => 'AD: Trova oggetti nascosti! Gioca adesso.';

  @override
  String get adPlay => 'Giocare';

  @override
  String get undo => 'Disfare';

  @override
  String get erase => 'Cancellare';

  @override
  String get autoNotes => 'Note automatiche';

  @override
  String get statusOn => 'SU';

  @override
  String get statusOff => 'SPENTO';

  @override
  String get notes => 'Note';

  @override
  String get hint => 'Suggerimento';

  @override
  String get undoAdTitle => 'Guarda l\'annuncio per annullare';

  @override
  String get undoAdDescription =>
      'Guarda questo breve annuncio per annullare la tua ultima mossa.';

  @override
  String undoAdCountdown(int seconds) {
    return 'L\'annuncio termina tra $seconds s';
  }

  @override
  String get hintAdTitle => 'Guarda l\'annuncio per ottenere un suggerimento';

  @override
  String get hintAdDescription =>
      'Guarda questo breve annuncio per ottenere un suggerimento.';

  @override
  String hintAdCountdown(int seconds) {
    return 'L\'annuncio termina tra $seconds s';
  }

  @override
  String get lifeAdTitle => 'Guarda l\'annuncio per ripristinare un cuore';

  @override
  String get lifeAdDescription =>
      'Guarda questo breve annuncio per ripristinare un cuore rosso e continuare a giocare.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'L\'annuncio termina tra $seconds s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combinato ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Serie $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bonus velocità $time';
  }

  @override
  String comboX(int count) {
    return 'Combinato x$count';
  }

  @override
  String streakN(int count) {
    return 'Serie $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonus velocità ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Nessun gioco attivo. Torna alla schermata principale.';

  @override
  String get victoryTitle => 'Congratulazioni!';

  @override
  String victoryMessage(String time) {
    return 'Schema risolto in $time.';
  }

  @override
  String get backToHome => 'Casa';

  @override
  String get playAnother => 'Gioca di nuovo';

  @override
  String get outOfLivesTitle => 'Sei fuori dal cuore';

  @override
  String get outOfLivesDescription =>
      'Ripristina un cuore rosso per continuare a giocare.';

  @override
  String get restoreLifeAction => 'Ripristina 1 cuore rosso';

  @override
  String get cancelAction => 'Cancellare';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get themeSectionTitle => 'Tema';

  @override
  String get themeWhite => 'Luce classica';

  @override
  String get themeCream => 'Crema';

  @override
  String get themeGreen => 'Menta';

  @override
  String get themeBlack => 'Buio';

  @override
  String get themePurple => 'Viola scuro';

  @override
  String get themeFontSize => 'Dimensione del carattere';

  @override
  String get fontSizeExtraSmall => 'Extra piccolo';

  @override
  String get fontSizeSmall => 'Piccolo';

  @override
  String get fontSizeMedium => 'Medio';

  @override
  String get fontSizeLarge => 'Grande';

  @override
  String get fontSizeExtraLarge => 'Extra grande';

  @override
  String get languageSectionTitle => 'Lingua';

  @override
  String get audioSectionTitle => 'Suono e musica';

  @override
  String get soundsEffectsLabel => 'Effetti sonori';

  @override
  String get vibrationLabel => 'Vibrazione';

  @override
  String get comboBadgesLabel => 'Badge combo';

  @override
  String get comboHapticsLabel => 'Feedback aptico badge';

  @override
  String get miscSectionTitle => 'Altro';

  @override
  String get howToPlayTitle => 'Come si gioca';

  @override
  String get howToPlayRowRule =>
      'Ogni riga contiene i numeri da 1 a 9 senza ripetizioni';

  @override
  String get howToPlayColumnRule =>
      'Ogni colonna contiene i numeri da 1 a 9 senza ripetizioni';

  @override
  String get howToPlayBoxRule =>
      'Ogni riquadro 3×3 contiene i numeri da 1 a 9 senza ripetizioni';

  @override
  String get howToPlayFooter => 'Riempi tutte le caselle e vinci!';

  @override
  String get howToPlayAction => 'Ho capito';

  @override
  String get championshipLocalSection => 'Campionato (locale)';

  @override
  String get hideCompletedNumbersLabel => 'Nascondere le cifre completate';

  @override
  String get aboutApp => 'Di';

  @override
  String versionLabel(String version) {
    return 'Versione $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get languageRussian => 'Russo';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Tedesco';

  @override
  String get languageFrench => 'Francese';

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
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'sì';

  @override
  String get languageDutch => 'Paesi Bassi';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'Romana';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'sì, sì';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'ok';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'Kiswahili';

  @override
  String get languageTamil => 'Va bene';

  @override
  String get languageSlovak => 'Slovenicina';

  @override
  String get export => 'Esportare';

  @override
  String get import => 'Importare';

  @override
  String get resetMyScore => 'Ripristina il mio punteggio';

  @override
  String get resetMyScoreConfirmation =>
      'Sei sicuro di voler ripristinare il punteggio? Questa azione non può essere annullata.';

  @override
  String get resetAction => 'Azzera';

  @override
  String get regenerateOpponents => 'Rigenerare gli avversari';

  @override
  String get confirm => 'Confermare';

  @override
  String get cancel => 'Cancellare';

  @override
  String get done => 'Fatto';

  @override
  String get privacyPolicyTitle => 'Informativa sulla privacy';

  @override
  String get privacyPolicyAccept => 'Accetto';

  @override
  String get privacyPolicyPrompt => 'Accetti l\'informativa sulla privacy?';

  @override
  String get privacyPolicyLearnMore => 'Ulteriori informazioni →';

  @override
  String get privacyPolicyDecline => 'Rifiuto';

  @override
  String get privacyPolicyClose => 'Chiudi';

  @override
  String get privacyPolicyLoadError =>
      'Impossibile caricare l\'informativa sulla privacy. Riprova.';

  @override
  String get failed => 'Fallito';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Classifica #$current • +$delta fino a #$target';
  }

  @override
  String get statsTitle => 'Statistiche';

  @override
  String get statsGamesSection => 'Giochi';

  @override
  String get statsGamesStarted => 'I giochi sono iniziati';

  @override
  String get statsGamesWon => 'Giochi vinti';

  @override
  String get statsWinRate => 'Tasso di vittoria';

  @override
  String get statsFlawless => 'Finiture impeccabili';

  @override
  String get statsTimeSection => 'Tempo';

  @override
  String get statsBestTime => 'MIGLIORE MIGLIORE';

  @override
  String get statsAverageTime => 'Tempo medio';

  @override
  String get statsStreakSection => 'Strisciante';

  @override
  String get statsCurrentStreak => 'Striscia attuale';

  @override
  String get statsBestStreak => 'Migliore striscia';

  @override
  String get difficultyNovice => 'Novizio';

  @override
  String get difficultyNoviceShort => 'Novembre';

  @override
  String get difficultyMedium => 'Intermedio';

  @override
  String get difficultyMediumShort => 'interno';

  @override
  String get difficultyHigh => 'Avanzato';

  @override
  String get difficultyHighShort => 'Avv.';

  @override
  String get difficultyExpert => 'Esperto';

  @override
  String get difficultyExpertShort => 'Esp.';

  @override
  String get difficultyMaster => 'Maestro';

  @override
  String get difficultyMasterShort => 'MST.';

  @override
  String get ach_title_supermind => 'Supermente';

  @override
  String get ach_desc_supermind =>
      'Vinci a qualsiasi difficoltà senza errori né suggerimenti in meno di 2 minuti e 30 secondi';

  @override
  String get rateDialogTitle => 'Ti piace il gioco? 💛';

  @override
  String get rateDialogSubtitle =>
      'La tua valutazione aiuterà Sudoku a diventare ancora migliore!';

  @override
  String get rateDialogDismiss => 'Esci';

  @override
  String get rateDialogConfirm => 'Sì, è fantastica!';
}
