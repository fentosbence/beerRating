import 'package:beer_app/app/routing/routes.dart';
import 'package:beer_app/page/detail/details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:beer_app/page/main/main_page.dart';
import 'package:beer_app/page/splash/splash_page.dart';
import 'go_router_utils.dart';

class AppRouter {
  final GoRouter _router;
  final AppRouteObserver _observer;

  RouterConfig<Object> get routerConfig => _router;

  AppRouter._(this._router, this._observer);

  factory AppRouter.create() {
    final observer = AppRouteObserver();
    final router = GoRouter(
      restorationScopeId: 'router',
      initialLocation: '/splash',
      observers: [observer],
      routes: [
        GoRoute(
          path: '/splash',
          name: RouteName.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/beers',
          name: RouteName.main,
          builder: (context, state) => const MainPage(),
          routes: [
            GoRoute(
              path: "beer/:id",
              name: RouteName.details,
              builder: (context, state) {
                return DetailsPage(
                  id: state.intFromPathParams(RouteParam.id),
                );
              },
            ),
          ],
        ),
      ],
    );

    return AppRouter._(router, observer);
  }

  void push(AppRoute appRoute) {
    _router.pushNamed(
      appRoute.name,
      params: appRoute.pathParams,
      queryParams: appRoute.queryParams,
      extra: appRoute.extra,
    );
  }

  void set(AppRoute appRoute) {
    _router.goNamed(
      appRoute.name,
      params: appRoute.pathParams,
      queryParams: appRoute.queryParams,
      extra: appRoute.extra,
    );
  }

  void pop() {
    _router.pop();
  }

  void subscribe(RouteAware routeAware, Route route) {
    _observer.subscribe(routeAware, route);
  }

  void unsubscribe(RouteAware routeAware) {
    _observer.unsubscribe(routeAware);
  }
}
