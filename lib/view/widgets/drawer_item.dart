import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Function() onTap;

  const DrawerItem({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: onTap,
              child: Text(
                title,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: ListTile(
              tileColor: Colors.green.withValues(
                alpha:
                    Theme.of(context).brightness == Brightness.dark ? 0.1 : 0.2,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(
                    100.0,
                  ),
                ),
              ),
              titleAlignment: ListTileTitleAlignment.center,
              leading: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  icon,
                  size: 16,
                ),
              ),
              title: Text(
                title,
                maxLines: 1,
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
