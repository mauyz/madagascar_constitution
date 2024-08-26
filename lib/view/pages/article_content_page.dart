import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/pages/not_found_page.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ArticleContentPage extends StatelessWidget {
  final String language;
  final int id;
  const ArticleContentPage({
    super.key,
    @pathParam required this.language,
    @pathParam required this.id,
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
                    ? IconButton(
                        onPressed: () {
                          context.router.replaceAll(
                            [const HomeRoute()],
                          );
                        },
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical: 8.0,
                          ),
                          child: SvgPicture.asset(
                            "assets/mg.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          context.router.maybePop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                title: Text(article.title),
              ),
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SelectableText(
                  article.content,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
}
