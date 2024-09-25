import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/constitution.dart';
import 'package:madagascar_constitution/source/repository.dart';
import 'package:madagascar_constitution/view/pages/not_found_page.dart';
import 'package:madagascar_constitution/view/screens/constitution_pagination_content.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ConstitutionPaginationPage extends StatelessWidget {
  final String language;
  final int? title;
  final bool? useDefaultAnimation;
  const ConstitutionPaginationPage({
    super.key,
    @pathParam required this.language,
    @queryParam this.title,
    this.useDefaultAnimation,
  });

  @override
  Widget build(BuildContext context) {
    if (!ConstitutionLanguage.values
            .map(
              (e) => e.name,
            )
            .toList()
            .contains(language) ||
        (title != null && (title! < 0 || title! > 7))) {
      return const NotFoundPage();
    }
    final initialPage = title ?? 0;
    final repository = context.read<Repository>();
    final constitutionLanguage = switch (language) {
      "mg" => ConstitutionLanguage.mg,
      "fr" => ConstitutionLanguage.fr,
      _ => ConstitutionLanguage.en,
    };
    return FutureBuilder<Constitution>(
      future: repository.loadConstitution(constitutionLanguage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ConstitutionPaginationContent(
            language: constitutionLanguage,
            initialPage: initialPage,
            constitution: snapshot.data!,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
