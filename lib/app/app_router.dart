import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: "/",
          page: dashBoard.page,
          children: [
            AutoRoute(
              path: "",
              page: HomeRoute.page,
            ),
            CustomRoute(
              path: "articles/:language",
              page: ConstitutionPaginationRoute.page,
              transitionsBuilder: (context, animation, __, child) {
                final args = context.router.current.args;
                if (args is ConstitutionPaginationRouteArgs &&
                    args.useDefaultAnimation == false) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                }
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              durationInMilliseconds: 400,
            ),
          ],
        ),
        CustomRoute(
          path: "/articles/:language/:id",
          page: ArticleContentRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
          durationInMilliseconds: 400,
        ),
        AutoRoute(
          path: "/search",
          page: SearchContentRoute.page,
        ),
        AutoRoute(
          path: "/404",
          page: NotFoundRoute.page,
        ),
        RedirectRoute(
          path: "*",
          redirectTo: "/404",
        ),
      ];
}

const dashBoard = EmptyShellRoute("DashBoard");
