// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Sudoku';

  @override
  String get navHome => 'Accueil';

  @override
  String get navDaily => 'Défi';

  @override
  String get navAchievements => 'Succès';

  @override
  String get achievements_title => 'Succès';

  @override
  String get ach_section_title => 'Objectifs et récompenses';

  @override
  String get ach_title_wins_50 => '50 victoires';

  @override
  String get ach_title_no_mistakes => 'Volonté d\'acier';

  @override
  String get ach_title_streak_3days => 'Série de 3 jours';

  @override
  String get ach_title_fast_solver => 'Vitesse éclair';

  @override
  String get ach_title_wins_100 => '100 victoires';

  @override
  String get ach_desc_wins_50 => 'Remportez 50 parties en mode Classique';

  @override
  String get ach_desc_no_mistakes =>
      'Terminez 3 parties d\'affilée sans indice ni erreur';

  @override
  String get ach_desc_streak_3days =>
      'Jouez chaque jour pendant 3 jours d\'affilée';

  @override
  String get ach_desc_fast_solver => 'Résolvez un sudoku en moins de 3 minutes';

  @override
  String get ach_desc_wins_100 => 'Remportez 100 parties en mode Classique';

  @override
  String get ach_status_finished => 'Terminé';

  @override
  String ach_status_in_progress(int current) {
    return '$current parties terminées';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return 'Obtenu le : $date';
  }

  @override
  String get ach_locked => 'Verrouillé';

  @override
  String get dailyStreak => 'Série quotidienne';

  @override
  String get selectDifficultyTitle => 'Choisissez la difficulté';

  @override
  String get selectDifficultyDailyChallenge => 'Défi quotidien';

  @override
  String get playAction => 'Jouer';

  @override
  String get championshipTitle => 'Championnat';

  @override
  String championshipScore(int score) {
    return 'Note $score';
  }

  @override
  String toNextPlace(int points) {
    return 'Jusqu\'à la prochaine place : $points pts';
  }

  @override
  String get youAreTop => 'Vous êtes n°1';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'Jouez cette manche pour booster votre parcours au championnat.';

  @override
  String get championshipRoundCompletedLabel => 'Terminé';

  @override
  String totalScore(String score) {
    return 'Score total : $score';
  }

  @override
  String get meLabel => 'Moi';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return 'Placez $rank. $name. $points points';
  }

  @override
  String yourPosition(int rank, String points) {
    return 'Ma place $rank. $points points';
  }

  @override
  String get pointsShort => 'points';

  @override
  String get championshipAutoScroll => 'Défilement auto vers ma position';

  @override
  String get bestLabel => 'Meilleur';

  @override
  String get play => 'Jouer';

  @override
  String get battleTitle => 'Duel';

  @override
  String battleWinRate(int count) {
    return 'Victoires $count%';
  }

  @override
  String get battleYouLabel => 'Toi';

  @override
  String get battleVictoryTitle => 'Tu as gagné !';

  @override
  String get battleDefeatTitle => 'L\'adversaire a gagné';

  @override
  String battleDefeatMessage(String name) {
    return '$name a résolu la grille avant toi.';
  }

  @override
  String get battleSimpleDefeatTitle => 'Vous avez perdu';

  @override
  String get battleExitToMainMenu => 'Menu principal';

  @override
  String get playerFlagSettingTitle => 'Drapeau du joueur';

  @override
  String get selectPlayerFlag => 'Choisis ton drapeau';

  @override
  String get confirmFlagSelectionTitle => 'Confirme ton drapeau';

  @override
  String get confirmFlagSelectionMessage =>
      'Es-tu sûr de vouloir choisir ce drapeau ? Tu pourras changer ton drapeau plus tard dans les paramètres du jeu.';

  @override
  String get confirmFlagSelectionConfirm => 'Confirmer';

  @override
  String get startAction => 'Commencer';

  @override
  String levelHeading(int level, String difficulty) {
    return 'Niveau $level — $difficulty';
  }

  @override
  String get rankProgress => 'Progression du rang';

  @override
  String rankLabel(int rank) {
    return 'Rang $rank';
  }

  @override
  String get newGame => 'Nouvelle partie';

  @override
  String get continueGame => 'Continuer la partie';

  @override
  String get weeklyProgress => 'Progression hebdomadaire';

  @override
  String get rewardsTitle => 'Récompenses';

  @override
  String get rewardNoMistakesTitle => 'Terminez le défi sans erreur';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# cœurs',
      one: '# cœur',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => 'Terminez trois défis d\'affilée';

  @override
  String get rewardUniqueTrophy => 'Trophée unique';

  @override
  String get rewardSevenDayTitle => 'Maintenez une série de 7 jours';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# étoiles',
      one: '# étoile',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => 'Casse-tête du jour';

  @override
  String get todayPuzzleDescription =>
      'Terminez le sudoku pour gagner une récompense supplémentaire et prolonger votre série.';

  @override
  String get continueAction => 'Continuer';

  @override
  String get adMessage =>
      'Annonce : Trouvez les objets cachés ! Jouez maintenant.';

  @override
  String get adPlay => 'Jouer';

  @override
  String get undo => 'Annuler';

  @override
  String get erase => 'Effacer';

  @override
  String get autoNotes => 'Notes auto';

  @override
  String get statusOn => 'ACTIF';

  @override
  String get statusOff => 'ARRÊT';

  @override
  String get notes => 'Remarques';

  @override
  String get hint => 'Indice';

  @override
  String get undoAdTitle => 'Voir une pub pour annuler';

  @override
  String get undoAdDescription =>
      'Regardez cette courte publicité pour annuler votre dernier coup.';

  @override
  String undoAdCountdown(int seconds) {
    return 'La pub se termine dans $seconds s';
  }

  @override
  String get hintAdTitle => 'Voir une pub pour obtenir un indice';

  @override
  String get hintAdDescription =>
      'Regardez cette courte publicité pour obtenir un indice.';

  @override
  String hintAdCountdown(int seconds) {
    return 'La pub se termine dans $seconds s';
  }

  @override
  String get lifeAdTitle => 'Voir une pub pour restaurer un cœur';

  @override
  String get lifeAdDescription =>
      'Regardez cette courte publicité pour restaurer un cœur rouge et continuer à jouer.';

  @override
  String lifeAdCountdown(int seconds) {
    return 'La pub se termine dans $seconds s';
  }

  @override
  String get gameScreenTitle => 'Sudoku';

  @override
  String combo_x(int count) {
    return 'Combo ×$count';
  }

  @override
  String streak_n(int count) {
    return 'Série $count';
  }

  @override
  String speed_bonus(String time) {
    return 'Bonus de vitesse $time';
  }

  @override
  String comboX(int count) {
    return 'Combinaison x$count';
  }

  @override
  String streakN(int count) {
    return 'Série $count';
  }

  @override
  String speedBonus(String time) {
    return 'Bonus de vitesse ($time)';
  }

  @override
  String get noActiveGameMessage =>
      'Aucune partie en cours. Revenez à l\'écran d\'accueil.';

  @override
  String get victoryTitle => 'Félicitations !';

  @override
  String victoryMessage(String time) {
    return 'Énigme résolue en $time.';
  }

  @override
  String get backToHome => 'Accueil';

  @override
  String get playAnother => 'Rejouer';

  @override
  String get outOfLivesTitle => 'Plus de cœurs';

  @override
  String get outOfLivesDescription => 'Restaurez un cœur rouge pour continuer.';

  @override
  String get restoreLifeAction => 'Restaurer 1 cœur rouge';

  @override
  String get cancelAction => 'Annuler';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get themeSectionTitle => 'Thème';

  @override
  String get themeWhite => 'Classique claire';

  @override
  String get themeCream => 'Crème';

  @override
  String get themeGreen => 'Menthe';

  @override
  String get themeBlack => 'Sombre';

  @override
  String get themePurple => 'Violette sombre';

  @override
  String get themeFontSize => 'Taille de police';

  @override
  String get fontSizeExtraSmall => 'Très petite';

  @override
  String get fontSizeSmall => 'Petite';

  @override
  String get fontSizeMedium => 'Moyenne';

  @override
  String get fontSizeLarge => 'Grande';

  @override
  String get fontSizeExtraLarge => 'Très grande';

  @override
  String get languageSectionTitle => 'Langue';

  @override
  String get audioSectionTitle => 'Son & musique';

  @override
  String get soundsEffectsLabel => 'Effets sonores';

  @override
  String get vibrationLabel => 'Vibrations';

  @override
  String get comboBadgesLabel => 'Badges combo';

  @override
  String get comboHapticsLabel => 'Retour haptique des badges';

  @override
  String get miscSectionTitle => 'Autre';

  @override
  String get howToPlayTitle => 'Comment jouer';

  @override
  String get howToPlayRowRule =>
      'Chaque ligne contient les chiffres de 1 à 9 sans doublons';

  @override
  String get howToPlayColumnRule =>
      'Chaque colonne contient les chiffres de 1 à 9 sans doublons';

  @override
  String get howToPlayBoxRule =>
      'Chaque carré 3×3 contient les chiffres de 1 à 9 sans doublons';

  @override
  String get howToPlayFooter => 'Remplis toutes les cases et tu gagnes !';

  @override
  String get howToPlayAction => 'Compris';

  @override
  String get championshipLocalSection => 'Championnat (local)';

  @override
  String get hideCompletedNumbersLabel => 'Masquer les chiffres utilisés';

  @override
  String get aboutApp => 'À propos';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get aboutLegalese => 'Nahreba UZOR Inc.';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languageRussian => 'russe';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'Allemand';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageChinese => 'Chine';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'espagnol';

  @override
  String get languageItalian => 'Italien';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'Turc';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languagePortuguese => 'Portugais';

  @override
  String get languageIndonesian => 'Bahasa Indonésie';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'Pays-Bas';

  @override
  String get languageSwedish => 'Suède';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageCzech => 'Ceština';

  @override
  String get languageFinnish => 'Suomi';

  @override
  String get languageKazakh => 'Қазақ тілі';

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
  String get languageSlovak => 'Slovénie';

  @override
  String get export => 'Exporter';

  @override
  String get import => 'Importer';

  @override
  String get resetMyScore => 'Réinitialiser mon score';

  @override
  String get resetMyScoreConfirmation =>
      'Voulez-vous vraiment réinitialiser le score ? Cette action est irréversible.';

  @override
  String get resetAction => 'Réinitialiser';

  @override
  String get regenerateOpponents => 'Régénérer les adversaires';

  @override
  String get confirm => 'Confirmer';

  @override
  String get cancel => 'Annuler';

  @override
  String get done => 'Terminé';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get privacyPolicyAccept => 'J\'accepte';

  @override
  String get privacyPolicyPrompt =>
      'Acceptez-vous la politique de confidentialité ?';

  @override
  String get privacyPolicyLearnMore => 'En savoir plus →';

  @override
  String get privacyPolicyDecline => 'Je refuse';

  @override
  String get privacyPolicyClose => 'Fermer';

  @override
  String get privacyPolicyLoadError =>
      'Impossible de charger la politique de confidentialité. Veuillez réessayer.';

  @override
  String get failed => 'Échec';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'Rang #$current • +$delta vers #$target';
  }

  @override
  String get statsTitle => 'Statistiques';

  @override
  String get statsGamesSection => 'Parties';

  @override
  String get statsGamesStarted => 'Parties lancées';

  @override
  String get statsGamesWon => 'Parties gagnées';

  @override
  String get statsWinRate => 'Taux de victoire';

  @override
  String get statsFlawless => 'Fin sans erreur';

  @override
  String get statsTimeSection => 'Temps';

  @override
  String get statsBestTime => 'Meilleur temps';

  @override
  String get statsAverageTime => 'Temps moyen';

  @override
  String get statsStreakSection => 'Série';

  @override
  String get statsCurrentStreak => 'Série actuelle';

  @override
  String get statsBestStreak => 'Meilleure série';

  @override
  String get difficultyNovice => 'Débutant';

  @override
  String get difficultyNoviceShort => 'Déb.';

  @override
  String get difficultyMedium => 'Intermédiaire';

  @override
  String get difficultyMediumShort => 'Inter.';

  @override
  String get difficultyHigh => 'Difficile';

  @override
  String get difficultyHighShort => 'Diff.';

  @override
  String get difficultyExpert => 'Expert';

  @override
  String get difficultyExpertShort => 'Exp.';

  @override
  String get difficultyMaster => 'Maître';

  @override
  String get difficultyMasterShort => 'Maît.';

  @override
  String get ach_title_supermind => 'Super-esprit';

  @override
  String get ach_desc_supermind =>
      'Remportez n\'importe quelle difficulté sans erreur ni indice en moins de 2 minutes 30';

  @override
  String get rateDialogTitle => 'Le jeu te plaît ? 💛';

  @override
  String get rateDialogSubtitle =>
      'Votre note aidera Sudoku à devenir encore meilleur !';

  @override
  String get rateDialogDismiss => 'Quitter';

  @override
  String get rateDialogConfirm => 'Oui, elle est géniale !';
}
