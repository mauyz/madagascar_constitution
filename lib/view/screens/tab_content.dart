import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/screens/headline_list.dart';
import 'package:madagascar_constitution/viewmodel/en_view_model.dart';
import 'package:madagascar_constitution/viewmodel/fr_view_model.dart';
import 'package:madagascar_constitution/viewmodel/mg_view_model.dart';
import 'package:provider/provider.dart';

class TabContent extends StatelessWidget {
  final ConstitutionLanguage language;
  const TabContent({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    final repository = context.read<Repository>();
    return switch (language) {
      ConstitutionLanguage.mg => ListenableProvider<MgViewModel>(
          create: (_) => MgViewModel(
            repository: repository,
          )..loadConstitution(),
          builder: (context, _) {
            return Consumer<MgViewModel>(
              builder: (_, model, __) {
                return HeadlineList(
                  dataModel: model,
                  language: language,
                );
              },
            );
          },
        ),
      ConstitutionLanguage.fr => ListenableProvider<FrViewModel>(
          create: (_) => FrViewModel(
            repository: repository,
          )..loadConstitution(),
          builder: (context, _) {
            return Consumer<FrViewModel>(
              builder: (_, model, __) {
                return HeadlineList(
                  dataModel: model,
                  language: language,
                );
              },
            );
          },
        ),
      ConstitutionLanguage.en => ListenableProvider<EnViewModel>(
          create: (_) => EnViewModel(
            repository: repository,
          )..loadConstitution(),
          builder: (context, _) {
            return Consumer<EnViewModel>(
              builder: (_, model, __) {
                return HeadlineList(
                  dataModel: model,
                  language: language,
                );
              },
            );
          },
        ),
    };
  }
}
