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
import 'package:madagascar_constitution/view/widgets/horizontal_swipe_container.dart';
import 'package:madagascar_constitution/view/widgets/language_menu.dart';
import 'package:madagascar_constitution/view/widgets/pagination_buttons.dart';
import 'package:madagascar_constitution/view/widgets/type_view_button.dart';
import 'package:madagascar_constitution/viewmodel/article_list_type_view_model.dart';
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
    final currentContent = initialPage == 0
        ? constitution.preamble
        : constitution.headlines[initialPage - 1];
    final pageTitle = initialPage == 0
        ? (currentContent as Preamble).title
        : (currentContent as Headline).title;
    return ListenableProvider<ArticleListTypeViewModel>(
      create: (_) => ArticleListTypeViewModel(
        isGrid: context.read<SharedPreferences>().getBool("typeView"),
      ),
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
          title: AutoSizeText(
            pageTitle,
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
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
            TypeViewButton(isPageInitial: initialPage == 0),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: HorizontalSwipeContainer(
                onSwipeLeft: _navigateToPreviousPage(context),
                onSwipeRight: _navigateToNextPage(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: currentContent is Preamble
                      ? PreambleContent(preamble: currentContent)
                      : HeadlineContent(
                          language: language,
                          headline: currentContent as Headline,
                        ),
                ),
              ),
            ),
            PaginationButtons(
              onPreviousTap: _navigateToPreviousPage(context),
              onNextTap: _navigateToNextPage(context),
            ),
          ],
        ),
      ),
    );
  }

  Function()? _navigateToPreviousPage(BuildContext context) {
    return initialPage == 0
        ? null
        : () => context.router.popAndPush(
              ConstitutionPaginationRoute(
                language: language.name,
                title: initialPage - 1,
                useDefaultAnimation: false,
              ),
            );
  }

  Function()? _navigateToNextPage(BuildContext context) {
    return initialPage == 7
        ? null
        : () => context.router.popAndPush(
              ConstitutionPaginationRoute(
                language: language.name,
                title: initialPage + 1,
              ),
            );
  }
}
