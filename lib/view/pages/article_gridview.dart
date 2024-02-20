import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/view/widgets/article_content.dart';

class ArticleGridview extends StatelessWidget {
  final List<Article> articles;
  const ArticleGridview({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final crossAxisCount = getCrossAxisCount(size);
    return StaggeredGrid.count(
      crossAxisCount: crossAxisCount,
      children: articles.map(
        (article) {
          return ArticleContent(
            article: article,
          );
        },
      ).toList(),
    );
  }

  int getCrossAxisCount(Size size) {
    if (size.width >= 1200) {
      return 3;
    } else if (size.width >= 600) {
      return 2;
    }
    return 1;
  }
}
