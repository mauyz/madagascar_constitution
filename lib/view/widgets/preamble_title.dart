import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/constitution.dart';

class PreambleTitle extends StatelessWidget {
  final Constitution constitution;
  final ConstitutionLanguage constitutionLanguage;
  const PreambleTitle({
    super.key,
    required this.constitution,
    required this.constitutionLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final preamble = constitution.preamble;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Material(
        elevation: 2.0,
        child: InkWell(
          onTap: () {
            context.router.navigate(
              ConstitutionPaginationRoute(
                language: constitutionLanguage.name,
                title: 0,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              preamble.title.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
