import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/model/constitution.dart';
import 'package:madagascar_constitution/model/headline.dart';
import 'package:madagascar_constitution/model/preamble.dart';
import 'package:madagascar_constitution/view/pages/headline_content_page.dart';
import 'package:madagascar_constitution/view/pages/preamble_content_page.dart';
import 'package:madagascar_constitution/view/widgets/pagination_buttons.dart';
import 'package:madagascar_constitution/viewmodel/pagination_view_model.dart';
import 'package:provider/provider.dart';

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
    return ListenableProvider<PaginationViewModel>(
      create: (_) => PaginationViewModel(
        initialPage: initialPage,
      ),
      child: Consumer<PaginationViewModel>(
        builder: (_, paginationViewModel, __) {
          final currentPage = paginationViewModel.page;
          dynamic currentContent = (currentPage == -1)
              ? constitution.preamble
              : constitution.headlines[currentPage];
          final pageTitle = getPageTitle(currentContent);
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
              title: Text(pageTitle),
              elevation: 5,
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
