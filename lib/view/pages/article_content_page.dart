import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/pages/not_found_page.dart';
import 'package:madagascar_constitution/view/widgets/ad_banner_widget.dart';
import 'package:madagascar_constitution/view/widgets/back_to_home_button.dart';
import 'package:madagascar_constitution/view/widgets/horizontal_swipe_container.dart';
import 'package:madagascar_constitution/view/widgets/language_menu.dart';
import 'package:madagascar_constitution/view/widgets/pagination_buttons.dart';
import 'package:madagascar_constitution/viewmodel/ad_banner_view_model.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class ArticleContentPage extends StatelessWidget {
  final String language;
  final int id;
  final bool? useDefaultAnimation;

  const ArticleContentPage({
    super.key,
    @pathParam required this.language,
    @pathParam required this.id,
    this.useDefaultAnimation,
  });

  @override
  Widget build(BuildContext context) {
    if (!ConstitutionLanguage.values
        .map(
          (e) => e.name,
        )
        .toList()
        .contains(language)) {
      return const NotFoundPage();
    }

    final languageEnum = switch (language) {
      "mg" => ConstitutionLanguage.mg,
      "fr" => ConstitutionLanguage.fr,
      _ => ConstitutionLanguage.en,
    };
    final repo = context.read<Repository>();

    return FutureBuilder<Article?>(
      future: repo.searchArticleById(languageEnum, id),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final article = snapshot.data;
          if (article != null) {
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
                title: AutoSizeText(
                  article.title,
                  maxLines: 2,
                ),
                actions: [
                  LanguageMenu(
                    language: languageEnum,
                    onChanged: (value) {
                      if (value != null && languageEnum != value) {
                        context.router.popAndPush(
                          ArticleContentRoute(
                            language: value.name,
                            id: id,
                          ),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Share.share(
                          "${article.title}\n\n${article.content}",
                          subject: article.title,
                        );
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.share),
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: HorizontalSwipeContainer(
                      onSwipeLeft: _navigateToPreviousPage(context),
                      onSwipeRight: _navigateToNextPage(context),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          right: 12.0,
                          left: 12.0,
                        ),
                        child: SelectableText(
                          article.content,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: PaginationButtons(
                      onPreviousTap: _navigateToPreviousPage(context),
                      onNextTap: _navigateToNextPage(context),
                    ),
                  ),
                  if (!kIsWeb)
                    ChangeNotifierProvider(
                      key: ValueKey("article"),
                      lazy: true,
                      create: (_) => AdBannerViewModel(),
                      child: const SafeArea(
                        child: AdBannerWidget(),
                      ),
                    ),
                ],
              ),
            );
          } else {
            return const NotFoundPage();
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Function()? _navigateToPreviousPage(BuildContext context) {
    return id == 1
        ? null
        : () => context.router.popAndPush(
              ArticleContentRoute(
                language: language,
                id: id - 1,
                useDefaultAnimation: false,
              ),
            );
  }

  Function()? _navigateToNextPage(BuildContext context) {
    return id == 168
        ? null
        : () => context.router.popAndPush(
              ArticleContentRoute(
                language: language,
                id: id + 1,
              ),
            );
  }
}
