import 'package:flutter/foundation.dart';

const bool kAdsEnabled = false;
const String kRewardedAdUnitId = 'ca-app-pub-6446977731818151/4266805840';
const String kRewardedTestAdUnitId =
    'ca-app-pub-6446977731818151/4266805840';

String get resolvedRewardedAdUnitId =>
    kReleaseMode ? kRewardedAdUnitId : kRewardedTestAdUnitId;
