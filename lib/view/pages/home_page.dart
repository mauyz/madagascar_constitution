import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/app_constants.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/view/screens/tab_content.dart';
import 'package:madagascar_constitution/view/widgets/app_title.dart';
import 'package:madagascar_constitution/view/widgets/bottom_nav_bar.dart';
import 'package:madagascar_constitution/view/widgets/bottom_nav_bar_item.dart';
import 'package:madagascar_constitution/view/widgets/custom_about.dart';
import 'package:madagascar_constitution/view/widgets/drawer_item.dart';
import 'package:madagascar_constitution/view/widgets/theme_radio.dart';
import 'package:madagascar_constitution/viewmodel/opacity_view_model.dart';
import 'package:madagascar_constitution/viewmodel/tab_navigation_view_model.dart';
import 'package:madagascar_constitution/viewmodel/theme_notifier.dart';
import 'package:open_store/open_store.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    final pageController = PageController(
      initialPage: 0,
    );
    return MultiProvider(
      providers: [
        ListenableProvider<TabNavigationViewModel>(
          create: (_) => TabNavigationViewModel(),
        ),
        ListenableProvider<OpacityViewModel>(
          create: (_) => OpacityViewModel(),
        ),
      ],
      builder: (context, _) {
        return TooltipVisibility(
          visible: false,
          child: Scaffold(
            appBar: AppBar(
              elevation: 1,
              leading: deviceWidth > 800
                  ? IconButton(
                      onPressed: null,
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 8.0,
                        ),
                        child: SvgPicture.asset(
                          "assets/mg.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : null,
              title: const AppTitle(),
              actions: [
                if (deviceWidth > 800) ...[
                  DrawerItem(
                    title: "Changer le thème",
                    onTap: () {
                      _changeTheme(context);
                    },
                  ),
                  if (!kIsWeb)
                    DrawerItem(
                      title: "Partager l'application",
                      onTap: () {
                        _shareApp();
                      },
                    ),
                  DrawerItem(
                    title: "Contacter",
                    onTap: () {
                      _sendReport();
                    },
                  ),
                  if (!kIsWeb && !Platform.isLinux)
                    DrawerItem(
                      title: "Noter l'application",
                      onTap: () {
                        _openStore(context);
                      },
                    ),
                  DrawerItem(
                    title: "A propos",
                    onTap: () {
                      _showAbout(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FilledButton.tonalIcon(
                      onPressed: () => context.router.push(
                        const SearchContentRoute(),
                      ),
                      icon: const Icon(
                        Icons.search,
                      ),
                      label: const Text("Rechercher"),
                    ),
                  ),
                ] else
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () => context.router.push(
                        const SearchContentRoute(),
                      ),
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                  )
              ],
            ),
            drawer: deviceWidth < 800
                ? Drawer(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DrawerHeader(
                          padding: EdgeInsets.zero,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/mg.svg",
                                fit: BoxFit.fill,
                              ),
                              Container(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                alignment: Alignment.center,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Constitution de la quatrième République de Madagascar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(2.0),
                            shrinkWrap: true,
                            children: [
                              DrawerItem(
                                icon: Icons.dark_mode,
                                title: "Changer le thème",
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _changeTheme(context);
                                },
                              ),
                              if (!kIsWeb)
                                DrawerItem(
                                  icon: Icons.share,
                                  title: "Partager l'application",
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    _shareApp();
                                  },
                                ),
                              DrawerItem(
                                icon: Icons.mail,
                                title: "Contacter",
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _sendReport();
                                },
                              ),
                              if (!kIsWeb && !Platform.isLinux)
                                DrawerItem(
                                  icon: Icons.rate_review,
                                  title: "Noter l'application",
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    _openStore(context);
                                  },
                                ),
                              DrawerItem(
                                icon: Icons.info,
                                title: "A propos",
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _showAbout(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
            body: PageView(
              controller: pageController,
              physics: const AlwaysScrollableScrollPhysics(),
              onPageChanged: context.read<TabNavigationViewModel>().goTo,
              children: const [
                TabContent(
                  key: PageStorageKey<String>('mg'),
                  language: ConstitutionLanguage.mg,
                ),
                TabContent(
                  key: PageStorageKey<String>('fr'),
                  language: ConstitutionLanguage.fr,
                ),
                TabContent(
                  key: PageStorageKey<String>('en'),
                  language: ConstitutionLanguage.en,
                ),
              ],
            ),
            bottomNavigationBar: IntrinsicHeight(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: deviceWidth > 800 ? 30.0 : 10.0,
                ),
                alignment: Alignment.center,
                child: IntrinsicWidth(
                  child: Consumer<TabNavigationViewModel>(
                    builder: (_, tabViewModel, __) {
                      return BottomNavBar(
                        currentItem: tabViewModel.selected,
                        onTap: (index) {
                          if (tabViewModel.selected != index) {
                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          }
                        },
                        items: ConstitutionLanguage.values.indexed.map(
                          (e) {
                            return BottomNavBarItem(
                              icon: SvgPicture.asset(
                                'assets/${e.$2.name}.svg',
                                height: 20,
                                width: 20,
                              ),
                              label: switch (e.$2) {
                                ConstitutionLanguage.mg => "Malagasy",
                                ConstitutionLanguage.fr => "Français",
                                ConstitutionLanguage.en => "Anglais",
                              },
                            );
                          },
                        ).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _changeTheme(BuildContext context) {
    final sharedPreferences = context.read<SharedPreferences>();
    final themeNotifier = context.read<ThemeNotifier>();
    updateTheme(int value) {
      sharedPreferences
          .setInt(
            "theme",
            value,
          )
          .then(
            (value) => themeNotifier.notify(),
          );
    }

    showDialog(
      context: context,
      builder: (context) {
        final groupValue = sharedPreferences.getInt("theme") ?? 0;

        return AlertDialog(
          alignment: Alignment.center,
          contentPadding: const EdgeInsets.all(20.0),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Changer le thème",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                ThemeRadio<int>(
                  value: 0,
                  groupValue: groupValue,
                  title: "Système",
                  onChanged: updateTheme,
                ),
                ThemeRadio<int>(
                  value: 1,
                  groupValue: groupValue,
                  title: "Clair",
                  onChanged: updateTheme,
                ),
                ThemeRadio<int>(
                  value: 2,
                  groupValue: groupValue,
                  title: "Sombre",
                  onChanged: updateTheme,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Fermer',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _shareApp() async {
    await Share.share(_getAppLink());
  }

  String _getAppLink() {
    if (Platform.isIOS) {
      //TODO
    }
    if (Platform.isLinux) {
      ///TODO
    }
    if (Platform.isWindows) {
      ///TODO
    }
    if (Platform.isMacOS) {
      ///TODO
    }
    return AppConstants.playStoreLink;
  }

  void _sendReport() async {
    final email = Email(recipients: [
      AppConstants.mauyzEmail,
    ], cc: [
      AppConstants.baroovEmail,
    ]);
    try {
      await FlutterEmailSender.send(email);
    } catch (_) {
      final uri = Uri(
        scheme: 'mailto',
        path: AppConstants.mauyzEmail,
      );
      launchUrlString(uri.toString());
    }
  }

  void _openStore(BuildContext context) async {
    try {
      await OpenStore.instance.open(
        androidAppBundleId: AppConstants.androidId,
      );
    } catch (_) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (buildContext) {
            return AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              content: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "L'application n'est pas encore disponible pour cette plateforme !",
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: const Text("Fermer"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void _showAbout(BuildContext context) {
    showCustomAboutDialog(
      context: context,
      applicationName: AppConstants.appTitle,
      applicationVersion: AppConstants.appVersion,
      applicationIcon: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.asset(
            'assets/mg.svg',
            height: 20,
          ),
        ),
      ),
      applicationLegalese: "${AppConstants.aboutApp}"
          "\n\nContact du développeur : ${AppConstants.mauyzEmail}",
      copyright: AppConstants.copyright,
    );
  }
}
