import 'package:flutter/material.dart';

class TabNavigationViewModel extends ChangeNotifier {
  int _selected = 0;

  TabNavigationViewModel();

  int get selected => _selected;

  void goTo(int tab) {
    _selected = tab;
    notifyListeners();
  }
}
