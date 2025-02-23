import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:madagascar_constitution/core/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

void showCustomAboutDialog({
  required BuildContext context,
  required Widget applicationIcon,
  bool barrierDismissible = true,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CustomAboutDialog(applicationIcon: applicationIcon);
    },
  );
}

class CustomAboutDialog extends StatelessWidget {
  const CustomAboutDialog({
    super.key,
    required this.applicationIcon,
  });

  final Widget applicationIcon;

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
                        AppConstants.appTitle,
                        style: themeData.textTheme.headlineSmall,
                      ),
                      Text(
                        AppConstants.appVersion,
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
                    height: 10.0,
                  ),
                  Text(
                    AppConstants.aboutApp,
                    style: themeData.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(
                        Icons.warning,
                        size: 14,
                        color: Colors.red,
                      ),
                      Expanded(
                        child: Text(
                          AppConstants.warning,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppConstants.appClause,
                    style: themeData.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SelectableLinkify(
                    text: AppConstants.source,
                    style: themeData.textTheme.bodySmall,
                    onOpen: (link) async {
                      if (await canLaunchUrl(Uri.parse(link.url))) {
                        launchUrl(Uri.parse(link.url));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SelectableLinkify(
                    text: "Contact du développeur : ${AppConstants.mauyzEmail}",
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
                    AppConstants.copyright,
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
              applicationName: AppConstants.appTitle,
              applicationVersion: AppConstants.appVersion,
              applicationIcon: applicationIcon,
              applicationLegalese:
                  "${AppConstants.warning}\n\n${AppConstants.appClause}"
                  "\n\n${AppConstants.copyright}",
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
