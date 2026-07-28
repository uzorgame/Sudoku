import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../config/ads_config.dart';

class RewardedService extends ChangeNotifier with WidgetsBindingObserver {
  RewardedService._() {
    WidgetsBinding.instance.addObserver(this);
  }

  static final RewardedService instance = RewardedService._();

  bool get isHintAdAvailable => false;
  bool get isHeartAdAvailable => false;
  bool get isUndoAdAvailable => false;

  bool get isHintLoading => false;
  bool get isHeartLoading => false;
  bool get isUndoLoading => false;

  bool get isHintShowing => false;
  bool get isHeartShowing => false;
  bool get isUndoShowing => false;

  Future<void> preloadHint() async {}

  Future<void> loadHeartAd() async {}

  Future<void> loadUndoAd() async {}

  Future<void> onSdkInitialized() async {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  Future<void> showHintAd({
    required VoidCallback onReward,
    required VoidCallback onUnavailable,
  }) async {
    if (!kAdsEnabled) {
      onReward();
      return;
    }
    onUnavailable();
  }

  Future<void> showHeartAd({
    required VoidCallback onReward,
    required VoidCallback onUnavailable,
  }) async {
    if (!kAdsEnabled) {
      onReward();
      return;
    }
    onUnavailable();
  }

  Future<void> showUndoAd({
    required VoidCallback onReward,
    required VoidCallback onUnavailable,
  }) async {
    if (!kAdsEnabled) {
      onReward();
      return;
    }
    onUnavailable();
  }

  void disposeRewardedAd() {}
}
