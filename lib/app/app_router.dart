import 'package:auto_route/auto_route.dart';
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
            AutoRoute(
              path: "articles/:language",
              page: ConstitutionPaginationRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: "/articles/:language/:id",
          page: ArticleContentRoute.page,
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
