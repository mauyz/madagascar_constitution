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
    return Container(
      decoration: selected
          ? BoxDecoration(
              color: Colors.green.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.1 : 0.5,
              ),
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(
                  100,
                ),
              ),
            )
          : null,
      child: ListTile(
        selected: selected,
        titleAlignment: ListTileTitleAlignment.center,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: icon,
        ),
        title: Text(
          title,
        ),
        onTap: onTap,
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 17,
        ),
      ),
    );
  }
}
