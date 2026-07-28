// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '스도쿠';

  @override
  String get navHome => '홈';

  @override
  String get navDaily => '도전';

  @override
  String get navAchievements => '업적';

  @override
  String get achievements_title => '업적';

  @override
  String get ach_section_title => '목표와 보상';

  @override
  String get ach_title_wins_50 => '50회 승리';

  @override
  String get ach_title_no_mistakes => '강철 의지';

  @override
  String get ach_title_streak_3days => '3일 연속';

  @override
  String get ach_title_fast_solver => '번개 스피드';

  @override
  String get ach_title_wins_100 => '100회 승리';

  @override
  String get ach_desc_wins_50 => '클래식 모드에서 50번 승리하세요';

  @override
  String get ach_desc_no_mistakes => '힌트와 실수 없이 연속 3판을 완료하세요';

  @override
  String get ach_desc_streak_3days => '3일 연속으로 매일 플레이하세요';

  @override
  String get ach_desc_fast_solver => '3분 이내에 스도쿠 한 판을 푸세요';

  @override
  String get ach_desc_wins_100 => '클래식 모드에서 100번 승리하세요';

  @override
  String get ach_status_finished => '완료';

  @override
  String ach_status_in_progress(int current) {
    return '완료한 게임: $current';
  }

  @override
  String ach_percent(int percent) {
    return '$percent%';
  }

  @override
  String ach_obtained_on(String date) {
    return '획득일: $date';
  }

  @override
  String get ach_locked => '잠김';

  @override
  String get dailyStreak => '일일 연속';

  @override
  String get selectDifficultyTitle => '난이도 선택';

  @override
  String get selectDifficultyDailyChallenge => '일일 도전';

  @override
  String get playAction => '플레이';

  @override
  String get championshipTitle => '챔피언십';

  @override
  String championshipScore(int score) {
    return '점수 $score';
  }

  @override
  String toNextPlace(int points) {
    return '다음 순위까지: $points pts';
  }

  @override
  String get youAreTop => '당신은 1위입니다';

  @override
  String get championshipRoundDescriptionPlaceholder =>
      '이 라운드를 플레이해 챔피언십 순위를 끌어올리세요.';

  @override
  String get championshipRoundCompletedLabel => '완료';

  @override
  String totalScore(String score) {
    return '총 점수: $score';
  }

  @override
  String get meLabel => '나';

  @override
  String leaderboardRow(int rank, String name, String points) {
    return '순위 $rank. $name. $points 포인트';
  }

  @override
  String yourPosition(int rank, String points) {
    return '내 순위 $rank. $points 포인트';
  }

  @override
  String get pointsShort => '포인트';

  @override
  String get championshipAutoScroll => '내 위치에 자동 스크롤';

  @override
  String get bestLabel => '최상의';

  @override
  String get play => '놀다';

  @override
  String get battleTitle => '전투';

  @override
  String battleWinRate(int count) {
    return '승리 $count%';
  }

  @override
  String get battleYouLabel => '당신';

  @override
  String get battleVictoryTitle => '당신의 승리!';

  @override
  String get battleDefeatTitle => '상대가 승리했어요';

  @override
  String battleDefeatMessage(String name) {
    return '$name가 당신보다 먼저 스도쿠를 풀었습니다.';
  }

  @override
  String get battleSimpleDefeatTitle => '패배했습니다';

  @override
  String get battleExitToMainMenu => '메인 메뉴로 나가기';

  @override
  String get playerFlagSettingTitle => '플레이어 깃발';

  @override
  String get selectPlayerFlag => '깃발을 선택하세요';

  @override
  String get confirmFlagSelectionTitle => '깃발 확인';

  @override
  String get confirmFlagSelectionMessage =>
      '이 깃발을 선택하시겠습니까? 나중에 게임 설정에서 깃발을 변경할 수 있습니다.';

  @override
  String get confirmFlagSelectionConfirm => '확인';

  @override
  String get startAction => '시작';

  @override
  String levelHeading(int level, String difficulty) {
    return '레벨 $level — $difficulty';
  }

  @override
  String get rankProgress => '순위 진행';

  @override
  String rankLabel(int rank) {
    return '랭크 $rank';
  }

  @override
  String get newGame => '새로운 게임';

  @override
  String get continueGame => '계속 게임';

  @override
  String get weeklyProgress => '주간 진행';

  @override
  String get rewardsTitle => '보상';

  @override
  String get rewardNoMistakesTitle => '실수없이 도전을 끝내십시오';

  @override
  String rewardExtraHearts(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 마음',
      one: '# 마음',
    );
    return '+$_temp0';
  }

  @override
  String get rewardThreeInRowTitle => '연속으로 세 가지 도전을 완료하십시오';

  @override
  String get rewardUniqueTrophy => '독특한 트로피';

  @override
  String get rewardSevenDayTitle => '7 일 행진을 유지하십시오';

  @override
  String rewardStars(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 별',
      one: '# 별',
    );
    return '+$_temp0';
  }

  @override
  String get todayPuzzle => '오늘의 퍼즐';

  @override
  String get todayPuzzleDescription => '스도쿠를 마치고 추가 보상을 받고 줄무늬를 유지하십시오.';

  @override
  String get continueAction => '계속하다';

  @override
  String get adMessage => 'AD : 숨겨진 물건을 찾으십시오! 지금 플레이하십시오.';

  @override
  String get adPlay => '놀다';

  @override
  String get undo => '끄르다';

  @override
  String get erase => '지우다';

  @override
  String get autoNotes => '자동 노트';

  @override
  String get statusOn => '에';

  @override
  String get statusOff => '끄다';

  @override
  String get notes => '메모';

  @override
  String get hint => '힌트';

  @override
  String get undoAdTitle => '취소 할 광고를 시청하십시오';

  @override
  String get undoAdDescription => '이 짧은 광고를보고 마지막 이동을 취소하십시오.';

  @override
  String undoAdCountdown(int seconds) {
    return '광고가 $seconds초 후 종료';
  }

  @override
  String get hintAdTitle => '힌트를 얻으려면 광고를 시청하세요';

  @override
  String get hintAdDescription => '짧은 광고를 시청하고 힌트를 얻으세요.';

  @override
  String hintAdCountdown(int seconds) {
    return '광고가 $seconds초 후 종료';
  }

  @override
  String get lifeAdTitle => '하트를 복원하려면 광고를 시청하세요';

  @override
  String get lifeAdDescription => '짧은 광고를 시청하여 빨간 하트를 복원하고 게임을 계속하세요.';

  @override
  String lifeAdCountdown(int seconds) {
    return '광고가 $seconds초 후 종료';
  }

  @override
  String get gameScreenTitle => '스도쿠';

  @override
  String combo_x(int count) {
    return '콤보 ×$count';
  }

  @override
  String streak_n(int count) {
    return '연속 $count';
  }

  @override
  String speed_bonus(String time) {
    return '속도 보너스 $time';
  }

  @override
  String comboX(int count) {
    return '콤보 x$count';
  }

  @override
  String streakN(int count) {
    return '연속 $count';
  }

  @override
  String speedBonus(String time) {
    return '속도 보너스 ($time)';
  }

  @override
  String get noActiveGameMessage => '능동적 인 게임이 없습니다. 홈 화면으로 돌아갑니다.';

  @override
  String get victoryTitle => '축하해요!';

  @override
  String victoryMessage(String time) {
    return '퍼즐을 $time에 해결했습니다.';
  }

  @override
  String get backToHome => '집';

  @override
  String get playAnother => '다시 플레이하십시오';

  @override
  String get outOfLivesTitle => '당신은 마음이 없습니다';

  @override
  String get outOfLivesDescription => '붉은 심장 하나를 회복하여 계속 연주하십시오.';

  @override
  String get restoreLifeAction => '1 개의 붉은 심장을 복원하십시오';

  @override
  String get cancelAction => '취소';

  @override
  String get settingsTitle => '설정';

  @override
  String get themeSectionTitle => '주제';

  @override
  String get themeWhite => '클래식 라이트';

  @override
  String get themeCream => '크림';

  @override
  String get themeGreen => '박하';

  @override
  String get themeBlack => '어두운';

  @override
  String get themePurple => '보라색 어두운';

  @override
  String get themeFontSize => '글꼴 크기';

  @override
  String get fontSizeExtraSmall => '더 작습니다';

  @override
  String get fontSizeSmall => '작은';

  @override
  String get fontSizeMedium => '중간';

  @override
  String get fontSizeLarge => '크기가 큰';

  @override
  String get fontSizeExtraLarge => '특대';

  @override
  String get languageSectionTitle => '언어';

  @override
  String get audioSectionTitle => '소리와 음악';

  @override
  String get soundsEffectsLabel => '음향 효과';

  @override
  String get vibrationLabel => '진동';

  @override
  String get comboBadgesLabel => '콤보 배지';

  @override
  String get comboHapticsLabel => '배지 햅틱';

  @override
  String get miscSectionTitle => '다른';

  @override
  String get howToPlayTitle => '플레이 방법';

  @override
  String get howToPlayRowRule => '각 가로줄에는 1부터 9까지 숫자가 중복 없이 들어갑니다';

  @override
  String get howToPlayColumnRule => '각 세로줄에는 1부터 9까지 숫자가 중복 없이 들어갑니다';

  @override
  String get howToPlayBoxRule => '각 3×3 칸에는 1부터 9까지 숫자가 중복 없이 들어갑니다';

  @override
  String get howToPlayFooter => '모든 칸을 채우면 승리예요!';

  @override
  String get howToPlayAction => '알겠어요';

  @override
  String get championshipLocalSection => '챔피언십 (지역)';

  @override
  String get hideCompletedNumbersLabel => '완성 된 숫자를 숨기십시오';

  @override
  String get aboutApp => '에 대한';

  @override
  String versionLabel(String version) {
    return '버전 $version';
  }

  @override
  String get aboutLegalese => '나레바 UZOR Inc.';

  @override
  String get languageEnglish => '영어';

  @override
  String get languageRussian => '러시아인';

  @override
  String get languageUkrainian => '모스크바';

  @override
  String get languageGerman => '독일어';

  @override
  String get languageFrench => '프랑세즈';

  @override
  String get languageChinese => '중국어';

  @override
  String get languageHindi => '힌두교';

  @override
  String get languageGeorgian => 'ქართული';

  @override
  String get languageSpanish => '스페인어';

  @override
  String get languageItalian => '이탈리아노';

  @override
  String get languageJapanese => '일본어';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageTurkish => '터키어';

  @override
  String get languagePolish => '폴스키';

  @override
  String get languagePortuguese => '포르투갈어';

  @override
  String get languageIndonesian => '인도네시아 바하사';

  @override
  String get languageVietnamese => '티엥 비엣';

  @override
  String get languageThai => 'ไท้';

  @override
  String get languageDutch => '네덜란드';

  @override
  String get languageSwedish => '스벤스카';

  @override
  String get languageRomanian => '로마나';

  @override
  String get languageCzech => '체슈티나';

  @override
  String get languageFinnish => '수오미';

  @override
  String get languageKazakh => 'Қазақ тілі';

  @override
  String get languageBulgarian => '불가리아어스키';

  @override
  String get languageMalay => '바하사 멜라유';

  @override
  String get languageNepali => '네팔';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageSwahili => '스와힐리어';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageSlovak => '슬로벤치나';

  @override
  String get export => '내보내다';

  @override
  String get import => '수입';

  @override
  String get resetMyScore => '내 점수를 재설정하십시오';

  @override
  String get resetMyScoreConfirmation => '점수를 재설정 하시겠습니까? 이 조치는 취소 할 수 없습니다.';

  @override
  String get resetAction => '다시 놓기';

  @override
  String get regenerateOpponents => '상대방을 재생합니다';

  @override
  String get confirm => '확인하다';

  @override
  String get cancel => '취소';

  @override
  String get done => '완료';

  @override
  String get privacyPolicyTitle => '개인정보 처리방침';

  @override
  String get privacyPolicyAccept => '동의합니다';

  @override
  String get privacyPolicyPrompt => '개인정보 처리방침에 동의하시겠습니까?';

  @override
  String get privacyPolicyLearnMore => '자세히 보기 →';

  @override
  String get privacyPolicyDecline => '동의하지 않음';

  @override
  String get privacyPolicyClose => '닫기';

  @override
  String get privacyPolicyLoadError => '개인정보 처리방침을 불러오지 못했습니다. 다시 시도해 주세요.';

  @override
  String get failed => '실패한';

  @override
  String rankBadgeChasing(int current, int delta, int target) {
    return '랭크 #$current • +$delta #$target까지';
  }

  @override
  String get statsTitle => '통계';

  @override
  String get statsGamesSection => '계략';

  @override
  String get statsGamesStarted => '게임이 시작되었습니다';

  @override
  String get statsGamesWon => '게임 우승';

  @override
  String get statsWinRate => '승리';

  @override
  String get statsFlawless => '완벽한 마무리';

  @override
  String get statsTimeSection => '시간';

  @override
  String get statsBestTime => '최고의 시간';

  @override
  String get statsAverageTime => '평균 시간';

  @override
  String get statsStreakSection => '줄';

  @override
  String get statsCurrentStreak => '현재 행진';

  @override
  String get statsBestStreak => '최고의 행진';

  @override
  String get difficultyNovice => '초심자';

  @override
  String get difficultyNoviceShort => '11 월';

  @override
  String get difficultyMedium => '중간';

  @override
  String get difficultyMediumShort => 'int.';

  @override
  String get difficultyHigh => '고급의';

  @override
  String get difficultyHighShort => 'adv.';

  @override
  String get difficultyExpert => '전문가';

  @override
  String get difficultyExpertShort => '특급.';

  @override
  String get difficultyMaster => '주인';

  @override
  String get difficultyMasterShort => 'MST.';

  @override
  String get ach_title_supermind => '슈퍼 마인드';

  @override
  String get ach_desc_supermind => '어떤 난이도든 실수나 힌트 없이 2분 30초 안에 클리어하세요';

  @override
  String get rateDialogTitle => '게임이 마음에 드나요? 💛';

  @override
  String get rateDialogSubtitle => '당신의 평가는 스도쿠가 더 좋아지는 데 도움이 돼요!';

  @override
  String get rateDialogDismiss => '나가기';

  @override
  String get rateDialogConfirm => '네, 최고예요!';
}
