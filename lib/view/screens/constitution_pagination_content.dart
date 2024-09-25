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
    Offset? startPosition;
    Offset? updatePosition;
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
              child: GestureDetector(
                onPanStart: (details) => startPosition = details.globalPosition,
                onPanUpdate: (details) =>
                    updatePosition = details.globalPosition,
                onPanEnd: (_) => _executeSwipe(
                  context,
                  startPosition,
                  updatePosition,
                ),
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
              initialPage: initialPage,
              language: language.name,
            )
          ],
        ),
      ),
    );
  }

  void _executeSwipe(
    BuildContext context,
    Offset? startPosition,
    Offset? updatePosition,
  ) {
    if (startPosition == null || updatePosition == null) {
      return;
    }
    final offset = updatePosition - startPosition;
    if (offset.dx.abs() > offset.dy.abs()) {
      if (offset.dx > 0) {
        if (initialPage != 0) {
          context.router.popAndPush(
            ConstitutionPaginationRoute(
              language: language.name,
              title: initialPage - 1,
              useDefaultAnimation: false,
            ),
          );
        }
      } else {
        if (initialPage != 7) {
          context.router.popAndPush(
            ConstitutionPaginationRoute(
              language: language.name,
              title: initialPage + 1,
            ),
          );
        }
      }
    }
  }
}
