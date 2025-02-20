import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerViewModel extends ChangeNotifier {
  BannerAd? _anchoredAdaptiveAd;

  AdBannerViewModel();

  BannerAd? get bannerAd => _anchoredAdaptiveAd;

  Future loadAd(
    double screenWith, {
    bool? forceLoad,
  }) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      screenWith.truncate(),
    );
    if ((_anchoredAdaptiveAd != null && forceLoad != true) || size == null) {
      return;
    }
    await _anchoredAdaptiveAd?.dispose();
    _anchoredAdaptiveAd = null;
    notifyListeners();
    return BannerAd(
      adUnitId: kDebugMode
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-4557811309342801/2331163218',
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          _anchoredAdaptiveAd = ad as BannerAd;
          notifyListeners();
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    _anchoredAdaptiveAd?.dispose();
    super.dispose();
  }
}
