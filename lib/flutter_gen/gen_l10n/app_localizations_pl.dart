// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Dom';

  @override
  String get navDaily => 'Wyzwanie';

  @override
  String get navAchievements => 'Osiągnięcia';

  @override
  String get achievements_title => 'Osiągnięcia';

  @override
  String get ach_section_title => 'Cele i nagrody';

  @override
  String get ach_title_wins_50 => '50 zwycięstw';

  @override
  String get ach_title_no_mistakes => 'Żelazna wola';

  @override
  String get ach_title_streak_3days => '3-dniowa passa';

  @override
  String get ach_title_fast_solver => 'Błyskawicznie';

  @override
  String get ach_title_wins_100 => '100 zwycięstw';

  @override
  String get ach_desc_wins_50 => 'Wygraj 50 razy w trybie klasycznym';

  @override
  String get ach_desc_no_mistakes =>
      'Ukończ 3 gry z rzędu bez podpowiedzi i bez błędów';

  @override
  String get ach_desc_streak_3days => 'Graj codziennie przez 3 dni z rzędu';

  @override
  String get ach_desc_fast_solver => 'Rozwiąż sudoku w mniej niż 3 minuty';

  @override
  String get ach_desc_wins_100 => 'Wygraj 100 razy w trybie klasycznym';

  @override
  String get ach_status_finished => 'Ukończono';

  @override
  String ach_status_in_progress(int current) {
    return 'Ukończone gry: $current';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Zdobyto: $date';
  }

  @override
  String get ach_locked => 'Zablokowane';

  @override
  String get dailyStreak => 'Codzienna passa';

  @override
  String get selectDifficultyTitle => 'Wybierz poziom trudności';

  @override
  String get selectDifficultyDailyChallenge => 'Codzienne wyzwanie';

  @override
  String get playAction => 'Graj';

  @override
  String get championshipTitle => 'Mistrzostwo';

  @override
  String championshipScore(int score) {
    return 'Wynik $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Do następnego miejsca: $points pkt.';
  }

  @override
  String get youAreTop => 'Jesteś numerem 1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Zagraj w tę rundę, aby zwiększyć swoją szansę na mistrzostwo.';

  @override
  String get championshipRoundCompletedLabel => 'Ukończone';

  @override
  String totalScore(String score) {
    return 'Łączny wynik: $score';
  }

  @override
  String get meLabel => 'Ja';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Miejsce $rank. $name. $points punktów';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Moje miejsce $rank. $points punktów';
  }

  @override
  String get pointsShort => 'pkt';

  @override
  String get championshipAutoScroll => 'Automatycznie przewiń do mojej pozycji';

  @override
  String get bestLabel => 'To, co najlepsze';

  @override
  String get play => 'Gra';

  @override
  String get battleTitle => 'Bitwa';

  @override
  String battleWinRate(int count) {
    return 'Wygrane $count%';
  }

  @override
  String get battleYouLabel => 'Ty';

  @override
  String get battleVictoryTitle => 'Wygrałeś!';

  @override
  String get battleDefeatTitle => 'Przeciwnik skończył jako pierwszy';

  @override
  String battleDefeatMessage(String name) {
    return '$name rozwiązał zagadkę przed tobą.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Przegrałeś';

  @override
  String get battleExitToMainMenu => 'Główne menu';

  @override
  String get playerFlagSettingTitle => 'Flaga gracza';

  @override
  String get selectPlayerFlag => 'Wybierz swoją flagę';

  @override
  String get confirmFlagSelectionTitle => 'Potwierdź swoją flagę';

  @override
  String get confirmFlagSelectionMessage =>
      'Czy na pewno chcesz wybrać tę flagę? Możesz zmienić swoją flagę później w ustawieniach gry.';

  @override
  String get confirmFlagSelectionConfirm => 'Potwierdź';

  @override
  String get startAction => 'Start';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Poziom $level — $difficulty';
  }

  @override
  String get rankProgress => 'Postęp w rankingu';

  @override
  String rankLabel(int rank) {
    return 'Ranga $rank';
  }

  @override
  String get newGame => 'Nowa gra';

  @override
  String get continueGame => 'Kontynuuj grę';

  @override
  String get weeklyProgress => 'Tygodniowy postęp';

  @override
  String get rewardsTitle => 'Nagrody';

  @override
  String get rewardNoMistakesTitle => 'Ukończ wyzwanie bez błędów';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# kiery',
      one: '# serce',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Ukończ trzy wyzwania z rzędu';

  @override
  String get rewardUniqueTrophy => 'Unikalne trofeum';

  @override
  String get rewardSevenDayTitle => 'Utrzymaj 7-dniowe passa';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# gwiazdy',
      one: '# gwiazda',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Dzisiejsza łamigłówka';

  @override
  String get todayPuzzleDescription =>
      'Ukończ sudoku, aby zdobyć dodatkową nagrodę i utrzymać passę przy życiu.';

  @override
  String get continueAction => 'Kontynuuj';

  @override
  String get adMessage => 'Reklama: Znajdź ukryte przedmioty! Zagraj teraz.';

  @override
  String get adPlay => 'Odtwórz';

  @override
  String get undo => 'Cofnij';

  @override
  String get erase => 'Usuń';

  @override
  String get autoNotes => 'Automatyczne notatki';

  @override
  String get statusOn => 'WŁ.';

  @override
  String get statusOff => 'WYŁ.';

  @override
  String get notes => 'Notatki';

  @override
  String get hint => 'Wskazówka';

  @override
  String get undoAdTitle => 'Obejrzyj reklamę, aby cofnąć';

  @override
  String get undoAdDescription =>
      'Obejrzyj tę krótką reklamę, aby cofnąć ostatni ruch.';

  @override
  String undoAdCountdown(int seconds) {
    return 'Reklama kończy się za ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Obejrzyj reklamę, aby uzyskać podpowiedź';

  @override
  String get hintAdDescription =>
      'Obejrzyj tę krótką reklamę, aby zdobyć podpowiedź.';

  @override
  String hintAdCountdown(int seconds) {
    return 'Reklama kończy się za ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Obejrzyj reklamę, jak przywrócić czerwone serce';

  @override
  String get lifeAdDescription =>
      'Obejrzyj tę krótką reklamę, jak przywrócić czerwone serce i graj dalej.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'Reklama kończy się za ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Kombinacja ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Seria $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Premia za prędkość $time';
  }

  @override
  String comboX(int count) {
    return 'Kombo x$count';
  }

  @override
  String streakN(int count) {
    return 'Seria $count';
  }

  @override
  String speedBonus(String time) {
    return 'Premia za szybkość ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Brak aktywnej gry. Wróć do ekranu głównego.';

  @override
  String get victoryTitle => 'Gratulacje!';

  @override
  String victoryMessage(String time) {
    return 'Zagadka rozwiązana w $time.';
  }

  @override
  String get backToHome => 'Strona główna';

  @override
  String get playAnother => 'Zagraj ponownie';

  @override
  String get outOfLivesTitle => 'Skończyły Ci się serca';

  @override
  String get outOfLivesDescription =>
      'Przywróć jedno czerwone serce, aby kontynuować grę.';

  @override
  String get restoreLifeAction => 'Przywróć 1 czerwone serce';

  @override
  String get cancelAction => 'Anuluj';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get themeSectionTitle => 'Motyw';

  @override
  String get themeWhite => 'Klasyczny Jasny';

  @override
  String get themeCream => 'Kremowy';

  @override
  String get themeGreen => 'Miętowy';

  @override
  String get themeBlack => 'Ciemny';

  @override
  String get themePurple => 'Fioletowy Ciemny';

  @override
  String get themeFontSize => 'Rozmiar czcionki';

  @override
  String get fontSizeExtraSmall => 'Bardzo mały';

  @override
  String get fontSizeSmall => 'Mały';

  @override
  String get fontSizeMedium => 'Średni';

  @override
  String get fontSizeLarge => 'Duży';

  @override
  String get fontSizeExtraLarge => 'Extra duży';

  @override
  String get languageSectionTitle => 'Język';

  @override
  String get audioSectionTitle => 'Dźwięk i muzyka';

  @override
  String get soundsEffectsLabel => 'Efekty dźwiękowe';

  @override
  String get vibrationLabel => 'Wibracje';

  @override
  String get comboBadgesLabel => 'Odznaki kombinowane';

  @override
  String get comboHapticsLabel => 'Dotykowe odznaki';

  @override
  String get miscSectionTitle => 'Inne';

  @override
  String get howToPlayTitle => 'Jak grać';

  @override
  String get howToPlayRowRule =>
      'Każdy wiersz zawiera cyfry od 1 do 9 bez powtórzeń';

  @override
  String get howToPlayColumnRule =>
      'Każda kolumna ma cyfry od 1 do 9 bez powtórzeń';

  @override
  String get howToPlayBoxRule =>
      'Każde pole 3×3 zawiera cyfry od 1 do 9 bez powtórzeń';

  @override
  String get howToPlayFooter => 'Wypełnij każdą komórkę i wygraj!';

  @override
  String get howToPlayAction => 'Rozumiem';

  @override
  String get championshipLocalSection => 'Mistrzostwa (lokalne)';

  @override
  String get hideCompletedNumbersLabel => 'Ukryj ukończone cyfry';

  @override
  String get aboutApp => 'O';

  @override
  String versionLabel(String version) {
    return 'Wersja $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'angielski';

  @override
  String get languageRussian => 'Rosyjski';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Niemiecki';

  @override
  String get languageFrench => 'francuski';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'hiszpański';

  @override
  String get languageItalian => 'włoski';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'turecki';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'portugalski';

  @override
  String get languageIndonesian => 'Bahasa Indonezja';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Holandia';

  @override
  String get languageSwedish => 'Svenska';

  @override
  String get languageRomanian => 'Romański';

  @override
  String get languageCzech => 'Cesztina';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'hahahah тілі';

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
  String get languageSlovak => 'Słowenia';

  @override
  String get export => 'Eksport';

  @override
  String get import => 'Importuj';

  @override
  String get resetMyScore => 'Resetuj mój wynik';

  @override
  String get resetMyScoreConfirmation =>
      'Czy na pewno chcesz zresetować wynik? Tej akcji nie można cofnąć.';

  @override
  String get resetAction => 'Resetuj';

  @override
  String get regenerateOpponents => 'Regeneruj przeciwników';

  @override
  String get confirm => 'Potwierdź';

  @override
  String get cancel => 'Anuluj';

  @override
  String get done => 'Gotowe';

  @override
  String get privacyPolicyTitle => 'Polityka prywatności';

  @override
  String get privacyPolicyAccept => 'Akceptuję';

  @override
  String get privacyPolicyPrompt => 'Czy akceptujesz Politykę prywatności?';

  @override
  String get privacyPolicyLearnMore => 'Dowiedz się więcej →';

  @override
  String get privacyPolicyDecline => 'Odmawiam';

  @override
  String get privacyPolicyClose => 'Zamknij';

  @override
  String get privacyPolicyLoadError =>
      'Nie udało się załadować polityki prywatności. Spróbuj ponownie.';

  @override
  String get failed => 'Niepowodzenie';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rank #$current • +$delta do #$target';
  }

  @override
  String get statsTitle => 'Statystyki';

  @override
  String get statsGamesSection => 'Gry';

  @override
  String get statsGamesStarted => 'Gry rozpoczęte';

  @override
  String get statsGamesWon => 'Gry wygrane';

  @override
  String get statsWinRate => 'Wygrane stawka';

  @override
  String get statsFlawless => 'Bezbłędne wykończenia';

  @override
  String get statsTimeSection => 'Czas';

  @override
  String get statsBestTime => 'Najlepszy czas';

  @override
  String get statsAverageTime => 'Średni czas';

  @override
  String get statsStreakSection => 'Pasja';

  @override
  String get statsCurrentStreak => 'Obecna passa';

  @override
  String get statsBestStreak => 'Najlepsza passa';

  @override
  String get difficultyNovice => 'Nowicjusz';

  @override
  String get difficultyNoviceShort => 'Listopad';

  @override
  String get difficultyMedium => 'Średniozaawansowany';

  @override
  String get difficultyMediumShort => 'Zaawansowany';

  @override
  String get difficultyHigh => 'Zaawansowany';

  @override
  String get difficultyHighShort => 'Zaawansowany';

  @override
  String get difficultyExpert => 'Zaawansowany';

  @override
  String get difficultyExpertShort => 'Dośw.';

  @override
  String get difficultyMaster => 'Gospodarz';

  @override
  String get difficultyMasterShort => 'Mistrz.';

  @override
  String get ach_title_supermind => 'Superumysł';

  @override
  String get ach_desc_supermind =>
      'Wygraj na dowolnym poziomie trudności bez błędów ani podpowiedzi w czasie krótszym niż 2 minuty i 30 sekund';

  @override
  String get rateDialogTitle => 'Podoba Ci się gra? 💛';

  @override
  String get rateDialogSubtitle =>
      'Twoja ocena pomoże Sudoku stać się jeszcze lepszym!';

  @override
  String get rateDialogDismiss => 'Wyjdź';

  @override
  String get rateDialogConfirm => 'Tak, świetna!';
}
