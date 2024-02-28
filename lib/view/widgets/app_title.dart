import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Constitution de Madagascar",
      maxLines: 2,
      style: TextStyle(
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
