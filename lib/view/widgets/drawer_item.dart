import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function() onTap;
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      leading: icon,
      title: Text(
        title,
      ),
      onTap: onTap,
    );
  }
}
