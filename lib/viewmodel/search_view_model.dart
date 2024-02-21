import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/source/repository.dart';

class SearchViewModel extends ChangeNotifier {
  final Repository repository;
  Map<ConstitutionLanguage, List<Article>> _data = {};

  SearchViewModel({
    required this.repository,
  });

  Map<ConstitutionLanguage, List<Article>> get data => _data;

  void searchText(String value) async {
    _data = await repository.searchArticles(value);
    notifyListeners();
  }
}
