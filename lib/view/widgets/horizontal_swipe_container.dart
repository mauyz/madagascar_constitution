import 'package:flutter/material.dart';

class HorizontalSwipeContainer extends StatelessWidget {
  final Function()? onSwipeLeft;
  final Function()? onSwipeRight;
  final Widget child;
  const HorizontalSwipeContainer({
    super.key,
    this.onSwipeLeft,
    this.onSwipeRight,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Offset? startPosition;
    Offset? updatePosition;
    return GestureDetector(
      onPanStart: (details) => startPosition = details.globalPosition,
      onPanUpdate: (details) => updatePosition = details.globalPosition,
      onPanEnd: (_) => _executeSwipe(
        context,
        startPosition,
        updatePosition,
      ),
      child: child,
    );
  }

  void _executeSwipe(
    BuildContext context,
    Offset? startPosition,
    Offset? updatePosition,
  ) {
    if (startPosition == null || updatePosition == null) {
      return;
    }
    final offset = updatePosition - startPosition;
    if (offset.dx.abs() > offset.dy.abs()) {
      if (offset.dx > 0) {
        onSwipeLeft?.call();
      } else {
        onSwipeRight?.call();
      }
    }
  }
}
