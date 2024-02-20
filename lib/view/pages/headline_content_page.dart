import 'package:flutter/material.dart';
import 'package:madagascar_constitution/model/headline.dart';
import 'package:madagascar_constitution/view/pages/article_gridview.dart';

class HeadlineContentPage extends StatelessWidget {
  final Headline headline;
  const HeadlineContentPage({
    super.key,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    final articles = headline.articles;
    final subtitles = headline.subtitles;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (articles.isNotEmpty)
            ArticleGridview(
              articles: articles,
            ),
          ...subtitles.map(
            (subtitle) {
              final subtittleArticles = subtitle.articles;
              final subtitleChapiters = subtitle.chapiters;
              return Card(
                color: Theme.of(context).secondaryHeaderColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        subtitle.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    if (subtittleArticles.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ArticleGridview(
                          articles: subtittleArticles,
                        ),
                      ),
                    ...subtitleChapiters.map(
                      (chapiter) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Theme.of(context).focusColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 10.0,
                                  ),
                                  child: Text(
                                    chapiter.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                    bottom: 10.0,
                                  ),
                                  child: ArticleGridview(
                                    articles: chapiter.articles,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
