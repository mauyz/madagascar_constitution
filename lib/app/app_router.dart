import 'package:auto_route/auto_route.dart';
import 'package:madagascar_constitution/app/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: "/",
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
