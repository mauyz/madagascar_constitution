import 'package:auto_route/auto_route.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: "/",
          children: [
            AutoRoute(
              path: 'mg',
              page: TabContentRoute.page,
            ),
            AutoRoute(
              path: 'fr',
              page: TabContentRoute.page,
            ),
            AutoRoute(
              path: 'en',
              page: TabContentRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: "/page",
          page: ConstitutionPaginationRoute.page,
        ),
        AutoRoute(
          path: "/article",
          page: ArticleContentRoute.page,
        ),
        AutoRoute(
          path: "/search",
          page: SearchContentRoute.page,
        ),
      ];
}
