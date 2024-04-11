import 'package:core_util/util.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

enum ClindRoute {
  root,
  unknown;

  static String encode(ClindRoute value) => value.path;

  static ClindRoute decode(String value) => ClindRoute.values.firstWhere(
        (e) => e.path == value,
        orElse: () => ClindRoute.unknown,
      );
}

extension ClindRouteExtension on ClindRoute {
  String get path {
    const String root = '/';
    if (this == ClindRoute.root) return root;
    return '$root$name';
  }
}

abstract class IClindRoutes {
  static List<ModularRoute> routes = ClindRoute.values.map(_find).toList();

  static ModularRoute _find(ClindRoute route) {
    return ChildRoute(
      route.path,
      child: (context) => findScreen(Uri.parse(route.path)),
      transition: _findTransitionType(route),
    );
  }

  static TransitionType? _findTransitionType(ClindRoute route) {
    switch (route) {
      default:
        return null;
    }
  }

  static Widget findScreen(Uri uri) {
    final ClindRoute route = ClindRoute.decode(uri.path);
    switch (route) {
      case ClindRoute.root:
        return const HomeBlocProvider(
          child: HomeScreen(),
        );
      case ClindRoute.unknown:
        return const SizedBox();
    }
  }
}

abstract class IClindRouteTo {
  static Future<T?> push<T extends Object?>({
    required ClindRoute route,
    Map<String, String>? queryParameters,
  }) {
    return Modular.to.pushNamed<T>(
      route.path,
      arguments: queryParameters,
    );
  }

  static Future<void> root() {
    return push<void>(
      route: ClindRoute.root,
    );
  }
}
