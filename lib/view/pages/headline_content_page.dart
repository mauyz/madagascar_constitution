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
    return ListView.builder(
      itemCount: getListItemsCount(headline),
      itemBuilder: (_, index) {
        if (index == 0 && articles.isNotEmpty) {
          return ArticleGridview(
            articles: articles,
          );
        } else {
          final subtitle = subtitles[articles.isEmpty ? index : index - 1];
          final subtitleArticles = subtitle.articles;
          final subtitleChapters = subtitle.chapiters;
          return Card(
            color: Theme.of(context).secondaryHeaderColor,
            elevation: 1.0,
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
                if (subtitleArticles.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ArticleGridview(
                      articles: subtitleArticles,
                    ),
                  ),
                if (subtitleChapters.isNotEmpty)
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: subtitleChapters.length,
                      itemBuilder: (_, indexItem) {
                        final chapter = subtitleChapters[indexItem];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Theme.of(context).focusColor,
                            elevation: 1.0,
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
                                    chapter.title,
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
                                    articles: chapter.articles,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        }
      },
    );
  }

  int getListItemsCount(Headline headline) {
    int total = 0;
    if (headline.articles.isNotEmpty) {
      total++;
    }
    return total + headline.subtitles.length;
  }
}
