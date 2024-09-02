import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/constitution.dart';
import 'package:madagascar_constitution/view/widgets/article_button.dart';

class HeadlineTitle extends StatelessWidget {
  final Constitution constitution;
  final ConstitutionLanguage constitutionLanguage;
  final int index;
  const HeadlineTitle({
    super.key,
    required this.constitution,
    required this.constitutionLanguage,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final headline = constitution.headlines[index];
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Material(
        elevation: 2.0,
        child: InkWell(
          onTap: () {
            context.router.navigate(
              ConstitutionPaginationRoute(
                language: constitutionLanguage.name,
                title: index + 1,
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${headline.title} ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '(${headline.formattedRange})',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: kIsWeb
                    ? Wrap(
                        children: headline.allArticles.map(
                          (article) {
                            return ArticleButton(
                              language: constitutionLanguage,
                              article: article,
                            );
                          },
                        ).toList(),
                      )
                    : SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: headline.allArticles.length,
                          itemBuilder: (_, index) => ArticleButton(
                            language: constitutionLanguage,
                            article: headline.allArticles[index],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
