// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '数独';

  @override
  String get navHome => '首页';

  @override
  String get navDaily => '挑战';

  @override
  String get navAchievements => '成就';

  @override
  String get achievements_title => '成就';

  @override
  String get ach_section_title => '目标与奖励';

  @override
  String get ach_title_wins_50 => '50 场胜利';

  @override
  String get ach_title_no_mistakes => '钢铁意志';

  @override
  String get ach_title_streak_3days => '连续 3 天';

  @override
  String get ach_title_fast_solver => '闪电通关';

  @override
  String get ach_title_wins_100 => '100 场胜利';

  @override
  String get ach_desc_wins_50 => '在经典模式下赢得 50 场比赛';

  @override
  String get ach_desc_no_mistakes => '连续完成3局且不使用提示、不出现失误';

  @override
  String get ach_desc_streak_3days => '连续 3 天每天游玩';

  @override
  String get ach_desc_fast_solver => '在 3 分钟内完成一局数独';

  @override
  String get ach_desc_wins_100 => '在经典模式下赢得 100 场比赛';

  @override
  String get ach_status_finished => '已完成';

  @override
  String ach_status_in_progress(int current) {
    return '$current 局已完成';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return '获得时间：$date';
  }

  @override
  String get ach_locked => '未解锁';

  @override
  String get dailyStreak => '连续天数';

  @override
  String get selectDifficultyTitle => '选择难度';

  @override
  String get selectDifficultyDailyChallenge => '每日挑战';

  @override
  String get playAction => '游玩';

  @override
  String get championshipTitle => '锦标赛';

  @override
  String championshipScore(int score) {
    return '得分 $score';
  }

  @override
  String toNextPlace(int points) {
    return '距下一名还差 $points 分';
  }

  @override
  String get youAreTop => '您是第 1 名';

  @override
  String get championshipRoundDescriptionPlaceholder => '进行这一轮，推动你的锦标赛征程。';

  @override
  String get championshipRoundCompletedLabel => '已完成';

  @override
  String totalScore(String score) {
    return '总得分：$score';
  }

  @override
  String get meLabel => '我';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return '第 $rank 名。$name。$points 分';
  }

  @override
  String yourPosition(int rank, String points) {
    return '我的名次 $rank。$points 分';
  }

  @override
  String get pointsShort => '分';

  @override
  String get championshipAutoScroll => '自动滚动到我的位置';

  @override
  String get bestLabel => '最佳成绩';

  @override
  String get play => '游玩';

  @override
  String get battleTitle => '对战';

  @override
  String battleWinRate(int count) {
    return '胜场 $count%';
  }

  @override
  String get battleYouLabel => '你';

  @override
  String get battleVictoryTitle => '你赢了！';

  @override
  String get battleDefeatTitle => '对手获胜';

  @override
  String battleDefeatMessage(String name) {
    return '$name 比你更快完成了数独。';
  }

  @override
  String get battleSimpleDefeatTitle => '你输了';

  @override
  String get battleExitToMainMenu => '返回主菜单';

  @override
  String get playerFlagSettingTitle => '玩家旗帜';

  @override
  String get selectPlayerFlag => '选择你的旗帜';

  @override
  String get confirmFlagSelectionTitle => '确认你的旗帜';

  @override
  String get confirmFlagSelectionMessage => '你确定要选择这面旗帜吗？你可以稍后在游戏设置中更改你的旗帜。';

  @override
  String get confirmFlagSelectionConfirm => '确认';

  @override
  String get startAction => '开始';

  @override
  String levelHeading(int level, String difficulty) {
    return '等级 $level — $difficulty';
  }

  @override
  String get rankProgress => '段位进度';

  @override
  String rankLabel(int rank) {
    return '段位 $rank';
  }

  @override
  String get newGame => '新游戏';

  @override
  String get continueGame => '继续游戏';

  @override
  String get weeklyProgress => '每周进度';

  @override
  String get rewardsTitle => '奖励';

  @override
  String get rewardNoMistakesTitle => '无错误完成挑战';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 心',
      one: '# 心',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => '连续完成三次挑战';

  @override
  String get rewardUniqueTrophy => '专属奖杯';

  @override
  String get rewardSevenDayTitle => '保持 7 天连胜';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 星星',
      one: '# 星星',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => '今日谜题';

  @override
  String get todayPuzzleDescription => '完成数独即可获得额外奖励并保持连胜。';

  @override
  String get continueAction => '继续';

  @override
  String get adMessage => '广告：寻找隐藏物品！立即游玩。';

  @override
  String get adPlay => '游玩';

  @override
  String get undo => '撤销';

  @override
  String get erase => '清除';

  @override
  String get autoNotes => '自动笔记';

  @override
  String get statusOn => '开启';

  @override
  String get statusOff => '关闭';

  @override
  String get notes => '笔记';

  @override
  String get hint => '提示';

  @override
  String get undoAdTitle => '观看广告以撤销';

  @override
  String get undoAdDescription => '观看短广告即可撤销上一步。';

  @override
  String undoAdCountdown(int seconds) {
    return '广告将在 $seconds 秒后结束';
  }

  @override
  String get hintAdTitle => '观看广告以获得提示';

  @override
  String get hintAdDescription => '观看短广告即可获得提示。';

  @override
  String hintAdCountdown(int seconds) {
    return '广告将在 $seconds 秒后结束';
  }

  @override
  String get lifeAdTitle => '观看广告以恢复爱心';

  @override
  String get lifeAdDescription => '观看这段短广告以恢复一个红心并继续游戏。';

  @override
  String lifeAdCountdown(int seconds) {
    return '广告将在 $seconds 秒后结束';
  }

  @override
  String get gameScreenTitle => '数独';

  @override
  String combo_x(int count) {
    return '连击 ×$count';
  }

  @override
  String streak_n(int count) {
    return '连胜 $count';
  }

  @override
  String speed_bonus(String time) {
    return '极速奖励 $time';
  }

  @override
  String comboX(int count) {
    return '连击 x$count';
  }

  @override
  String streakN(int count) {
    return '连胜 $count';
  }

  @override
  String speedBonus(String time) {
    return '极速奖励 ($time)';
  }

  @override
  String get noActiveGameMessage => '没有进行中的游戏。返回主界面。';

  @override
  String get victoryTitle => '恭喜！';

  @override
  String victoryMessage(String time) {
    return '在 $time 内完成谜题。';
  }

  @override
  String get backToHome => '首页';

  @override
  String get playAnother => '再来一局';

  @override
  String get outOfLivesTitle => '心已用完';

  @override
  String get outOfLivesDescription => '恢复一个红心以继续游戏。';

  @override
  String get restoreLifeAction => '恢复 1 个红心';

  @override
  String get cancelAction => '取消';

  @override
  String get settingsTitle => '设置';

  @override
  String get themeSectionTitle => '主题';

  @override
  String get themeWhite => '经典浅色';

  @override
  String get themeCream => '奶油色';

  @override
  String get themeGreen => '薄荷色';

  @override
  String get themeBlack => '深色';

  @override
  String get themePurple => '暗紫色';

  @override
  String get themeFontSize => '字体大小';

  @override
  String get fontSizeExtraSmall => '特小';

  @override
  String get fontSizeSmall => '小';

  @override
  String get fontSizeMedium => '中';

  @override
  String get fontSizeLarge => '大';

  @override
  String get fontSizeExtraLarge => '特大';

  @override
  String get languageSectionTitle => '语言';

  @override
  String get audioSectionTitle => '声音与音乐';

  @override
  String get soundsEffectsLabel => '音效';

  @override
  String get vibrationLabel => '震动';

  @override
  String get comboBadgesLabel => '连击徽章';

  @override
  String get comboHapticsLabel => '徽章触感反馈';

  @override
  String get miscSectionTitle => '其他';

  @override
  String get howToPlayTitle => '怎么玩';

  @override
  String get howToPlayRowRule => '每一行都要填上1到9且不重复';

  @override
  String get howToPlayColumnRule => '每一列都要填上1到9且不重复';

  @override
  String get howToPlayBoxRule => '每个3×3宫都要填上1到9且不重复';

  @override
  String get howToPlayFooter => '填满所有格子就赢了！';

  @override
  String get howToPlayAction => '知道了';

  @override
  String get championshipLocalSection => '锦标赛（本地）';

  @override
  String get hideCompletedNumbersLabel => '隐藏已用数字';

  @override
  String get aboutApp => '关于';

  @override
  String versionLabel(String version) {
    return '版本 $version';
  }

  @override
  String get aboutLegalese => '纳雷巴·乌佐尔公司';

  @override
  String get languageEnglish => '英语';

  @override
  String get languageRussian => '俄罗斯';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get languageGerman => '德语';

  @override
  String get languageFrench => '法国人';

  @override
  String get languageChinese => '中文';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => '西班牙语';

  @override
  String get languageItalian => '意大利人';

  @override
  String get languageJapanese => '日本语';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => '图尔克切';

  @override
  String get languagePolish => '波尔斯基';

  @override
  String get languagePortuguese => '葡萄牙语';

  @override
  String get languageIndonesian => '印度尼西亚语';

  @override
  String get languageVietnamese => '越南';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageDutch => '荷兰';

  @override
  String get languageSwedish => '斯文斯卡';

  @override
  String get languageRomanian => '罗马语';

  @override
  String get languageCzech => '切什蒂纳';

  @override
  String get languageFinnish => '芬兰';

  @override
  String get languageKazakh => '哈萨哈提利';

  @override
  String get languageBulgarian => 'Български';

  @override
  String get languageMalay => '马来语';

  @override
  String get languageNepali => 'नेपाली';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => '斯瓦希里语';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => '斯洛文尼亚';

  @override
  String get export => '导出';

  @override
  String get import => '导入';

  @override
  String get resetMyScore => '重置我的得分';

  @override
  String get resetMyScoreConfirmation => '确定要重置得分吗？此操作无法撤销。';

  @override
  String get resetAction => '重置';

  @override
  String get regenerateOpponents => '重新生成对手';

  @override
  String get confirm => '确认';

  @override
  String get cancel => '取消';

  @override
  String get done => '完成';

  @override
  String get privacyPolicyTitle => '隐私政策';

  @override
  String get privacyPolicyAccept => '我同意';

  @override
  String get privacyPolicyPrompt => '您是否接受隐私政策？';

  @override
  String get privacyPolicyLearnMore => '了解详情 →';

  @override
  String get privacyPolicyDecline => '我不同意';

  @override
  String get privacyPolicyClose => '关闭';

  @override
  String get privacyPolicyLoadError => '无法加载隐私政策。请重试。';

  @override
  String get failed => '失败';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return '第 $current 名 • 还差 $delta 分到第 $target 名';
  }

  @override
  String get statsTitle => '统计';

  @override
  String get statsGamesSection => '对局';

  @override
  String get statsGamesStarted => '开始的对局';

  @override
  String get statsGamesWon => '获胜的对局';

  @override
  String get statsWinRate => '胜率';

  @override
  String get statsFlawless => '完美通关';

  @override
  String get statsTimeSection => '时间';

  @override
  String get statsBestTime => '最佳时间';

  @override
  String get statsAverageTime => '平均时间';

  @override
  String get statsStreakSection => '连胜';

  @override
  String get statsCurrentStreak => '当前连胜';

  @override
  String get statsBestStreak => '最高连胜';

  @override
  String get difficultyNovice => '新手';

  @override
  String get difficultyNoviceShort => '新手';

  @override
  String get difficultyMedium => '中等';

  @override
  String get difficultyMediumShort => '中等';

  @override
  String get difficultyHigh => '困难';

  @override
  String get difficultyHighShort => '困难';

  @override
  String get difficultyExpert => '专家';

  @override
  String get difficultyExpertShort => '专家';

  @override
  String get difficultyMaster => '大师';

  @override
  String get difficultyMasterShort => '大师';

  @override
  String get ach_title_supermind => '超级头脑';

  @override
  String get ach_desc_supermind => '在任意难度下不犯错、不用提示，于2分30秒内获胜';

  @override
  String get rateDialogTitle => '喜欢这个游戏吗？💛';

  @override
  String get rateDialogSubtitle => '您的评分将帮助 Sudoku 变得更好！';

  @override
  String get rateDialogDismiss => '退出';

  @override
  String get rateDialogConfirm => '是的，太棒了！';
}
