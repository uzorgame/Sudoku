import 'dart:async';

import 'package:flutter/material.dart';

import 'ads/rewarded_service.dart';
import 'config/ads_config.dart';

class UndoRewardController extends ChangeNotifier {
  UndoRewardController({
    bool enabled = true,
  }) : _enabled = enabled {
    if (!_enabled || !kAdsEnabled) {
      _rewardAvailable = true;
      _isLoading = false;
      return;
    }

    _listener = _handleRewardedUpdate;
    _refreshAvailability();
    RewardedService.instance.addListener(_listener!);
  }

  final bool _enabled;
  bool _rewardAvailable = true;
  bool _showingReward = false;
  bool _isLoading = false;
  Future<bool>? _pendingRequest;
  VoidCallback? _listener;

  bool get isRewardEnabled => _enabled;

  bool get isRewardAvailable =>
      !_enabled ? true : _rewardAvailable && !_showingReward;

  bool get isRewardLoading =>
      !_enabled || !kAdsEnabled ? false : _isLoading || _showingReward;

  Future<bool> showReward(BuildContext context) {
    if (!_enabled || !kAdsEnabled) {
      return Future<bool>.value(true);
    }
    if (_pendingRequest != null) {
      return _pendingRequest!;
    }
    if (!isRewardAvailable) {
      _showAdUnavailableToast(context);
      return Future<bool>.value(false);
    }

    final completer = Completer<bool>();
    _pendingRequest = completer.future;
    _showingReward = true;
    _isLoading = true;
    notifyListeners();

    RewardedService.instance.showUndoAd(
      onReward: () {
        if (!completer.isCompleted) {
          completer.complete(true);
        }
      },
      onUnavailable: () {
        if (!completer.isCompleted) {
          completer.complete(false);
        }
        _showAdUnavailableToast(context);
      },
    );

    completer.future.whenComplete(() {
      _pendingRequest = null;
      final wasShowing = _showingReward;
      _showingReward = false;
      final changed = _refreshAvailability();
      if (changed || wasShowing) {
        notifyListeners();
      }
    });

    return completer.future;
  }

  bool _refreshAvailability() {
    if (!_enabled || !kAdsEnabled) {
      final changed = !_rewardAvailable || _isLoading;
      _rewardAvailable = true;
      _isLoading = false;
      return changed;
    }

    final available = _computeAvailability();
    final loading = _computeLoading();
    final changed =
        (_rewardAvailable != available) || (_isLoading != loading);
    _rewardAvailable = available;
    _isLoading = loading;
    return changed;
  }

  bool _computeAvailability() {
    final service = RewardedService.instance;
    return service.isUndoAdAvailable && !service.isUndoLoading;
  }

  bool _computeLoading() {
    final service = RewardedService.instance;
    return service.isUndoLoading || service.isUndoShowing;
  }

  void _handleRewardedUpdate() {
    if (!_enabled || !kAdsEnabled) {
      return;
    }

    final changed = _refreshAvailability();
    if (changed) {
      notifyListeners();
    }
  }

  void _showAdUnavailableToast(BuildContext context) {
    if (!context.mounted) {
      return;
    }
    const message = 'Реклама недоступна, спробуйте пізніше';
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  void dispose() {
    if (_listener != null) {
      RewardedService.instance.removeListener(_listener!);
    }
    super.dispose();
  }
}
