import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/pages/tab_content_page.dart';
import 'package:madagascar_constitution/view/widgets/app_title.dart';
import 'package:madagascar_constitution/view/widgets/tab_navigation_item.dart';
import 'package:madagascar_constitution/viewmodel/en_view_model.dart';
import 'package:madagascar_constitution/viewmodel/fr_view_model.dart';
import 'package:madagascar_constitution/viewmodel/mg_view_model.dart';
import 'package:madagascar_constitution/viewmodel/tab_search_view_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.read<Repository>();
    final languages = [
      "Malagasy",
      "Français",
      "Anglais",
    ];
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
        ListenableProvider<TabSearchViewModel>(
          create: (_) => TabSearchViewModel(),
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
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                  ),
                  child: const Text(
                    "CONSTITUTION DE LA QUATRIEME REPUBLIQUE",
                  ),
                )
              ],
            ),
          ),
          body: PageView(
            controller: pageController,
            physics: const AlwaysScrollableScrollPhysics(),
            onPageChanged: context.read<TabSearchViewModel>().goTo,
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
          bottomNavigationBar: Consumer<TabSearchViewModel>(
            builder: (_, tabViewModel, __) {
              return CurvedNavigationBar(
                buttonBackgroundColor: Colors.amberAccent,
                height: 75,
                index: tabViewModel.selected,
                onTap: (index) {
                  if (tabViewModel.selected != index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
                items: ConstitutionLanguage.values
                    .map(
                      (e) => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/${e.name}.svg',
                            height: 20,
                          ),
                          Text(
                            languages[tabViewModel.selected],
                          )
                        ],
                      ),
                    )
                    .toList(),
              );
            },
          ),
        );
      },
    );
  }
}
