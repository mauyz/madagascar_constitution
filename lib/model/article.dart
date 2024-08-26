class Article {
  final int id;
  final String title;
  final String content;

  const Article({
    required this.id,
    required this.title,
    required this.content,
  });

  Article.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        content = json['content'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
      };

  String get shortTitle =>
      '${title.substring(0, 3)}. ${title.replaceAll(RegExp(r"[^0-9]"), '')}';
}
