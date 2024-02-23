import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/view/widgets/article_card.dart';
import 'package:madagascar_constitution/viewmodel/article_list_type_view_model.dart';
import 'package:provider/provider.dart';

class ArticleGridview extends StatelessWidget {
  final List<Article> articles;
  const ArticleGridview({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleListTypeViewModel>(
      builder: (buildContext, listTypeViewModel, __) {
        final crossAxisCount = listTypeViewModel.isGrid
            ? getCrossAxisCount(MediaQuery.sizeOf(buildContext))
            : 1;
        return StaggeredGrid.count(
          crossAxisCount: crossAxisCount,
          children: articles.map(
            (article) {
              return ArticleCard(
                article: article,
              );
            },
          ).toList(),
        );
      },
    );
  }

  int getCrossAxisCount(Size size) {
    if (size.width >= 1200) {
      return articles.length < 3 ? articles.length : 3;
    } else if (size.width >= 600) {
      return articles.length < 2 ? articles.length : 2;
    }
    return 1;
  }
}
