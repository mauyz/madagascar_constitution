import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/article.dart';
import 'package:madagascar_constitution/source/repository.dart';

class SearchViewModel extends ChangeNotifier {
  final Repository repository;
  Map<ConstitutionLanguage, List<Article>> _data = {};
  bool _isLoading = false;

  SearchViewModel({
    required this.repository,
  });

  bool get isLoading => _isLoading;

  Map<ConstitutionLanguage, List<Article>> get data => _data;

  void searchText(String value) async {
    if (value.length < 2) {
      _data = {};
      notifyListeners();
      return;
    }
    _isLoading = true;
    notifyListeners();
    _data = await repository.searchArticles(value);
    _isLoading = false;
    notifyListeners();
  }
}
