import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:madagascar_constitution/viewmodel/ad_banner_view_model.dart';
import 'package:provider/provider.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  late Orientation _currentOrientation;
  BannerAd? _bannerAd;

  @override
  void didChangeDependencies() {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    _currentOrientation = MediaQuery.of(context).orientation;
    context.read<AdBannerViewModel>().loadAd(deviceWidth);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Consumer<AdBannerViewModel>(
      builder: (context, adViewModel, __) {
        _bannerAd = adViewModel.anchoredAdaptiveAd;
        return OrientationBuilder(
          builder: (context, orientation) {
            if (_currentOrientation == orientation && _bannerAd != null) {
              return Container(
                color: Theme.of(context).colorScheme.onPrimary,
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              );
            }
            if (_currentOrientation != orientation) {
              _currentOrientation = orientation;
              context.read<AdBannerViewModel>().loadAd(deviceWidth);
            }
            return SizedBox.shrink();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
