import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/constitution.dart';
import 'package:madagascar_constitution/viewmodel/json_parser.dart';

class DataModel extends ChangeNotifier {
  final _data = <ConstitutionLanguage, Constitution>{};
  bool isLoading = true;
  DataModel();

  void loadConstitution(ConstitutionLanguage language) async {
    if (_data.containsKey(language)) {
      isLoading = false;
      notifyListeners();
      return;
    }
    final constitution = await JsonParser.parseDoc(language);
    _data[language] = constitution;
    isLoading = false;
    notifyListeners();
  }

  Constitution getConstitution(ConstitutionLanguage language) =>
      _data[language]!;
}
