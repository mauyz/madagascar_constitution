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
              page: ContentRoute.page,
            ),
            AutoRoute(
              path: 'fr',
              page: ContentRoute.page,
            ),
            AutoRoute(
              path: 'en',
              page: ContentRoute.page,
            ),
          ],
        ),
      ];
}
