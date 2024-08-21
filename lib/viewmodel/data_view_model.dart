import 'package:madagascar_constitution/model/constitution.dart';

abstract class DataViewModel {
  Future loadConstitution();
  Constitution? getConstitution();
}
