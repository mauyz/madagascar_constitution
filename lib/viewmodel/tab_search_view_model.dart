import 'package:flutter/material.dart';

class TabSearchViewModel extends ChangeNotifier {
  int _selected = 0;

  TabSearchViewModel();

  int get selected => _selected;

  void goTo(int tab) {
    _selected = tab;
    notifyListeners();
  }
}
