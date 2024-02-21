import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';

class TabNavigationItem extends BottomNavigationBarItem {
  final ConstitutionLanguage language;
  TabNavigationItem({
    required this.language,
  }) : super(
          icon: SvgPicture.asset(
            'assets/${language.name}.svg',
            height: 24,
          ),
          label: switch (language) {
            ConstitutionLanguage.mg => "Malagasy",
            ConstitutionLanguage.fr => "Français",
            ConstitutionLanguage.en => "Anglais",
          },
        );
}
