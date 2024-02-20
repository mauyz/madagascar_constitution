import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    App(
      sharedPreferences: sharedPreferences,
    ),
  );
}
