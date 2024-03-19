import 'package:auto_route/auto_route.dart';
import 'package:milk_points/presentation/routes/route_path.dart';

import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
  deferredLoading: true,
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      guards: const [],
      path: RoutePath.rootPath,
      children: const [],
      initial: true,
    ),
    AutoRoute(
      page: CustomerDetailRoute.page,
      path: RoutePath.detail,
    ),
  ];
}
