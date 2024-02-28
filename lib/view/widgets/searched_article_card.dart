import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/model/article.dart';

class SeearchedArticleCard extends StatelessWidget {
  final Article article;
  final String text;
  const SeearchedArticleCard({
    super.key,
    required this.article,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {
          context.router.push(
            ArticleContentRoute(
              article: article,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Text(
                article.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextHighlight(
                  text: article.content,
                  words: {
                    text: HighlightedWord(
                      textStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                  },
                  matchCase: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
