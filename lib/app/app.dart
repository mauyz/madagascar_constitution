import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/viewmodel/theme_notifier.dart';
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
    return MultiProvider(
      providers: [
        Provider.value(
          value: sharedPreferences,
        ),
        Provider<Repository>(
          create: (_) => Repository(),
        ),
        ListenableProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (_, __, ___) {
          return MaterialApp.router(
            scrollBehavior: AppScrollBehavior(),
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                brightness: Brightness.light,
                shadow: Colors.red,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shadowColor: Colors.red,
                elevation: 5,
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                brightness: Brightness.dark,
                shadow: Colors.red,
              ),
              appBarTheme: const AppBarTheme(
                shadowColor: Colors.red,
                elevation: 5,
              ),
            ),
            themeMode: ThemeMode.values[sharedPreferences.getInt("theme") ?? 0],
            routerConfig: appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

final appRouter = AppRouter();

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
