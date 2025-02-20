import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:madagascar_constitution/viewmodel/ad_banner_view_model.dart';
import 'package:provider/provider.dart';

class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    context.read<AdBannerViewModel>().loadAd(
          deviceWidth,
          forceLoad: true,
        );
    return Consumer<AdBannerViewModel>(
      builder: (context, adViewModel, __) {
        final bannerAd = adViewModel.bannerAd;
        if (bannerAd == null) {
          return SizedBox.shrink();
        }
        return Container(
          color: Theme.of(context).colorScheme.onPrimary,
          width: bannerAd.size.width.toDouble(),
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(ad: bannerAd),
        );
      },
    );
  }
}
