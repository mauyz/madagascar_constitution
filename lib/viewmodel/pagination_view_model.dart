import 'package:flutter/material.dart';

class PaginationViewModel extends ChangeNotifier {
  int _page;
  PaginationViewModel({required int initialPage}) : _page = initialPage;

  void previousPage() {
    goToPage(_page--);
  }

  void nextPage() {
    goToPage(_page++);
  }

  void goToPage(int page) {
    _page = page;
    notifyListeners();
  }

  int get page => _page;
}
