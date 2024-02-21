import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/widgets/app_title.dart';
import 'package:madagascar_constitution/view/widgets/tab_navigation_item.dart';
import 'package:madagascar_constitution/viewmodel/en_view_model.dart';
import 'package:madagascar_constitution/viewmodel/fr_view_model.dart';
import 'package:madagascar_constitution/viewmodel/mg_view_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.read<Repository>();
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
      ],
      child: AutoTabsRouter(
        routes: [
          TabContentRoute(language: ConstitutionLanguage.mg),
          TabContentRoute(language: ConstitutionLanguage.fr),
          TabContentRoute(language: ConstitutionLanguage.en),
        ],
        builder: (buildContext, child) {
          final tabsRouter = AutoTabsRouter.of(buildContext);
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
                      "Constitution de IVe République de Madagascar",
                    ),
                  )
                ],
              ),
            ),
            body: PageView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: tabsRouter.pageCount,
              onPageChanged: tabsRouter.setActiveIndex,
              itemBuilder: (_, __) => child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                TabNavigationItem(
                  language: ConstitutionLanguage.mg,
                ),
                TabNavigationItem(
                  language: ConstitutionLanguage.fr,
                ),
                TabNavigationItem(
                  language: ConstitutionLanguage.en,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
