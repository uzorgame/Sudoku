import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class RateAppService {
  RateAppService._();

  static final RateAppService instance = RateAppService._();

  static const String _kIosAppStoreId =
      String.fromEnvironment('IOS_APP_STORE_ID', defaultValue: '6759533894');

  static final Uri _iosStoreUrl = Uri.parse(
    'https://apps.apple.com/app/id$_kIosAppStoreId',
  );

  Future<bool> requestReview() async {
    var didRequestReview = false;
    try {
      await _openStoreListing();
      didRequestReview = true;
      await _persistHasRatedFlag();
    } catch (error, stackTrace) {
      debugPrint('Failed to open rating flow: $error');
      FlutterError.presentError(FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'RateAppService',
        context: ErrorDescription('while opening rating flow'),
      ));
    }

    return didRequestReview;
  }

  Future<void> _openStoreListing() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final launched = await launchUrl(
        _iosStoreUrl,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        throw StateError('Unable to open App Store listing');
      }
    }
  }

  Future<void> _persistHasRatedFlag() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasRated', true);
    } catch (error, stackTrace) {
      debugPrint('Failed to persist hasRated flag: $error');
      FlutterError.presentError(FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'RateAppService',
        context: ErrorDescription('while saving hasRated flag'),
      ));
    }
  }
}
