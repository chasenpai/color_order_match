import 'dart:io';

import 'package:color_order_match/util/admob_ids.dart';

class AdMobService {

  static String? get bannerAdUnitId {
    if(Platform.isAndroid) {
      return androidBannerTestId;
    }else if(Platform.isIOS) {
      return iosBannerTestId;
    }
    return null;
  }

  static String? get interstitialAdUnitId {
    if(Platform.isAndroid) {
      return androidInterstitialTestId;
    }else if(Platform.isIOS) {
      return iosInterstitialTestId;
    }
    return null;
  }

  static String? get lifeRewardedAdUnitId {
    if(Platform.isAndroid) {
      return androidLifeRewardedTestId;
    }else if(Platform.isIOS) {
      return iosLifeRewardedTestId;
    }
    return null;
  }

  static String? get hintRewardedAdUnitId {
    if(Platform.isAndroid) {
      return androidHintRewardedTestId;
    }else if(Platform.isIOS) {
      return iosHintRewardedTestId;
    }
    return null;
  }

}