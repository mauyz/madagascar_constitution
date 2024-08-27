import 'package:flutter/material.dart';
import 'package:madagascar_constitution/viewmodel/pagination_view_model.dart';

class PaginationButtons extends StatelessWidget {
  final PageController pageController;
  final PaginationViewModel paginationViewModel;
  const PaginationButtons({
    super.key,
    required this.pageController,
    required this.paginationViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final currentPage = paginationViewModel.page;
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
              onPressed: currentPage == 0
                  ? null
                  : () => pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
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
              onPressed: currentPage == 7
                  ? null
                  : () => pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      ),
              child: const Text('>'),
            ),
          ),
        ],
      ),
    );
  }
}
