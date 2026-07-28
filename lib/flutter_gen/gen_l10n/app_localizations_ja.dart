// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '数独';

  @override
  String get navHome => 'ホーム';

  @override
  String get navDaily => 'チャレンジ';

  @override
  String get navAchievements => '実績';

  @override
  String get achievements_title => '実績';

  @override
  String get ach_section_title => '目標と報酬';

  @override
  String get ach_title_wins_50 => '50勝';

  @override
  String get ach_title_no_mistakes => '鉄の意志';

  @override
  String get ach_title_streak_3days => '3日連続';

  @override
  String get ach_title_fast_solver => '電光石火';

  @override
  String get ach_title_wins_100 => '100勝';

  @override
  String get ach_desc_wins_50 => 'クラシックモードで50回勝利する';

  @override
  String get ach_desc_no_mistakes => 'ヒントもミスもせずに3連勝しよう';

  @override
  String get ach_desc_streak_3days => '3日連続で毎日プレイする';

  @override
  String get ach_desc_fast_solver => '3分以内に数独を解く';

  @override
  String get ach_desc_wins_100 => 'クラシックモードで100回勝利する';

  @override
  String get ach_status_finished => '達成済み';

  @override
  String ach_status_in_progress(int current) {
    return '$currentゲームクリア';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return '獲得日：$date';
  }

  @override
  String get ach_locked => 'ロック中';

  @override
  String get dailyStreak => '連続日数';

  @override
  String get selectDifficultyTitle => '難易度を選択';

  @override
  String get selectDifficultyDailyChallenge => 'デイリーチャレンジ';

  @override
  String get playAction => 'プレイ';

  @override
  String get championshipTitle => 'チャンピオンシップ';

  @override
  String championshipScore(int score) {
    return 'スコア $score';
  }

  @override
  String toNextPlace(int points) {
    return '次の順位まで: $points pts';
  }

  @override
  String get youAreTop => 'あなたは第1位です';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      'このラウンドをプレイしてチャンピオンシップの戦いを加速させましょう。';

  @override
  String get championshipRoundCompletedLabel => '完了しました';

  @override
  String totalScore(String score) {
    return '合計スコア: $score';
  }

  @override
  String get meLabel => '自分';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return '順位 $rank。$name。$points ポイント';
  }

  @override
  String yourPosition(int rank, String points) {
    return '自分の順位 $rank。$points ポイント';
  }

  @override
  String get pointsShort => 'PTS';

  @override
  String get championshipAutoScroll => '私の立場に自動スクロールします';

  @override
  String get bestLabel => '最高';

  @override
  String get play => '遊ぶ';

  @override
  String get battleTitle => '戦い';

  @override
  String battleWinRate(int count) {
    return '勝利 $count%';
  }

  @override
  String get battleYouLabel => 'あなた';

  @override
  String get battleVictoryTitle => 'あなたの勝ち！';

  @override
  String get battleDefeatTitle => '相手が先にクリア';

  @override
  String battleDefeatMessage(String name) {
    return '$name があなたより先に数独を解きました。';
  }

  @override
  String get battleSimpleDefeatTitle => 'あなたは負けました';

  @override
  String get battleExitToMainMenu => 'メインメニューに戻る';

  @override
  String get playerFlagSettingTitle => 'プレイヤーの旗';

  @override
  String get selectPlayerFlag => '自分の旗を選択';

  @override
  String get confirmFlagSelectionTitle => 'フラグを確認';

  @override
  String get confirmFlagSelectionMessage =>
      'この旗を選択してもよろしいですか？後でゲーム設定で旗を変更できます。';

  @override
  String get confirmFlagSelectionConfirm => '確認する';

  @override
  String get startAction => '始める';

  @override
  String levelHeading(int level, String difficulty) {
    return 'レベル $level — $difficulty';
  }

  @override
  String get rankProgress => 'ランクの進捗';

  @override
  String rankLabel(int rank) {
    return 'ランク $rank';
  }

  @override
  String get newGame => '新しいゲーム';

  @override
  String get continueGame => 'ゲームを続けます';

  @override
  String get weeklyProgress => '毎週の進歩';

  @override
  String get rewardsTitle => '報酬';

  @override
  String get rewardNoMistakesTitle => '間違いなくチャレンジを終了します';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 心',
      one: '# 心臓',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => '連続して3つの課題を完了します';

  @override
  String get rewardUniqueTrophy => 'ユニークなトロフィー';

  @override
  String get rewardSevenDayTitle => '7日間の連勝を維持します';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 星',
      one: '# 星',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => '今日のパズル';

  @override
  String get todayPuzzleDescription => '数独を終えて、余分な報酬を獲得し、連勝を生かし続けます。';

  @override
  String get continueAction => '続く';

  @override
  String get adMessage => 'AD：隠されたオブジェクトを見つけてください！今すぐ遊んでください。';

  @override
  String get adPlay => '遊ぶ';

  @override
  String get undo => '元に戻します';

  @override
  String get erase => '消去します';

  @override
  String get autoNotes => 'オートノート';

  @override
  String get statusOn => 'の上';

  @override
  String get statusOff => 'オフ';

  @override
  String get notes => 'メモ';

  @override
  String get hint => 'ヒント';

  @override
  String get undoAdTitle => '元に戻すために広告を見てください';

  @override
  String get undoAdDescription => 'この短い広告を見て、最後の動きを元に戻してください。';

  @override
  String undoAdCountdown(int seconds) {
    return '広告は $seconds 秒後に終了';
  }

  @override
  String get hintAdTitle => 'ヒントを得るために広告を見てください';

  @override
  String get hintAdDescription => 'この短い広告を見てヒントを獲得してください。';

  @override
  String hintAdCountdown(int seconds) {
    return '広告は $seconds 秒後に終了';
  }

  @override
  String get lifeAdTitle => 'ハートを復元するために広告を見てください';

  @override
  String get lifeAdDescription => '赤いハートを復元してプレイを続けるために、この短い広告を視聴してください。';

  @override
  String lifeAdCountdown(int seconds) {
    return '広告は $seconds 秒後に終了';
  }

  @override
  String get gameScreenTitle => '数独';

  @override
  String combo_x(int count) {
    return 'コンボ ×$count';
  }

  @override
  String streak_n(int count) {
    return 'ストリーク $count';
  }

  @override
  String speed_bonus(String time) {
    return 'スピードボーナス $time';
  }

  @override
  String comboX(int count) {
    return 'コンボ x$count';
  }

  @override
  String streakN(int count) {
    return 'ストリーク $count';
  }

  @override
  String speedBonus(String time) {
    return 'スピードボーナス ($time)';
  }

  @override
  String get noActiveGameMessage => 'アクティブなゲームはありません。ホーム画面に戻ります。';

  @override
  String get victoryTitle => 'おめでとう！';

  @override
  String victoryMessage(String time) {
    return 'パズルを $time で解きました。';
  }

  @override
  String get backToHome => '家';

  @override
  String get playAnother => 'もう一度遊ぶ';

  @override
  String get outOfLivesTitle => 'あなたは心がありません';

  @override
  String get outOfLivesDescription => '1つの赤い心を回復してプレイし続けます。';

  @override
  String get restoreLifeAction => '1つの赤いハートを復元します';

  @override
  String get cancelAction => 'キャンセル';

  @override
  String get settingsTitle => '設定';

  @override
  String get themeSectionTitle => 'テーマ';

  @override
  String get themeWhite => '古典的な光';

  @override
  String get themeCream => 'クリーム';

  @override
  String get themeGreen => 'ミント';

  @override
  String get themeBlack => '暗い';

  @override
  String get themePurple => '紫色の暗い';

  @override
  String get themeFontSize => 'フォントサイズ';

  @override
  String get fontSizeExtraSmall => '余分な小';

  @override
  String get fontSizeSmall => '小さい';

  @override
  String get fontSizeMedium => '中くらい';

  @override
  String get fontSizeLarge => '大きい';

  @override
  String get fontSizeExtraLarge => '特大';

  @override
  String get languageSectionTitle => '言語';

  @override
  String get audioSectionTitle => 'サウンドと音楽';

  @override
  String get soundsEffectsLabel => '効果音';

  @override
  String get vibrationLabel => '振動';

  @override
  String get comboBadgesLabel => 'コンボバッジ';

  @override
  String get comboHapticsLabel => 'バッジの触覚フィードバック';

  @override
  String get miscSectionTitle => '他の';

  @override
  String get howToPlayTitle => '遊び方';

  @override
  String get howToPlayRowRule => '各行には1〜9の数字を重複なく入れます';

  @override
  String get howToPlayColumnRule => '各列には1〜9の数字を重複なく入れます';

  @override
  String get howToPlayBoxRule => '各3×3ブロックには1〜9の数字を重複なく入れます';

  @override
  String get howToPlayFooter => 'すべてのマスを埋めたらクリア！';

  @override
  String get howToPlayAction => 'わかった';

  @override
  String get championshipLocalSection => 'チャンピオンシップ（ローカル）';

  @override
  String get hideCompletedNumbersLabel => '完成した数字を非表示にします';

  @override
  String get aboutApp => 'について';

  @override
  String versionLabel(String version) {
    return 'バージョン $version';
  }

  @override
  String get aboutLegalese => 'ナフレバUZOR株式会社';

  @override
  String get languageEnglish => '英語';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => 'ドイツ語';

  @override
  String get languageFrench => 'フランセ';

  @override
  String get languageChinese => '中国語';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => 'スペイン語';

  @override
  String get languageItalian => 'イタリアーノ';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => 'テュルクチェ';

  @override
  String get languagePolish => 'ポルスキ';

  @override
  String get languagePortuguese => 'ポルトガル語';

  @override
  String get languageIndonesian => 'インドネシア語';

  @override
  String get languageVietnamese => 'ティエン・ヴィエット';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => 'オランダ';

  @override
  String get languageSwedish => 'スヴェンスカ';

  @override
  String get languageRomanian => 'ロマナ';

  @override
  String get languageCzech => 'チェシュティナ';

  @override
  String get languageFinnish => 'スオミ';

  @override
  String get languageKazakh => 'うーん';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => 'バハサ・メラユ';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => 'スワヒリ語';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => 'スロベンチナ';

  @override
  String get export => '輸出';

  @override
  String get import => '輸入';

  @override
  String get resetMyScore => 'スコアをリセットします';

  @override
  String get resetMyScoreConfirmation => 'スコアをリセットしたいですか？このアクションを元に戻すことはできません。';

  @override
  String get resetAction => 'リセット';

  @override
  String get regenerateOpponents => '敵を再生します';

  @override
  String get confirm => '確認する';

  @override
  String get cancel => 'キャンセル';

  @override
  String get done => '終わり';

  @override
  String get privacyPolicyTitle => 'プライバシーポリシー';

  @override
  String get privacyPolicyAccept => '同意します';

  @override
  String get privacyPolicyPrompt => 'プライバシーポリシーに同意しますか？';

  @override
  String get privacyPolicyLearnMore => '詳しく見る →';

  @override
  String get privacyPolicyDecline => '同意しません';

  @override
  String get privacyPolicyClose => '閉じる';

  @override
  String get privacyPolicyLoadError => 'プライバシーポリシーを読み込めませんでした。もう一度お試しください。';

  @override
  String get failed => '失敗した';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return 'ランク #$current • +$delta で #$targetへ';
  }

  @override
  String get statsTitle => '統計';

  @override
  String get statsGamesSection => 'ゲーム';

  @override
  String get statsGamesStarted => 'ゲームが始まりました';

  @override
  String get statsGamesWon => 'ゲームが勝った';

  @override
  String get statsWinRate => '勝利率';

  @override
  String get statsFlawless => '完璧な仕上げ';

  @override
  String get statsTimeSection => '時間';

  @override
  String get statsBestTime => '最高の時間';

  @override
  String get statsAverageTime => '平均時間';

  @override
  String get statsStreakSection => 'ストリーク';

  @override
  String get statsCurrentStreak => '現在のストリーク';

  @override
  String get statsBestStreak => 'ベストストリーク';

  @override
  String get difficultyNovice => '初心者';

  @override
  String get difficultyNoviceShort => '11月';

  @override
  String get difficultyMedium => '中級';

  @override
  String get difficultyMediumShort => 'int。';

  @override
  String get difficultyHigh => '高度な';

  @override
  String get difficultyHighShort => 'Adv。';

  @override
  String get difficultyExpert => '専門家';

  @override
  String get difficultyExpertShort => 'exp。';

  @override
  String get difficultyMaster => 'マスター';

  @override
  String get difficultyMasterShort => 'MST。';

  @override
  String get ach_title_supermind => 'スーパー頭脳';

  @override
  String get ach_desc_supermind => 'どの難易度でもミスやヒントなしで2分30秒以内にクリアしよう';

  @override
  String get rateDialogTitle => 'ゲームは気に入りましたか？ 💛';

  @override
  String get rateDialogSubtitle => 'あなたの評価で数独をもっと良くできます！';

  @override
  String get rateDialogDismiss => '終了';

  @override
  String get rateDialogConfirm => 'はい、最高！';
}
