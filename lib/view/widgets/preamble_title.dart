import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/model/constitution.dart';

class PreambleTitle extends StatelessWidget {
  final Constitution constitution;
  const PreambleTitle({
    super.key,
    required this.constitution,
  });

  @override
  Widget build(BuildContext context) {
    final preamble = constitution.preamble;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Material(
        elevation: 5.0,
        child: InkWell(
          onTap: () {
            context.router.push(
              ConstitutionPaginationRoute(
                initialPage: -1,
                constitution: constitution,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              preamble.title.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
