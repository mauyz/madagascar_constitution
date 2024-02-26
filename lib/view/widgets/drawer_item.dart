import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final bool selected;
  final Function() onTap;
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      titleAlignment: ListTileTitleAlignment.center,
      leading: icon,
      title: Text(
        title,
      ),
      onTap: onTap,
    );
  }
}
