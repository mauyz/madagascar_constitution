import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/view/widgets/app_title.dart';
import 'package:madagascar_constitution/viewmodel/data_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<DataModel>(
      create: (_) => DataModel(),
      child: AutoTabsRouter(
        routes: [
          ContentRoute(language: ConstitutionLanguage.mg),
          ContentRoute(language: ConstitutionLanguage.fr),
          ContentRoute(language: ConstitutionLanguage.en),
        ],
        builder: (buildContext, child) {
          final tabsRouter = AutoTabsRouter.of(buildContext);
          return Scaffold(
            appBar: AppBar(
              title: const AppTitle(),
              elevation: 5,
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
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Malagasy",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Français",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "English",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
