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
    final scrollController = ScrollController();
    final resultText =
        articles.length > 1 ? "articles trouvés" : "article trouvé";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "${articles.length} $resultText",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (_, index) {
                return SearchedArticleCard(
                  article: articles[index],
                  text: text,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
