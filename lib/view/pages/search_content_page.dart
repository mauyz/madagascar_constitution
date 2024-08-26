import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/screens/search_result_content.dart';
import 'package:madagascar_constitution/view/widgets/back_to_home_button.dart';
import 'package:madagascar_constitution/view/widgets/bottom_nav_bar.dart';
import 'package:madagascar_constitution/view/widgets/bottom_nav_bar_item.dart';
import 'package:madagascar_constitution/viewmodel/opacity_view_model.dart';
import 'package:madagascar_constitution/viewmodel/search_view_model.dart';
import 'package:madagascar_constitution/viewmodel/tab_navigation_view_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SearchContentPage extends StatelessWidget {
  const SearchContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return ListenableProvider<SearchViewModel>(
      create: (_) => SearchViewModel(
        repository: context.read<Repository>(),
      ),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            leading: kIsWeb
                ? const BackToHomeButton()
                : IconButton(
                    onPressed: () {
                      context.router.maybePop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
            title: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 500),
              child: IntrinsicWidth(
                stepWidth: 500,
                child: TextField(
                  autofocus: true,
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    hintText: "Rechercher",
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                        context.read<SearchViewModel>().searchText('');
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    context.read<SearchViewModel>().searchText(value);
                  },
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                ),
              ),
            ),
          ),
          body: Consumer<SearchViewModel>(
            builder: (_, searchViewModel, __) {
              if (searchController.text.isEmpty) {
                return const SizedBox.shrink();
              }
              if (searchViewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (searchViewModel.data.isEmpty) {
                return const Center(
                  child: Text('Aucun résultat'),
                );
              }
              final tabs = searchViewModel.data.entries.map(
                (e) {
                  return SearchResultContent(
                    language: e.key,
                    text: searchController.text,
                    articles: e.value,
                  );
                },
              ).toList();
              final pageController = PageController(
                initialPage: 0,
              );
              return MultiProvider(
                key: UniqueKey(),
                providers: [
                  ListenableProvider<OpacityViewModel>(
                    create: (_) => OpacityViewModel(),
                  ),
                  ListenableProvider<TabNavigationViewModel>(
                    create: (_) => TabNavigationViewModel(),
                  ),
                ],
                builder: (context, _) {
                  return Scaffold(
                    body: PageView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged:
                          context.read<TabNavigationViewModel>().goTo,
                      children: tabs,
                    ),
                    bottomNavigationBar: IntrinsicHeight(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: MediaQuery.sizeOf(context).width > 800
                              ? 30.0
                              : 10.0,
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
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  }
                                },
                                items: searchViewModel.data.keys.indexed
                                    .map(
                                      (e) => BottomNavBarItem(
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
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
