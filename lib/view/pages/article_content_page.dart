import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/model/article.dart';

@RoutePage()
class ArticleContentPage extends StatelessWidget {
  final Article article;
  const ArticleContentPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(article.title),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SelectableText(
          article.content,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
