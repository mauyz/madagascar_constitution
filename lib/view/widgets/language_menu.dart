import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';

class LanguageMenu extends StatelessWidget {
  final ConstitutionLanguage language;
  final Function(ConstitutionLanguage? value) onChanged;
  const LanguageMenu({
    super.key,
    required this.language,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: DropdownButton<ConstitutionLanguage>(
        value: language,
        items: ConstitutionLanguage.values.map(
          (e) {
            return DropdownMenuItem<ConstitutionLanguage>(
              value: e,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/${e.name}.svg',
                    height: 16,
                    width: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      e.name.toUpperCase(),
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
