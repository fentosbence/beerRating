import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouteObserver extends RouteObserver<Route<dynamic>> {
  AppRouteObserver();
}

class ModalGoRoute extends GoRoute {
  ModalGoRoute({
    required String path,
    required GoRouterWidgetBuilder builder,
    bool modal = false,
    String? name,
    List<GoRoute> routes = const <GoRoute>[],
  }) : super(
          path: path,
          name: name,
          routes: routes,
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              fullscreenDialog: modal,
              child: builder(context, state),
            );
          },
        );
}

extension GoRouterStateExtension on GoRouterState {
  int intFromPathParams(String key) {
    return int.parse(params[key]!);
  }
}
