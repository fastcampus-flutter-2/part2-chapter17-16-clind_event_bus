import 'package:core_util/util.dart';
import 'package:feature_my/clind.dart';
import 'package:flutter/material.dart';
import 'package:my_di/di.dart';

enum MyRoute {
  my,
  unknown;

  static String encode(MyRoute value) => value.path;

  static MyRoute decode(String value) => MyRoute.values.firstWhere(
        (e) => e.path == value,
        orElse: () => MyRoute.unknown,
      );
}

extension MyRouteExtension on MyRoute {
  String get path {
    if (this == MyRoute.my) return '/$name';
    return '${MyRoute.my.path}/$name';
  }
}

abstract class IMyRoutes {
  static List<ModularRoute> routes = MyRoute.values.map(_find).toList();

  static ModularRoute _find(MyRoute route) {
    return ChildRoute(
      route.path,
      child: (context) => findScreen(Uri.parse(route.path)),
      transition: _findTransitionType(route),
    );
  }

  static TransitionType? _findTransitionType(MyRoute route) {
    switch (route) {
      default:
        return null;
    }
  }

  static Route<dynamic> find(RouteSettings settings) {
    final Uri uri = Uri.tryParse(settings.name ?? '') ?? Uri();
    final Map<String, String> queryParameters = {...uri.queryParameters};
    final bool fullscreenDialog = bool.tryParse(queryParameters['fullscreenDialog'] ?? '') ?? false;
    return MaterialPageRoute(
      builder: (context) => findScreen(uri),
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Widget findScreen(Uri uri) {
    final MyRoute route = MyRoute.decode(uri.path);
    switch (route) {
      case MyRoute.my:
        return const MyBlocProvider(
          child: MyScreen(),
        );
      case MyRoute.unknown:
        return const SizedBox();
    }
  }
}

abstract class IMyRouteTo {
  static Future<T?> push<T extends Object?>({
    required MyRoute route,
    Map<String, String>? queryParameters,
  }) {
    return Modular.to.pushNamed<T>(
      route.path,
      arguments: queryParameters,
    );
  }

  static Future<void> my() {
    return push<void>(
      route: MyRoute.my,
    );
  }
}
