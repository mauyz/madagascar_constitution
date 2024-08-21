import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/constitution.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/viewmodel/data_view_model.dart';

class MgViewModel extends ChangeNotifier implements DataViewModel {
  final Repository repository;
  Constitution? _constitution;
  MgViewModel({
    required this.repository,
  });

  @override
  Future loadConstitution() async {
    _constitution = await repository.loadConstitution(ConstitutionLanguage.mg);
    notifyListeners();
  }

  @override
  Constitution? getConstitution() => _constitution;
}
