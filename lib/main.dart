import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:madagascar_constitution/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    unawaited(MobileAds.instance.initialize());
  }
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    App(
      sharedPreferences: sharedPreferences,
    ),
  );
}
