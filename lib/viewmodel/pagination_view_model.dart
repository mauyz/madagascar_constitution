import 'package:flutter/material.dart';

class PaginationViewModel extends ChangeNotifier {
  int _page;
  PaginationViewModel({required int initialPage}) : _page = initialPage;

  void previousPage() {
    _page--;
    notifyListeners();
  }

  void nextPage() {
    _page++;
    notifyListeners();
  }

  int get page => _page;
}
