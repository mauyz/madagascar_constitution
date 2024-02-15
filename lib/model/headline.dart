import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/model/subtitle.dart';

class Headline {
  final String title;
  final String range;
  final List<Article> articles;
  final List<Subtitle> subtitles;

  const Headline({
    required this.title,
    required this.range,
    required this.articles,
    required this.subtitles,
  });

  Headline.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        range = json['range'] as String,
        articles = (json['articles'] as List<dynamic>)
            .map(
              (e) => Article.fromJson(e),
            )
            .toList(),
        subtitles = (json['subtitles'] as List<dynamic>)
            .map(
              (e) => Subtitle.fromJson(e),
            )
            .toList();

  Map<String, dynamic> toJson() => {
        'title': title,
        'range': range,
        'articles': articles
            .map(
              (e) => e.toJson(),
            )
            .toList(),
        'subtitles': subtitles.map((e) => e.toJson()).toList(),
      };
}
