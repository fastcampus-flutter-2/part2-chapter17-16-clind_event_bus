import 'package:community_di/di.dart';
import 'package:core_util/util.dart';
import 'package:feature_community/clind.dart';
import 'package:flutter/material.dart';

enum CommunityRoute {
  community,
  post,
  write,
  unknown;

  static String encode(CommunityRoute value) => value.path;

  static CommunityRoute decode(String value) => CommunityRoute.values.firstWhere(
        (e) => e.path == value,
        orElse: () => CommunityRoute.unknown,
      );
}

extension CommunityRouteExtension on CommunityRoute {
  String get path {
    if (this == CommunityRoute.community) return '/$name';
    return '${CommunityRoute.community.path}/$name';
  }
}

abstract class ICommunityRoutes {
  static List<ModularRoute> routes = CommunityRoute.values.map(_find).toList();

  static ModularRoute _find(CommunityRoute route) {
    return ChildRoute(
      route.path,
      child: (context) => findScreen(Uri.parse(route.path)),
      transition: _findTransitionType(route),
    );
  }

  static TransitionType? _findTransitionType(CommunityRoute route) {
    switch (route) {
      case CommunityRoute.write:
        return TransitionType.downToUp;
      default:
        return null;
    }
  }

  static Widget findScreen(Uri uri) {
    final CommunityRoute route = CommunityRoute.decode(uri.path);
    switch (route) {
      case CommunityRoute.community:
        return const CommunityBlocProvider(
          child: CommunityScreen(),
        );
      case CommunityRoute.post:
        final String id = Modular.args.data?['id'] as String? ?? '';
        return PostBlocProvider(
          child: PostScreen(
            id: id,
          ),
        );
      case CommunityRoute.write:
        return const WriteBlocProvider(
          child: WriteScreen(),
        );
      case CommunityRoute.unknown:
        return const SizedBox();
    }
  }
}

abstract class ICommunityRouteTo {
  static Future<T?> push<T extends Object?>({
    required CommunityRoute route,
    Map<String, String>? queryParameters,
  }) {
    return Modular.to.pushNamed<T>(
      route.path,
      arguments: queryParameters,
    );
  }

  static Future<void> community() {
    return push<void>(
      route: CommunityRoute.community,
    );
  }

  static Future<void> post({
    required String id,
  }) {
    return push<void>(
      route: CommunityRoute.post,
      queryParameters: {
        'id': id,
      },
    );
  }

  static Future<void> write() {
    return push<void>(
      route: CommunityRoute.write,
    );
  }
}
