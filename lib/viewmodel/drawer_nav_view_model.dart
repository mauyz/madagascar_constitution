import 'package:flutter/material.dart';

class DrawerNavViewModel extends ChangeNotifier {
  int _selected = -1;

  int get selected => _selected;

  void navigateTo(int value) {
    _selected = value;
    notifyListeners();
  }
}
