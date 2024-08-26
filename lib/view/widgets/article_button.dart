import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/article.dart';

class ArticleButton extends StatelessWidget {
  final ConstitutionLanguage language;
  final Article article;
  const ArticleButton({
    super.key,
    required this.language,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 4.0,
      ),
      child: FilledButton.tonal(
        onPressed: () {
          context.router.navigateNamed(
            "/articles/${language.name}/${article.id}",
          );
        },
        child: Text(
          article.shortTitle,
        ),
      ),
    );
  }
}
