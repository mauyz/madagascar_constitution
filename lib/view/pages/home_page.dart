import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/pages/tab_content_page.dart';
import 'package:madagascar_constitution/view/widgets/app_title.dart';
import 'package:madagascar_constitution/view/widgets/bottom_nav_bar.dart';
import 'package:madagascar_constitution/view/widgets/bottom_nav_bar_item.dart';
import 'package:madagascar_constitution/view/widgets/custom_about.dart';
import 'package:madagascar_constitution/view/widgets/drawer_item.dart';
import 'package:madagascar_constitution/viewmodel/en_view_model.dart';
import 'package:madagascar_constitution/viewmodel/fr_view_model.dart';
import 'package:madagascar_constitution/viewmodel/mg_view_model.dart';
import 'package:madagascar_constitution/viewmodel/opacity_view_model.dart';
import 'package:madagascar_constitution/viewmodel/tab_navigation_view_model.dart';
import 'package:provider/provider.dart';

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
        return Scaffold(
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
            child: ListView(
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
                        color: Theme.of(context).primaryColor.withOpacity(0.9),
                        alignment: Alignment.center,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Constitution de la quatrième république de Madagascar",
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
                DrawerItem(
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                  ),
                  title: "Partager l'application",
                  onTap: () {},
                ),
                DrawerItem(
                  icon: const Icon(
                    Icons.mail,
                    size: 20,
                  ),
                  title: "Contacter les développeurs",
                  onTap: () {},
                ),
                DrawerItem(
                  icon: const Icon(
                    Icons.star,
                    size: 20,
                  ),
                  title: "Noter l'application",
                  onTap: () {},
                ),
                DrawerItem(
                  icon: const Icon(
                    Icons.info,
                    size: 20,
                  ),
                  title: "A propos",
                  onTap: () {
                    showCustomAboutDialog(
                      context: context,
                      applicationName: "Constitution de Madagascar",
                      applicationVersion: "v1.0.3",
                      applicationIcon: CircleAvatar(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            'assets/mg.svg',
                            height: 20,
                          ),
                        ),
                      ),
                      applicationLegalese:
                          "Constitution de la 4e république de Madagascar"
                          " APRES LE REFERENDUM DU 17 NOVEMBRE 2010,\narrêtés"
                          " par la Haute Cour Constitutionnelle le 6 décembre 2010"
                          " [version publiée par l'Assemblée Nationale le 7 mai 2014].\n"
                          "Source 1: https://www.assemblee-nationale.mg/wp-content/uploads/2019/08/Constitution-4eme-R%C3%A9publique_mg.pdf\n"
                          "Source 2: http://www.mondemalgache.org/bins/lalampanorenana",
                      copyright:
                          "Copyright Baroov, Mauyz ${DateTime.now().year}",
                    );
                  },
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
        );
      },
    );
  }
}
