import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/app_constants.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/pages/tab_content_page.dart';
import 'package:madagascar_constitution/view/widgets/app_title.dart';
import 'package:madagascar_constitution/view/widgets/bottom_nav_bar.dart';
import 'package:madagascar_constitution/view/widgets/bottom_nav_bar_item.dart';
import 'package:madagascar_constitution/view/widgets/custom_about.dart';
import 'package:madagascar_constitution/view/widgets/drawer_item.dart';
import 'package:madagascar_constitution/view/widgets/theme_radio.dart';
import 'package:madagascar_constitution/viewmodel/en_view_model.dart';
import 'package:madagascar_constitution/viewmodel/fr_view_model.dart';
import 'package:madagascar_constitution/viewmodel/mg_view_model.dart';
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
    final repository = context.read<Repository>();
    final pageController = PageController(
      initialPage: 0,
    );
    return MultiProvider(
      providers: [
        ListenableProvider<MgViewModel>(
          create: (_) => MgViewModel(
            repository: repository,
          )..loadConstitution(),
        ),
        ListenableProvider<FrViewModel>(
          create: (_) => FrViewModel(
            repository: repository,
          )..loadConstitution(),
        ),
        ListenableProvider<EnViewModel>(
          create: (_) => EnViewModel(
            repository: repository,
          )..loadConstitution(),
        ),
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
              title: const AppTitle(),
              elevation: 5,
              actions: [
                IconButton(
                  onPressed: () => context.router.push(
                    const SearchContentRoute(),
                  ),
                  icon: const Icon(
                    Icons.search,
                  ),
                )
              ],
            ),
            drawer: Drawer(
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
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
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
                          icon: const Icon(
                            Icons.dark_mode,
                            size: 20,
                          ),
                          title: "Changer le thème",
                          onTap: () {
                            Navigator.of(context).pop();
                            _changeTheme(context);
                          },
                        ),
                        if (!kIsWeb)
                          DrawerItem(
                            icon: const Icon(
                              Icons.share,
                              size: 20,
                            ),
                            title: "Partager l'application",
                            onTap: () {
                              Navigator.of(context).pop();
                              _shareApp();
                            },
                          ),
                        DrawerItem(
                          icon: const Icon(
                            Icons.mail,
                            size: 20,
                          ),
                          title: "Contacter",
                          onTap: () {
                            Navigator.of(context).pop();
                            _sendReport();
                          },
                        ),
                        if (!kIsWeb && !Platform.isLinux)
                          DrawerItem(
                            icon: const Icon(
                              Icons.star,
                              size: 20,
                            ),
                            title: "Noter l'application",
                            onTap: () {
                              Navigator.of(context).pop();
                              _openStore(context);
                            },
                          ),
                        DrawerItem(
                          icon: const Icon(
                            Icons.info,
                            size: 20,
                          ),
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
            ),
            body: PageView(
              controller: pageController,
              physics: const AlwaysScrollableScrollPhysics(),
              onPageChanged: context.read<TabNavigationViewModel>().goTo,
              children: const [
                TabContentPage(
                  key: PageStorageKey<String>('mg'),
                  language: ConstitutionLanguage.mg,
                ),
                TabContentPage(
                  key: PageStorageKey<String>('fr'),
                  language: ConstitutionLanguage.fr,
                ),
                TabContentPage(
                  key: PageStorageKey<String>('en'),
                  language: ConstitutionLanguage.en,
                ),
              ],
            ),
            bottomNavigationBar: Consumer<TabNavigationViewModel>(
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
        );
      },
    );
  }

  void _changeTheme(BuildContext context) async {
    final sharedPreferences = context.read<SharedPreferences>();
    updateTheme(int value) {
      sharedPreferences
          .setInt(
            "theme",
            value,
          )
          .then(
            (value) => context.read<ThemeNotifier>().notify(),
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
      applicationLegalese: AppConstants.aboutApp,
      copyright: AppConstants.copyright,
    );
  }
}
