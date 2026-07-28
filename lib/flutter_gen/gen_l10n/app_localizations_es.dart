// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Sudokus';

  @override
  String get navHome => 'Inicio';

  @override
  String get navDaily => 'Desafío';

  @override
  String get navAchievements => 'Logros';

  @override
  String get achievements_title => 'Logros';

  @override
  String get ach_section_title => 'Metas y Recompensas';

  @override
  String get ach_title_wins_50 => '50 Victorias';

  @override
  String get ach_title_no_mistakes => 'Voluntad de hierro';

  @override
  String get ach_title_streak_3days => 'Racha de 3 Días';

  @override
  String get ach_title_fast_solver => 'Velocidad Relámpago';

  @override
  String get ach_title_wins_100 => '100 Victorias';

  @override
  String get ach_desc_wins_50 => 'Gana 50 veces en el modo Clásico';

  @override
  String get ach_desc_no_mistakes =>
      'Completa 3 partidas seguidas sin pistas ni errores';

  @override
  String get ach_desc_streak_3days => 'Juega a diario durante 3 días seguidos';

  @override
  String get ach_desc_fast_solver => 'Resuelve un sudoku en menos de 3 minutos';

  @override
  String get ach_desc_wins_100 => 'Gana 100 veces en el modo Clásico';

  @override
  String get ach_status_finished => 'Completado';

  @override
  String ach_status_in_progress(int current) {
    return '$current partidas completadas';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Conseguido: $date';
  }

  @override
  String get ach_locked => 'Bloqueado';

  @override
  String get dailyStreak => 'Racha diaria';

  @override
  String get selectDifficultyTitle => 'Elige la dificultad';

  @override
  String get selectDifficultyDailyChallenge => 'Desafío diario';

  @override
  String get playAction => 'Jugar';

  @override
  String get championshipTitle => 'Campeonato';

  @override
  String championshipScore(int score) {
    return 'Puntuación $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Hasta el siguiente puesto: $points pts';
  }

  @override
  String get youAreTop => 'Eres el nº 1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Juega esta ronda para impulsar tu carrera en el campeonato.';

  @override
  String get championshipRoundCompletedLabel => 'Terminado';

  @override
  String totalScore(String score) {
    return 'Puntuación total: $score';
  }

  @override
  String get meLabel => 'Yo';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Puesto $rank. $name. $points puntos';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Mi puesto $rank. $points puntos';
  }

  @override
  String get pointsShort => 'puntos';

  @override
  String get championshipAutoScroll =>
      'Desplazamiento automático a mi posición';

  @override
  String get bestLabel => 'Mejor';

  @override
  String get play => 'Jugar';

  @override
  String get battleTitle => 'Batalla';

  @override
  String battleWinRate(int count) {
    return 'Victorias $count%';
  }

  @override
  String get battleYouLabel => 'Tú';

  @override
  String get battleVictoryTitle => '¡Ganaste!';

  @override
  String get battleDefeatTitle => 'El oponente ganó';

  @override
  String battleDefeatMessage(String name) {
    return '$name completó el sudoku antes que tú.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Has perdido';

  @override
  String get battleExitToMainMenu => 'Menú principal';

  @override
  String get playerFlagSettingTitle => 'Bandera del jugador';

  @override
  String get selectPlayerFlag => 'Elige tu bandera';

  @override
  String get confirmFlagSelectionTitle => 'Confirma tu bandera';

  @override
  String get confirmFlagSelectionMessage =>
      '¿Estás seguro de que quieres elegir esta bandera? Podrás cambiar tu bandera más adelante en los ajustes del juego.';

  @override
  String get confirmFlagSelectionConfirm => 'Confirmar';

  @override
  String get startAction => 'Comenzar';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Nivel $level — $difficulty';
  }

  @override
  String get rankProgress => 'Rango de progreso';

  @override
  String rankLabel(int rank) {
    return 'Rango $rank';
  }

  @override
  String get newGame => 'Nuevo juego';

  @override
  String get continueGame => 'Continuar el juego';

  @override
  String get weeklyProgress => 'Progreso semanal';

  @override
  String get rewardsTitle => 'Recompensas';

  @override
  String get rewardNoMistakesTitle => 'Termina el desafío sin errores';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# copas',
      one: '# corazón',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Completar tres desafíos seguidos';

  @override
  String get rewardUniqueTrophy => 'Trofeo único';

  @override
  String get rewardSevenDayTitle => 'Mantener una racha de 7 días';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# estrellas',
      one: '# estrella',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Rompecabezas de hoy';

  @override
  String get todayPuzzleDescription =>
      'Termine el sudoku para ganar una recompensa adicional y mantener su racha viva.';

  @override
  String get continueAction => 'Continuar';

  @override
  String get adMessage => 'AD: ¡Encuentra objetos ocultos! Juega ahora.';

  @override
  String get adPlay => 'Jugar';

  @override
  String get undo => 'Deshacer';

  @override
  String get erase => 'Borrar';

  @override
  String get autoNotes => 'Notas automáticas';

  @override
  String get statusOn => 'EN';

  @override
  String get statusOff => 'APAGADO';

  @override
  String get notes => 'Notas';

  @override
  String get hint => 'Pista';

  @override
  String get undoAdTitle => 'Mira el anuncio para deshacer';

  @override
  String get undoAdDescription =>
      'Mire este breve anuncio para deshacer su último movimiento.';

  @override
  String undoAdCountdown(int seconds) {
    return 'El anuncio termina en $seconds s';
  }

  @override
  String get hintAdTitle => 'Mira el anuncio para obtener una pista';

  @override
  String get hintAdDescription =>
      'Mire este breve anuncio para conseguir una pista.';

  @override
  String hintAdCountdown(int seconds) {
    return 'El anuncio termina en $seconds s';
  }

  @override
  String get lifeAdTitle => 'Mira el anuncio para restaurar un corazón';

  @override
  String get lifeAdDescription =>
      'Mira este breve anuncio para restaurar un corazón rojo y seguir jugando.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'El anuncio termina en $seconds s';
  }

  @override
  String get gameScreenTitle => 'Sudokus';

  @override
  String combo_x(int count) {
    return 'Combinado ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Racha $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bonificación de velocidad $time';
  }

  @override
  String comboX(int count) {
    return 'Combinado x$count';
  }

  @override
  String streakN(int count) {
    return 'Racha $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonificación de velocidad ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'No hay juego activo. Regrese a la pantalla de inicio.';

  @override
  String get victoryTitle => '¡Felicidades!';

  @override
  String victoryMessage(String time) {
    return 'Rompecabezas resuelto en $time.';
  }

  @override
  String get backToHome => 'Hogar';

  @override
  String get playAnother => 'Volver a jugar';

  @override
  String get outOfLivesTitle => 'Estás fuera de corazón';

  @override
  String get outOfLivesDescription =>
      'Restaurar un corazón rojo para seguir jugando.';

  @override
  String get restoreLifeAction => 'Restaurar 1 corazón rojo';

  @override
  String get cancelAction => 'Cancelar';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get themeSectionTitle => 'Tema';

  @override
  String get themeWhite => 'Luz clásica';

  @override
  String get themeCream => 'Crema';

  @override
  String get themeGreen => 'Menta';

  @override
  String get themeBlack => 'Oscuro';

  @override
  String get themePurple => 'Morado oscuro';

  @override
  String get themeFontSize => 'Tamaño de fuente';

  @override
  String get fontSizeExtraSmall => 'Extra pequeño';

  @override
  String get fontSizeSmall => 'Pequeño';

  @override
  String get fontSizeMedium => 'Medio';

  @override
  String get fontSizeLarge => 'Grande';

  @override
  String get fontSizeExtraLarge => 'Extra grande';

  @override
  String get languageSectionTitle => 'Idioma';

  @override
  String get audioSectionTitle => 'Sonido y música';

  @override
  String get soundsEffectsLabel => 'Efectos sonoros';

  @override
  String get vibrationLabel => 'Vibración';

  @override
  String get comboBadgesLabel => 'Insignias de combo';

  @override
  String get comboHapticsLabel => 'Háptica de insignias';

  @override
  String get miscSectionTitle => 'Otro';

  @override
  String get howToPlayTitle => 'Cómo jugar';

  @override
  String get howToPlayRowRule =>
      'Cada fila tiene los números del 1 al 9 sin repetir';

  @override
  String get howToPlayColumnRule =>
      'Cada columna tiene los números del 1 al 9 sin repetir';

  @override
  String get howToPlayBoxRule =>
      'Cada cuadrado 3×3 tiene los números del 1 al 9 sin repetir';

  @override
  String get howToPlayFooter => '¡Rellena todas las casillas y gana!';

  @override
  String get howToPlayAction => 'Entendido';

  @override
  String get championshipLocalSection => 'Campeonato (local)';

  @override
  String get hideCompletedNumbersLabel => 'Ocultar dígitos completos';

  @override
  String get aboutApp => 'Acerca de';

  @override
  String versionLabel(String version) {
    return 'Versión $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageRussian => 'ruso';

  @override
  String get languageUkrainian => 'Ucrania';

  @override
  String get languageGerman => 'alemán';

  @override
  String get languageFrench => 'francés';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageItalian => 'italiano';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'turco';

  @override
  String get languagePolish => 'Polonia';

  @override
  String get languagePortuguese => 'portugués';

  @override
  String get languageIndonesian => 'Bahasa Indonesia';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Países Bajos';

  @override
  String get languageSwedish => 'Svenská';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'ы тілі';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'kiswahili';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'Eslovenia';

  @override
  String get export => 'Exportar';

  @override
  String get import => 'Importar';

  @override
  String get resetMyScore => 'Restablecer mi puntaje';

  @override
  String get resetMyScoreConfirmation =>
      '¿Estás seguro de que quieres restablecer el puntaje? Esta acción no se puede deshacer.';

  @override
  String get resetAction => 'Reiniciar';

  @override
  String get regenerateOpponents => 'Regenerar oponentes';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get done => 'Hecho';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get privacyPolicyAccept => 'Acepto';

  @override
  String get privacyPolicyPrompt => '¿Aceptas la Política de privacidad?';

  @override
  String get privacyPolicyLearnMore => 'Más información →';

  @override
  String get privacyPolicyDecline => 'Rechazo';

  @override
  String get privacyPolicyClose => 'Cerrar';

  @override
  String get privacyPolicyLoadError =>
      'No se pudo cargar la política de privacidad. Inténtalo de nuevo.';

  @override
  String get failed => 'Fallido';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rango #$current • +$delta hacia #$target';
  }

  @override
  String get statsTitle => 'Estadística';

  @override
  String get statsGamesSection => 'Juegos';

  @override
  String get statsGamesStarted => 'Comenzaron los juegos';

  @override
  String get statsGamesWon => 'Juegos ganados';

  @override
  String get statsWinRate => 'Tasa de ganancia';

  @override
  String get statsFlawless => 'Acabados impecables';

  @override
  String get statsTimeSection => 'Tiempo';

  @override
  String get statsBestTime => 'Mejor tiempo';

  @override
  String get statsAverageTime => 'Tiempo promedio';

  @override
  String get statsStreakSection => 'Racha';

  @override
  String get statsCurrentStreak => 'Racha actual';

  @override
  String get statsBestStreak => 'Mejor racha';

  @override
  String get difficultyNovice => 'Principiante';

  @override
  String get difficultyNoviceShort => 'Nov.';

  @override
  String get difficultyMedium => 'Intermedio';

  @override
  String get difficultyMediumShort => 'Inter.';

  @override
  String get difficultyHigh => 'Avanzado';

  @override
  String get difficultyHighShort => 'Avz.';

  @override
  String get difficultyExpert => 'Experto';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Maestro';

  @override
  String get difficultyMasterShort => 'MST.';

  @override
  String get ach_title_supermind => 'Supermente';

  @override
  String get ach_desc_supermind =>
      'Gana en cualquier dificultad sin errores ni pistas en menos de 2 minutos y 30 segundos';

  @override
  String get rateDialogTitle => '¿Te gusta el juego? 💛';

  @override
  String get rateDialogSubtitle =>
      '¡Tu valoración ayudará a que Sudoku sea aún mejor!';

  @override
  String get rateDialogDismiss => 'Salir';

  @override
  String get rateDialogConfirm => '¡Sí, es genial!';
}
