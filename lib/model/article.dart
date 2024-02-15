class Article {
  final String title;
  final String content;

  const Article({
    required this.title,
    required this.content,
  });

  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        content = json['content'] as String;

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}
