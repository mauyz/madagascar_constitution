import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';

class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Revenir à l'accueil",
      icon: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 8.0,
        ),
        child: SvgPicture.asset(
          "assets/mg.svg",
          fit: BoxFit.cover,
        ),
      ),
      onPressed: () {
        context.router.replaceAll(
          [const HomeRoute()],
        );
      },
    );
  }
}
