import 'package:madagascar_constitution/model/article.dart';

class Chapiter {
  final String title;
  final List<Article> articles;

  const Chapiter({
    required this.title,
    required this.articles,
  });

  Chapiter.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        articles = (json['articles'] as List<dynamic>)
            .map(
              (e) => Article.fromJson(e),
            )
            .toList();

  Map<String, dynamic> toJson() => {
        'title': title,
        'articles': articles
            .map(
              (e) => e.toJson(),
            )
            .toList(),
      };
}
