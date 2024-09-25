import 'package:flutter/material.dart';

class PaginationButtons extends StatelessWidget {
  final Function()? onPreviousTap;
  final Function()? onNextTap;
  const PaginationButtons({
    super.key,
    this.onPreviousTap,
    this.onNextTap,
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
              onPressed: onPreviousTap,
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
              onPressed: onNextTap,
              child: const Text('>'),
            ),
          ),
        ],
      ),
    );
  }
}
