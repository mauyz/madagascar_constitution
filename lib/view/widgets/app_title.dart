import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/viewmodel/tab_navigation_view_model.dart';
import 'package:provider/provider.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTranslation = [
      "Lalam-panorenana Malagasy",
      "Constitution Malagasy",
      "Malagasy Constitution",
    ];
    return Consumer<TabNavigationViewModel>(
      builder: (_, tabNavigationViewModel, __) {
        return AutoSizeText(
          titleTranslation[tabNavigationViewModel.selected],
          maxLines: 2,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
        );
      },
    );
  }
}
