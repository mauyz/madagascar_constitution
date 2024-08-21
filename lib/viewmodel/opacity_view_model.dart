import 'package:flutter/material.dart';

class OpacityViewModel extends ChangeNotifier {
  double _value = 0;

  OpacityViewModel();

  double get value => _value;

  void setValue(double value) {
    _value = value;
    notifyListeners();
  }
}
