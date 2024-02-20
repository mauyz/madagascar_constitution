import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/view/widgets/headline_title.dart';
import 'package:madagascar_constitution/view/widgets/preamble_title.dart';
import 'package:madagascar_constitution/viewmodel/data_view_model.dart';

class HeadlineList extends StatelessWidget {
  final DataViewModel dataModel;
  final ConstitutionLanguage language;
  const HeadlineList({
    super.key,
    required this.dataModel,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    if (dataModel.getConstitution() == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final constitution = dataModel.getConstitution()!;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: constitution.headlines.length + 1,
        itemBuilder: (_, index) {
          if (index == 0) {
            return PreambleTitle(
              constitution: constitution,
            );
          }
          return HeadlineTitle(
            constitution: constitution,
            index: index - 1,
          );
        },
      ),
    );
  }
}
