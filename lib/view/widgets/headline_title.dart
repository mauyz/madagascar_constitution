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
    return InkWell(
      onTap: () {},
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                children: [
                  Text(
                    headline.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' (${headline.formattedRange})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: headline.allArticles.length,
                  itemBuilder: (_, index) {
                    final article = headline.allArticles[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 4.0,
                      ),
                      child: FilledButton.tonal(
                        onPressed: () {},
                        child: Text(
                          article.shortTitle,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
