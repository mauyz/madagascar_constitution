import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

void showCustomAboutDialog({
  required BuildContext context,
  required String applicationName,
  required String applicationVersion,
  required Widget applicationIcon,
  required String applicationLegalese,
  required String copyright,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return CustomAboutDialog(
        applicationName: applicationName,
        applicationVersion: applicationVersion,
        applicationIcon: applicationIcon,
        applicationLegalese: applicationLegalese,
        copyright: copyright,
      );
    },
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}

class CustomAboutDialog extends StatelessWidget {
  const CustomAboutDialog({
    super.key,
    required this.applicationName,
    required this.applicationVersion,
    required this.applicationIcon,
    required this.applicationLegalese,
    required this.copyright,
  });

  final String applicationName;

  final String applicationVersion;

  final Widget applicationIcon;

  final String applicationLegalese;

  final String copyright;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return AlertDialog(
      insetPadding: const EdgeInsets.all(
        15.0,
      ),
      contentPadding: const EdgeInsets.all(
        10.0,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Flexible(
                child: IconTheme(
                  data: themeData.iconTheme,
                  child: applicationIcon,
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        applicationName,
                        style: themeData.textTheme.headlineSmall,
                      ),
                      Text(
                        applicationVersion,
                        style: themeData.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ListBody(
                children: <Widget>[
                  const SizedBox(
                    height: 15.0,
                  ),
                  SelectableLinkify(
                    text: applicationLegalese,
                    style: themeData.textTheme.bodySmall,
                    onOpen: (link) async {
                      if (await canLaunchUrl(Uri.parse(link.url))) {
                        launchUrl(Uri.parse(link.url));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    copyright,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Voir licences"),
          onPressed: () {
            showLicensePage(
              context: context,
              applicationName: applicationName,
              applicationVersion: applicationVersion,
              applicationIcon: applicationIcon,
              applicationLegalese: "$applicationLegalese\n\n$copyright",
            );
          },
        ),
        TextButton(
          child: const Text("Fermer"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      scrollable: true,
    );
  }
}
