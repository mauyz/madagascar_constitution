import 'package:flutter/material.dart';
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
      onTap: () {},
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
