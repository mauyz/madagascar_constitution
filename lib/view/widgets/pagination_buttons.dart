import 'package:flutter/material.dart';
import 'package:madagascar_constitution/viewmodel/pagination_view_model.dart';

class PaginationButtons extends StatelessWidget {
  final PaginationViewModel paginationViewModel;
  const PaginationButtons({
    super.key,
    required this.paginationViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final currentPage = paginationViewModel.page;
    final children = [
      FilledButton(
        style: FilledButton.styleFrom(
          shape: const LinearBorder(),
        ),
        onPressed:
            currentPage == -1 ? null : () => paginationViewModel.previousPage(),
        child: const Text('<'),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          '${currentPage + 2}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      FilledButton(
        style: FilledButton.styleFrom(
          shape: const LinearBorder(),
        ),
        onPressed:
            currentPage == 6 ? null : () => paginationViewModel.nextPage(),
        child: const Text('>'),
      ),
    ];
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        if (boxConstraints.maxWidth < 200) {
          return Container(
            color: Theme.of(context).secondaryHeaderColor,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          );
        }
        return Container(
          color: Theme.of(context).secondaryHeaderColor,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        );
      },
    );
  }
}
