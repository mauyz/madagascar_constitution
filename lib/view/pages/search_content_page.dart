import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/pages/search_result_page.dart';
import 'package:madagascar_constitution/view/widgets/tab_navigation_item.dart';
import 'package:madagascar_constitution/viewmodel/search_view_model.dart';
import 'package:madagascar_constitution/viewmodel/tab_search_view_model.dart';
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
            leading: IconButton(
              onPressed: () {
                context.router.pop();
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
                    if (value.length > 1) {
                      context.read<SearchViewModel>().searchText(value);
                    } else {
                      context.read<SearchViewModel>().searchText('');
                    }
                  },
                ),
              ),
            ),
          ),
          body: Consumer<SearchViewModel>(
            builder: (_, searchViewModel, __) {
              if (searchController.text.length < 2) {
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
              final tabs = searchViewModel.data.values
                  .map(
                    (values) => SearchResultPage(
                      text: searchController.text,
                      articles: values,
                    ),
                  )
                  .toList();
              final pageController = PageController(
                initialPage: 0,
              );
              return ListenableProvider<TabSearchViewModel>(
                create: (_) => TabSearchViewModel(),
                builder: (context, _) {
                  return Scaffold(
                    body: PageView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged: context.read<TabSearchViewModel>().goTo,
                      children: tabs,
                    ),
                    bottomNavigationBar: tabs.length == 1
                        ? Material(
                            elevation: 3.0,
                            color: Theme.of(context).bottomAppBarTheme.color,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/${searchViewModel.data.keys.first.name}.svg',
                                    height: 24,
                                  ),
                                  Text(
                                    switch (searchViewModel.data.keys.first) {
                                      ConstitutionLanguage.mg => "Malagasy",
                                      ConstitutionLanguage.fr => "Français",
                                      ConstitutionLanguage.en => "Anglais",
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Consumer<TabSearchViewModel>(
                            builder: (_, tabViewModel, __) {
                              return BottomNavigationBar(
                                currentIndex: tabViewModel.selected,
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
                                items: searchViewModel.data.keys
                                    .map(
                                      (e) => TabNavigationItem(
                                        language: e,
                                      ),
                                    )
                                    .toList(),
                              );
                            },
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
