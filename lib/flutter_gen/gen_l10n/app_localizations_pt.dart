// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Lar';

  @override
  String get navDaily => 'Desafio';

  @override
  String get navAchievements => 'Conquistas';

  @override
  String get achievements_title => 'Conquistas';

  @override
  String get ach_section_title => 'Metas e Recompensas';

  @override
  String get ach_title_wins_50 => '50 Vitórias';

  @override
  String get ach_title_no_mistakes => 'Vontade de ferro';

  @override
  String get ach_title_streak_3days => 'Sequência de 3 Dias';

  @override
  String get ach_title_fast_solver => 'Velocidade Relâmpago';

  @override
  String get ach_title_wins_100 => '100 Vitórias';

  @override
  String get ach_desc_wins_50 => 'Vença 50 vezes no modo Clássico';

  @override
  String get ach_desc_no_mistakes =>
      'Conclua 3 partidas seguidas sem dicas e sem erros';

  @override
  String get ach_desc_streak_3days => 'Jogue diariamente por 3 dias seguidos';

  @override
  String get ach_desc_fast_solver => 'Resolva um sudoku em menos de 3 minutos';

  @override
  String get ach_desc_wins_100 => 'Vença 100 vezes no modo Clássico';

  @override
  String get ach_status_finished => 'Concluído';

  @override
  String ach_status_in_progress(int current) {
    return '$current jogos concluídos';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Obtido em: $date';
  }

  @override
  String get ach_locked => 'Bloqueado';

  @override
  String get dailyStreak => 'Sequência diária';

  @override
  String get selectDifficultyTitle => 'Escolha a dificuldade';

  @override
  String get selectDifficultyDailyChallenge => 'Desafio diário';

  @override
  String get playAction => 'Jogar';

  @override
  String get championshipTitle => 'Campeonato';

  @override
  String championshipScore(int score) {
    return 'Pontuação $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Para o próximo lugar: $points pts';
  }

  @override
  String get youAreTop => 'Você é o número 1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Jogue esta rodada para aumentar seu desempenho no campeonato.';

  @override
  String get championshipRoundCompletedLabel => 'Concluído';

  @override
  String totalScore(String score) {
    return 'Pontuação total: $score';
  }

  @override
  String get meLabel => 'Eu';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Lugar $rank. $name. $points pontos';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Minha casa $rank. $points pontos';
  }

  @override
  String get pointsShort => 'pontos';

  @override
  String get championshipAutoScroll => 'Rolagem automática para minha posição';

  @override
  String get bestLabel => 'Melhor';

  @override
  String get play => 'Jogar';

  @override
  String get battleTitle => 'Batalha';

  @override
  String battleWinRate(int count) {
    return 'Vitórias $count%';
  }

  @override
  String get battleYouLabel => 'Você';

  @override
  String get battleVictoryTitle => 'Você venceu!';

  @override
  String get battleDefeatTitle => 'O oponente terminou primeiro';

  @override
  String battleDefeatMessage(String name) {
    return '$name resolveu o quebra-cabeça antes de você.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Você perdido';

  @override
  String get battleExitToMainMenu => 'Menu principal';

  @override
  String get playerFlagSettingTitle => 'Bandeira do jogador';

  @override
  String get selectPlayerFlag => 'Escolha sua bandeira';

  @override
  String get confirmFlagSelectionTitle => 'Confirme sua bandeira';

  @override
  String get confirmFlagSelectionMessage =>
      'Tem certeza de que deseja escolher esta bandeira? Você pode alterar sua bandeira posteriormente nas configurações do jogo.';

  @override
  String get confirmFlagSelectionConfirm => 'Confirmar';

  @override
  String get startAction => 'Iniciar';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Nível $level — $difficulty';
  }

  @override
  String get rankProgress => 'Progresso da classificação';

  @override
  String rankLabel(int rank) {
    return 'Classificação $rank';
  }

  @override
  String get newGame => 'Novo jogo';

  @override
  String get continueGame => 'Continuar o jogo';

  @override
  String get weeklyProgress => 'Progresso semanal';

  @override
  String get rewardsTitle => 'Recompensas';

  @override
  String get rewardNoMistakesTitle => 'Termine o desafio sem erros';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# corações',
      one: '# coração',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Complete três desafios seguidos';

  @override
  String get rewardUniqueTrophy => 'Troféu único';

  @override
  String get rewardSevenDayTitle => 'Mantenha um desafio de 7 dias sequência';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# estrelas',
      one: '# estrela',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Quebra-cabeça de hoje';

  @override
  String get todayPuzzleDescription =>
      'Termine o sudoku para ganhar uma recompensa extra e manter sua sequência viva.';

  @override
  String get continueAction => 'Continuar';

  @override
  String get adMessage => 'Anúncio: Encontre objetos escondidos! Jogue agora.';

  @override
  String get adPlay => 'Jogar';

  @override
  String get undo => 'Desfazer';

  @override
  String get erase => 'Apagar';

  @override
  String get autoNotes => 'Notas automáticas';

  @override
  String get statusOn => 'SOBRE';

  @override
  String get statusOff => 'DESLIGADO';

  @override
  String get notes => 'Notas';

  @override
  String get hint => 'Dica';

  @override
  String get undoAdTitle => 'Assista ao anúncio para desfazer';

  @override
  String get undoAdDescription =>
      'Assista a este pequeno anúncio para desfazer seu último movimento.';

  @override
  String undoAdCountdown(int seconds) {
    return 'O anúncio termina em ${seconds}s';
  }

  @override
  String get hintAdTitle => 'Assista ao anúncio para obter uma dica';

  @override
  String get hintAdDescription =>
      'Assista a este pequeno anúncio para ganhar uma dica.';

  @override
  String hintAdCountdown(int seconds) {
    return 'O anúncio termina em ${seconds}s';
  }

  @override
  String get lifeAdTitle => 'Assista ao anúncio para restaurar um coração';

  @override
  String get lifeAdDescription =>
      'Assista a este pequeno anúncio para restaurar um coração vermelho e continue jogando.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'O anúncio termina em ${seconds}s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combinação ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Sequência $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bônus de velocidade $time';
  }

  @override
  String comboX(int count) {
    return 'Combinação x$count';
  }

  @override
  String streakN(int count) {
    return 'Sequência $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bônus de velocidade ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Nenhum jogo ativo. Volte para a tela inicial.';

  @override
  String get victoryTitle => 'Parabéns!';

  @override
  String victoryMessage(String time) {
    return 'Quebra-cabeça resolvido em $time.';
  }

  @override
  String get backToHome => 'Lar';

  @override
  String get playAnother => 'Jogue novamente';

  @override
  String get outOfLivesTitle => 'Você está sem corações';

  @override
  String get outOfLivesDescription =>
      'Restaure um coração vermelho para continuar jogando.';

  @override
  String get restoreLifeAction => 'Restaure 1 coração vermelho';

  @override
  String get cancelAction => 'Cancelar';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get themeSectionTitle => 'Tema';

  @override
  String get themeWhite => 'Clássico Claro';

  @override
  String get themeCream => 'Creme';

  @override
  String get themeGreen => 'Hortelã';

  @override
  String get themeBlack => 'Escuro';

  @override
  String get themePurple => 'Roxo Escuro';

  @override
  String get themeFontSize => 'Tamanho da fonte';

  @override
  String get fontSizeExtraSmall => 'Extra pequeno';

  @override
  String get fontSizeSmall => 'Pequeno';

  @override
  String get fontSizeMedium => 'Médio';

  @override
  String get fontSizeLarge => 'Grande';

  @override
  String get fontSizeExtraLarge => 'Extra grande';

  @override
  String get languageSectionTitle => 'Idioma';

  @override
  String get audioSectionTitle => 'Som e música';

  @override
  String get soundsEffectsLabel => 'Efeitos sonoros';

  @override
  String get vibrationLabel => 'Vibração';

  @override
  String get comboBadgesLabel => 'Emblemas combinados';

  @override
  String get comboHapticsLabel => 'Sensibilidade ao toque do emblema';

  @override
  String get miscSectionTitle => 'Outros';

  @override
  String get howToPlayTitle => 'Como jogar';

  @override
  String get howToPlayRowRule =>
      'Cada linha tem os dígitos de 1 a 9 sem repetições';

  @override
  String get howToPlayColumnRule =>
      'Cada coluna tem o dígitos de 1 a 9 sem repetições';

  @override
  String get howToPlayBoxRule =>
      'Cada caixa 3×3 tem os dígitos de 1 a 9 sem repetições';

  @override
  String get howToPlayFooter => 'Preencha todas as células e você ganha!';

  @override
  String get howToPlayAction => 'Entendi';

  @override
  String get championshipLocalSection => 'Campeonato (local)';

  @override
  String get hideCompletedNumbersLabel => 'Ocultar concluído dígitos';

  @override
  String get aboutApp => 'Sobre';

  @override
  String versionLabel(String version) {
    return 'Versão $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageRussian => 'Russo';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Alemão';

  @override
  String get languageFrench => 'Francês';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'Adeus';

  @override
  String get languageGeorgian => 'O que é isso?';

  @override
  String get languageSpanish => 'Espanhol';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Turquia';

  @override
  String get languagePolish => 'Polaco';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get languageIndonesian => 'Bahasa Indonésia';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Holanda';

  @override
  String get languageSwedish => 'Sueca';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'O que é isso';

  @override
  String get languageBulgarian => 'Búlgaro';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageNepali => 'Adeus';

  @override
  String get languagePunjabi => 'Adeus';

  @override
  String get languageSwahili => 'Kiswahili';

  @override
  String get languageTamil => 'Mais';

  @override
  String get languageSlovak => 'Eslovena';

  @override
  String get export => 'Exportar';

  @override
  String get import => 'Importar';

  @override
  String get resetMyScore => 'Redefinir minha pontuação';

  @override
  String get resetMyScoreConfirmation =>
      'Tem certeza de que deseja zerar a pontuação? Esta ação não pode ser desfeita.';

  @override
  String get resetAction => 'Redefinir';

  @override
  String get regenerateOpponents => 'Regenerar oponentes';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get done => 'Concluído';

  @override
  String get privacyPolicyTitle => 'Política de Privacidade';

  @override
  String get privacyPolicyAccept => 'Aceito';

  @override
  String get privacyPolicyPrompt => 'Você aceita a Política de Privacidade?';

  @override
  String get privacyPolicyLearnMore => 'Saiba mais →';

  @override
  String get privacyPolicyDecline => 'Recuso';

  @override
  String get privacyPolicyClose => 'Fechar';

  @override
  String get privacyPolicyLoadError =>
      'Falha ao carregar a política de privacidade. Por favor, tente novamente.';

  @override
  String get failed => 'Falha';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Classificação #$current • +$delta a #$target';
  }

  @override
  String get statsTitle => 'Estatísticas';

  @override
  String get statsGamesSection => 'Jogos';

  @override
  String get statsGamesStarted => 'Jogos iniciados';

  @override
  String get statsGamesWon => 'Jogos ganhos';

  @override
  String get statsWinRate => 'Ganhar nota';

  @override
  String get statsFlawless => 'Acabamentos impecáveis';

  @override
  String get statsTimeSection => 'Tempo';

  @override
  String get statsBestTime => 'Melhor tempo';

  @override
  String get statsAverageTime => 'Tempo médio';

  @override
  String get statsStreakSection => 'Sequência';

  @override
  String get statsCurrentStreak => 'Sequência atual';

  @override
  String get statsBestStreak => 'Melhor sequência';

  @override
  String get difficultyNovice => 'Novato';

  @override
  String get difficultyNoviceShort => 'Novembro.';

  @override
  String get difficultyMedium => 'Intermediário';

  @override
  String get difficultyMediumShort => 'Internacional';

  @override
  String get difficultyHigh => 'Avançado';

  @override
  String get difficultyHighShort => 'Av.';

  @override
  String get difficultyExpert => 'Especialista';

  @override
  String get difficultyExpertShort => 'Esp.';

  @override
  String get difficultyMaster => 'Mestre';

  @override
  String get difficultyMasterShort => 'Sr.';

  @override
  String get ach_title_supermind => 'Supermente';

  @override
  String get ach_desc_supermind =>
      'Vença em qualquer dificuldade sem erros nem dicas em menos de 2 minutos e 30 segundos';

  @override
  String get rateDialogTitle => 'Está gostando do jogo? 💛';

  @override
  String get rateDialogSubtitle =>
      'Sua avaliação ajudará o Sudoku a ficar ainda melhor!';

  @override
  String get rateDialogDismiss => 'Sair';

  @override
  String get rateDialogConfirm => 'Sim, é incrível!';
}
