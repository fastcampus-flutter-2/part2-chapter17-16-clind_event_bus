import 'package:core_util/util.dart';
import 'package:feature_notification/clind.dart';
import 'package:flutter/material.dart';
import 'package:notification_di/di.dart';

enum NotificationRoute {
  notification,
  unknown;

  static String encode(NotificationRoute value) => value.path;

  static NotificationRoute decode(String value) => NotificationRoute.values.firstWhere(
        (e) => e.path == value,
        orElse: () => NotificationRoute.unknown,
      );
}

extension NotificationRouteExtension on NotificationRoute {
  String get path {
    if (this == NotificationRoute.notification) return '/$name';
    return '${NotificationRoute.notification.path}/$name';
  }
}

abstract class INotificationRoutes {
  static List<ModularRoute> routes = NotificationRoute.values.map(_find).toList();

  static ModularRoute _find(NotificationRoute route) {
    return ChildRoute(
      route.path,
      child: (context) => findScreen(Uri.parse(route.path)),
      transition: _findTransitionType(route),
    );
  }

  static TransitionType? _findTransitionType(NotificationRoute route) {
    switch (route) {
      default:
        return null;
    }
  }

  static Widget findScreen(Uri uri) {
    final NotificationRoute route = NotificationRoute.decode(uri.path);
    switch (route) {
      case NotificationRoute.notification:
        return const NotificationBlocProvider(
          child: NotificationScreen(),
        );
      case NotificationRoute.unknown:
        return const SizedBox();
    }
  }
}

abstract class INotificationRouteTo {
  static Future<T?> push<T extends Object?>({
    required NotificationRoute route,
    Map<String, String>? queryParameters,
  }) {
    return Modular.to.pushNamed<T>(
      route.path,
      arguments: queryParameters,
    );
  }

  static Future<void> notification() {
    return push<void>(
      route: NotificationRoute.notification,
    );
  }
}
