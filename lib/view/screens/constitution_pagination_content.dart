import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/constitution.dart';
import 'package:madagascar_constitution/model/headline.dart';
import 'package:madagascar_constitution/model/preamble.dart';
import 'package:madagascar_constitution/view/screens/headline_content.dart';
import 'package:madagascar_constitution/view/screens/preamble_content.dart';
import 'package:madagascar_constitution/view/widgets/back_to_home_button.dart';
import 'package:madagascar_constitution/view/widgets/language_menu.dart';
import 'package:madagascar_constitution/view/widgets/pagination_buttons.dart';
import 'package:madagascar_constitution/viewmodel/article_list_type_view_model.dart';
import 'package:madagascar_constitution/viewmodel/pagination_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConstitutionPaginationContent extends StatelessWidget {
  final Constitution constitution;
  final ConstitutionLanguage language;
  final int initialPage;
  const ConstitutionPaginationContent({
    super.key,
    required this.language,
    required this.initialPage,
    required this.constitution,
  });

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = context.read<SharedPreferences>();
    final pageController = PageController(initialPage: initialPage);
    return MultiProvider(
      providers: [
        ListenableProvider<PaginationViewModel>(
          create: (_) => PaginationViewModel(
            initialPage: initialPage,
          ),
        ),
        ListenableProvider<ArticleListTypeViewModel>(
          create: (_) => ArticleListTypeViewModel(
            isGrid: sharedPreferences.getBool("typeView"),
          ),
        ),
      ],
      child: Scaffold(
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
          title: Consumer<PaginationViewModel>(
            builder: (_, paginationViewModel, __) {
              final pageTitle = paginationViewModel.page == 0
                  ? constitution.preamble.title
                  : constitution.headlines[paginationViewModel.page - 1].title;
              return AutoSizeText(
                pageTitle,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              );
            },
          ),
          actions: [
            LanguageMenu(
              language: language,
              onChanged: (value) {
                if (value != null && language != value) {
                  context.router.popAndPush(
                    ConstitutionPaginationRoute(
                      language: value.name,
                      title: initialPage,
                    ),
                  );
                }
              },
            ),
            Consumer<PaginationViewModel>(
              builder: (buildContext, paginationViewModel, __) {
                return (paginationViewModel.page != 0 &&
                        MediaQuery.sizeOf(buildContext).width >= 600)
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Consumer<ArticleListTypeViewModel>(
                          builder: (_, listTypeViewModel, __) {
                            return IconButton(
                              onPressed: () {
                                listTypeViewModel.toogleType();
                                sharedPreferences.setBool(
                                  "typeView",
                                  listTypeViewModel.isGrid,
                                );
                              },
                              icon: Icon(
                                listTypeViewModel.isGrid
                                    ? Icons.list
                                    : Icons.grid_view,
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
                  builder: (context) {
                    return PageView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: pageController,
                      itemCount: constitution.headlines.length + 1,
                      onPageChanged: (index) =>
                          context.read<PaginationViewModel>().goToPage(index),
                      itemBuilder: (_, index) {
                        final currentContent = (index == 0)
                            ? constitution.preamble
                            : constitution.headlines[index - 1];
                        return currentContent is Preamble
                            ? PreambleContent(preamble: currentContent)
                            : HeadlineContent(
                                language: language,
                                headline: currentContent as Headline,
                              );
                      },
                    );
                  },
                ),
              ),
            ),
            Consumer<PaginationViewModel>(
              builder: (_, paginationViewModel, __) {
                return PaginationButtons(
                  pageController: pageController,
                  paginationViewModel: paginationViewModel,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
