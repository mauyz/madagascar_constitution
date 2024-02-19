import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/constitution.dart';
import 'package:madagascar_constitution/source/json_parser.dart';

class Repository {
  final _data = <ConstitutionLanguage, Constitution>{};

  Future<Constitution> loadConstitution(ConstitutionLanguage language) async {
    if (_data.containsKey(language)) {
      return _data[language]!;
    }
    final constitution = await JsonParser.parseDoc(language);
    _data[language] = constitution;
    return constitution;
  }
}
