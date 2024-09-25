import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';

class PaginationButtons extends StatelessWidget {
  final int initialPage;
  final String language;
  const PaginationButtons({
    super.key,
    required this.initialPage,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(
                      20.0,
                    ),
                  ),
                ),
              ),
              onPressed: initialPage == 0
                  ? null
                  : () => context.router.popAndPush(
                        ConstitutionPaginationRoute(
                          language: language,
                          title: initialPage - 1,
                          useDefaultAnimation: false,
                        ),
                      ),
              child: const Text('<'),
            ),
          ),
          const VerticalDivider(
            width: 0.5,
          ),
          Flexible(
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(
                      20.0,
                    ),
                  ),
                ),
              ),
              onPressed: initialPage == 7
                  ? null
                  : () => context.router.popAndPush(
                        ConstitutionPaginationRoute(
                          language: language,
                          title: initialPage + 1,
                        ),
                      ),
              child: const Text('>'),
            ),
          ),
        ],
      ),
    );
  }
}
