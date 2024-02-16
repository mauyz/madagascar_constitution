import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/preamble.dart';
import 'package:madagascar_constitution/view/widgets/headline_title.dart';
import 'package:madagascar_constitution/view/widgets/preamble_title.dart';
import 'package:madagascar_constitution/viewmodel/data_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ContentPage extends StatelessWidget {
  final ConstitutionLanguage language;
  const ContentPage({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    context.read<DataModel>().loadConstitution(language);
    return Consumer<DataModel>(
      builder: (_, dataModel, __) {
        Future.delayed(Duration.zero, () {
          dataModel.loadConstitution(language);
        });
        if (dataModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final constitution = dataModel.getConstitution(language);
        final preamble = Preamble(
          language: language,
          content: constitution.preamble,
        );
        return ListView.builder(
          itemCount: constitution.headlines.length + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return PreambleTitle(
                preamble: preamble,
              );
            }
            return HeadlineTitle(
              headline: constitution.headlines[index - 1],
            );
          },
        );
      },
    );
  }
}
