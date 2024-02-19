import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/model/headline.dart';

@RoutePage()
class ArticleContentPage extends StatelessWidget {
  final Headline headline;
  const ArticleContentPage({
    super.key,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(headline.title),
        elevation: 5,
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {},
      ),
    );
  }
}
