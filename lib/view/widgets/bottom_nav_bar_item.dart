import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final Widget icon;
  final String? label;

  const BottomNavBarItem({
    super.key,
    required this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: icon,
        ),
        if (label != null)
          Flexible(
            child: Text(
              label!,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          )
      ],
    );
  }
}
