import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/view/pages/headline_list.dart';
import 'package:madagascar_constitution/viewmodel/en_view_model.dart';
import 'package:madagascar_constitution/viewmodel/fr_view_model.dart';
import 'package:madagascar_constitution/viewmodel/mg_view_model.dart';
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
    return switch (language) {
      ConstitutionLanguage.mg => Consumer<MgViewModel>(
          builder: (_, model, __) {
            return HeadlineList(
              dataModel: model,
              language: language,
            );
          },
        ),
      ConstitutionLanguage.fr => Consumer<FrViewModel>(
          builder: (_, model, __) {
            return HeadlineList(
              dataModel: model,
              language: language,
            );
          },
        ),
      ConstitutionLanguage.en => Consumer<EnViewModel>(
          builder: (_, model, __) {
            return HeadlineList(
              dataModel: model,
              language: language,
            );
          },
        ),
    };
  }
}
