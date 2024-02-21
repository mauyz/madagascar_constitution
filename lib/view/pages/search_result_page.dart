import 'package:flutter/material.dart';
import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/view/widgets/searched_article_card.dart';

class SearchResultPage extends StatelessWidget {
  final String text;
  final List<Article> articles;
  const SearchResultPage({
    super.key,
    required this.text,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (_, index) {
        return SeearchedArticleCard(
          article: articles[index],
          text: text,
        );
      },
    );
  }
}
