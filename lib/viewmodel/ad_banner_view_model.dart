import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerViewModel extends ChangeNotifier {
  BannerAd? anchoredAdaptiveAd;

  AdBannerViewModel();

  Future<void> loadAd(double screenWith) async {
    await anchoredAdaptiveAd?.dispose();
    anchoredAdaptiveAd = null;
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      screenWith.truncate(),
    );

    if (size == null) {
      return;
    }

    anchoredAdaptiveAd = BannerAd(
      adUnitId: kDebugMode
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-4557811309342801/2331163218',
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          anchoredAdaptiveAd = ad as BannerAd;
          notifyListeners();
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint(error.toString());
          ad.dispose();
        },
      ),
    );
    return anchoredAdaptiveAd?.load();
  }
}
