class GameAnalytics {
  GameAnalytics._();

  static bool _enabled = false;

  static void setEnabled(bool value) {
    _enabled = value;
  }

  static void logGameExit() {
    _logEvent('game_exit');
  }

  static void logRewardRequest(String placement) {
    _logEvent('reward_request', {
      'placement': placement,
    });
  }

  static void logAdRequest(String placement) {
    _logEvent('ad_request', {
      'placement': placement,
    });
  }

  static void logAdLoaded(String placement) {
    _logEvent('ad_loaded', {
      'placement': placement,
    });
  }

  static void logAdFailed(
    String placement,
    int code, {
    int? attempt,
    String? message,
  }) {
    _logEvent('ad_failed', {
      'placement': placement,
      'code': code,
      if (attempt != null) 'attempt': attempt,
      if (message != null) 'message': message,
      'timestamp_ms': DateTime.now().millisecondsSinceEpoch,
    });
  }

  static void logRewardedPreloadSuccess({required int attempt}) {
    _logEvent('ad_preload_success', {
      'placement': 'rewarded',
      'attempt': attempt,
      'timestamp_ms': DateTime.now().millisecondsSinceEpoch,
    });
  }

  static void logRewardedPreloadRetryReset({required String reason}) {
    _logEvent('ad_preload_retry_reset', {
      'placement': 'rewarded',
      'reason': reason,
      'timestamp_ms': DateTime.now().millisecondsSinceEpoch,
    });
  }

  static void logRewardedPreloadSkipped({required String reason}) {
    _logEvent('ad_preload_skipped', {
      'placement': 'rewarded',
      'reason': reason,
      'timestamp_ms': DateTime.now().millisecondsSinceEpoch,
    });
  }

  static void logAdShow(String placement) {
    _logEvent('ad_show', {
      'placement': placement,
    });
  }

  static void logPuzzleStart({required String difficulty}) {
    _logEvent('puzzle_start', {
      'difficulty': difficulty,
    });
  }

  static void logPuzzleWin() {
    _logEvent('game_win');
  }

  static void logPuzzleLose({
    required String difficulty,
    required int durationMs,
    required int mistakes,
  }) {
    _logEvent('lose', {
      'difficulty': difficulty,
      'duration_ms': durationMs,
      'mistakes': mistakes,
    });
  }

  static void logHintUsed({required String source}) {
    _logEvent('hint_used', {
      'source': source,
    });
  }

  static void logUndoUsed({required String source}) {
    _logEvent('undo_used', {
      'source': source,
    });
  }

  static void logHeartRestore({required String source}) {
    _logEvent('heart_restore', {
      'source': source,
    });
  }

  static void _logEvent(String name, [Map<String, Object?>? parameters]) {
    if (!_enabled) {
      return;
    }
  }
}
