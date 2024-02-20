import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const App({
    super.key,
    required this.sharedPreferences,
  });

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return Provider.value(
      value: sharedPreferences,
      child: MaterialApp.router(
        scrollBehavior: AppScrollBehavior(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            background: Colors.white,
            error: Colors.red,
            onTertiary: Colors.orange,
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.green,
            shadowColor: Colors.red,
            elevation: 5,
            foregroundColor: Colors.white,
          ),
        ),
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
