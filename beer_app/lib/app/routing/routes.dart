class RouteName {
  RouteName._();

  static const splash = 'splash';
  static const main = 'main';
  static const details = 'details';

}

class RouteParam {
  RouteParam._();
  static const id = "id";
}

class AppRoute {
  final String name;
  final Map<String, String> pathParams, queryParams;
  final Object? extra;

  /// NOTE extra must be serializable!
  AppRoute._(
      this.name, {
        this.pathParams = const {},
        this.queryParams = const {},
        this.extra,
      });

  factory AppRoute.main() => AppRoute._(RouteName.main);
  factory AppRoute.details(int id) =>
      AppRoute._(RouteName.details, pathParams: {RouteParam.id: '$id'});

}
