class Preamble {
  final String title;
  final String content;

  Preamble({
    required this.title,
    required this.content,
  });

  Preamble.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        content = json['content'] as String;

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}
