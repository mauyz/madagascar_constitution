import 'package:madagascar_constitution/model/headline.dart';

class Constitution {
  final String preamble;
  final List<Headline> headlines;

  Constitution({
    required this.preamble,
    required this.headlines,
  });

  Constitution.fromJson(Map<String, dynamic> json)
      : preamble = json['preamble'] as String,
        headlines = (json['headlines'] as List<dynamic>)
            .map(
              (e) => Headline.fromJson(e),
            )
            .toList();

  Map<String, dynamic> toJson() => {
        'preamble': preamble,
        'headlines': headlines
            .map(
              (e) => e.toJson(),
            )
            .toList(),
      };
}
