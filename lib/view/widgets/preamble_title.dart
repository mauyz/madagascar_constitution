import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';
import 'package:madagascar_constitution/model/preamble.dart';

class PreambleTitle extends StatelessWidget {
  final Preamble preamble;
  const PreambleTitle({
    super.key,
    required this.preamble,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          PreambleContentRoute(
            preamble: preamble,
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(
            preamble.title.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
