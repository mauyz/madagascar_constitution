import 'package:flutter/material.dart';
import 'package:madagascar_constitution/model/preamble.dart';

class PreambleContentPage extends StatelessWidget {
  final Preamble preamble;
  const PreambleContentPage({
    super.key,
    required this.preamble,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          preamble.content,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
