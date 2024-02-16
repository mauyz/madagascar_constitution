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
    return ListTile(
      title: Text(preamble.title),
    );
  }
}
