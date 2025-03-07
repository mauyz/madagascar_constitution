import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/view/widgets/article_card.dart';
import 'package:madagascar_constitution/viewmodel/article_list_type_view_model.dart';
import 'package:provider/provider.dart';

class ArticleGridview extends StatelessWidget {
  final ConstitutionLanguage language;
  final List<Article> articles;
  const ArticleGridview({
    super.key,
    required this.language,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleListTypeViewModel>(
      builder: (buildContext, listTypeViewModel, __) {
        final crossAxisCount =
            getCrossAxisCount(MediaQuery.sizeOf(buildContext));
        if (!listTypeViewModel.isGrid || crossAxisCount == 1) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (_, index) {
              return ArticleCard(
                language: language,
                article: articles[index],
              );
            },
          );
        }

        return StaggeredGrid.count(
          crossAxisCount: crossAxisCount,
          children: articles.map(
            (article) {
              return ArticleCard(
                language: language,
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
