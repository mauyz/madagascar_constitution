import 'package:flutter/material.dart';

class ArticleListTypeViewModel extends ChangeNotifier {
  bool _isGrid;
  ArticleListTypeViewModel({
    bool? isGrid,
  }) : _isGrid = isGrid ?? true;

  bool get isGrid => _isGrid;

  void toogleType() {
    _isGrid = !_isGrid;
    notifyListeners();
  }
}
