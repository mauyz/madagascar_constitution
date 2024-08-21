import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/article.dart';
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

  Future<Map<ConstitutionLanguage, List<Article>>> searchArticles(
      String text) async {
    _data[ConstitutionLanguage.mg] ??=
        await JsonParser.parseDoc(ConstitutionLanguage.mg);
    final mg = _data[ConstitutionLanguage.mg]!
        .allArticles
        .where(
          (article) => article.content.toLowerCase().contains(
                text.toLowerCase(),
              ),
        )
        .toList();
    _data[ConstitutionLanguage.fr] ??=
        await JsonParser.parseDoc(ConstitutionLanguage.fr);
    final fr = _data[ConstitutionLanguage.fr]!
        .allArticles
        .where(
          (article) => article.content.toLowerCase().contains(
                text.toLowerCase(),
              ),
        )
        .toList();
    _data[ConstitutionLanguage.en] ??=
        await JsonParser.parseDoc(ConstitutionLanguage.en);
    final en = _data[ConstitutionLanguage.en]!
        .allArticles
        .where(
          (article) => article.content.toLowerCase().contains(
                text.toLowerCase(),
              ),
        )
        .toList();
    return <ConstitutionLanguage, List<Article>>{
      if (mg.isNotEmpty) ConstitutionLanguage.mg: mg,
      if (fr.isNotEmpty) ConstitutionLanguage.fr: fr,
      if (en.isNotEmpty) ConstitutionLanguage.en: en,
    };
  }
}
