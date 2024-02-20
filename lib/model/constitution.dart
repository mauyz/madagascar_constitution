import 'package:madagascar_constitution/model/headline.dart';
import 'package:madagascar_constitution/model/preamble.dart';

class Constitution {
  final Preamble preamble;
  final List<Headline> headlines;

  Constitution({
    required this.preamble,
    required this.headlines,
  });

  Constitution.fromJson(Map<String, dynamic> json)
      : preamble = Preamble.fromJson(json['preamble']),
        headlines = (json['headlines'] as List<dynamic>)
            .map(
              (e) => Headline.fromJson(e),
            )
            .toList();

  Map<String, dynamic> toJson() => {
        'preamble': preamble.toJson(),
        'headlines': headlines
            .map(
              (e) => e.toJson(),
            )
            .toList(),
      };
}
