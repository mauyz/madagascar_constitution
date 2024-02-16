import 'package:flutter/material.dart';
import 'package:madagascar_constitution/model/headline.dart';

class HeadlineTitle extends StatelessWidget {
  final Headline headline;
  const HeadlineTitle({
    super.key,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(headline.title),
    );
  }
}
