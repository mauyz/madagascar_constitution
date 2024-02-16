import 'package:madagascar_constitution/core/app_constants.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';

class Preamble {
  final ConstitutionLanguage language;
  final String content;

  Preamble({
    required this.language,
    required this.content,
  });

  String get title => AppConstants.preambleTranslation(language);
}
