import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/model/constitution.dart';

class HeadlineTitle extends StatelessWidget {
  final Constitution constitution;
  final int index;
  const HeadlineTitle({
    super.key,
    required this.constitution,
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
            context.router.push(
              ConstitutionPaginationRoute(
                initialPage: index,
                constitution: constitution,
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
                  children: [
                    Text(
                      '${headline.title} ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
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
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: headline.allArticles.length,
                    itemBuilder: (_, index) {
                      final article = headline.allArticles[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 4.0,
                        ),
                        child: FilledButton.tonal(
                          onPressed: () {
                            context.router.push(
                              ArticleContentRoute(
                                article: article,
                              ),
                            );
                          },
                          child: Text(
                            article.shortTitle,
                          ),
                        ),
                      );
                    },
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
