import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
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
