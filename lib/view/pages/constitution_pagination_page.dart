import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/model/constitution.dart';
import 'package:madagascar_constitution/model/headline.dart';
import 'package:madagascar_constitution/model/preamble.dart';
import 'package:madagascar_constitution/view/pages/headline_content_page.dart';
import 'package:madagascar_constitution/view/pages/preamble_content_page.dart';
import 'package:madagascar_constitution/view/widgets/pagination_buttons.dart';
import 'package:madagascar_constitution/viewmodel/article_list_type_view_model.dart';
import 'package:madagascar_constitution/viewmodel/pagination_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ConstitutionPaginationPage extends StatelessWidget {
  final Constitution constitution;
  final int initialPage;
  const ConstitutionPaginationPage({
    super.key,
    required this.initialPage,
    required this.constitution,
  });

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = context.read<SharedPreferences>();
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
      child: Consumer<PaginationViewModel>(
        builder: (_, paginationViewModel, __) {
          final currentPage = paginationViewModel.page;
          dynamic currentContent = (currentPage == -1)
              ? constitution.preamble
              : constitution.headlines[currentPage];
          final pageTitle = getPageTitle(currentContent);
          return Scaffold(
            appBar: AppBar(
              elevation: 5,
              leading: IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              title: AutoSizeText(
                pageTitle,
                maxLines: 2,
              ),
              actions: [
                if (currentPage != -1 &&
                    MediaQuery.sizeOf(context).width >= 600)
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Consumer<ArticleListTypeViewModel>(
                      builder: (_, listTypeViewModel, __) {
                        return IconButton.filled(
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
                  ),
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: currentContent is Preamble
                        ? PreambleContentPage(preamble: currentContent)
                        : HeadlineContentPage(headline: currentContent),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PaginationButtons(
                    paginationViewModel: paginationViewModel,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String getPageTitle(dynamic content) {
    if (content is Preamble) {
      return content.title;
    }
    return (content as Headline).title;
  }
}
