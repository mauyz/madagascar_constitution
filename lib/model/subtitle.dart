import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/model/chapiter.dart';

class Subtitle {
  final String title;
  final List<Article> articles;
  final List<Chapiter> chapiters;

  const Subtitle({
    required this.title,
    required this.articles,
    required this.chapiters,
  });

  Subtitle.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        articles = (json['articles'] as List<dynamic>)
            .map(
              (e) => Article.fromJson(e),
            )
            .toList(),
        chapiters = (json['chapiters'] as List<dynamic>)
            .map(
              (e) => Chapiter.fromJson(e),
            )
            .toList();

  Map<String, dynamic> toJson() => {
        'title': title,
        'articles': articles
            .map(
              (e) => e.toJson(),
            )
            .toList(),
        'chapiters': chapiters
            .map(
              (e) => e.toJson(),
            )
            .toList(),
      };
}
