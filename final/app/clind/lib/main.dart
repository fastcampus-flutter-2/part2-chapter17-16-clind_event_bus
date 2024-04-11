import 'dart:async';

import 'package:core_util/util.dart';
import 'package:feature_community/clind.dart';
import 'package:feature_my/clind.dart';
import 'package:feature_notification/clind.dart';
import 'package:feature_search/clind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tool_clind_theme/theme.dart';
import 'package:ui/ui.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ICoreFirebase.initialize();
  await ICoreFirebaseRemoteConfig.initialize();
  await ICoreFirebaseRemoteConfig.fetchAndActivate();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const ClindApp(),
    ),
  );
}

class AppModule extends Module {
  AppModule();

  @override
  List<Module> get imports => [
        ClindModule(),
        CommunityModule(),
        NotificationModule(),
        MyModule(),
        SearchModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton(() => EventBus());

    imports.map((import) => import.binds(i)).toList();
  }

  @override
  void exportedBinds(Injector i) => imports.map((import) => import.exportedBinds(i)).toList();

  @override
  void routes(RouteManager r) => imports.map((import) => import.routes(r)).toList();
}

class ClindApp extends StatefulWidget {
  const ClindApp({super.key});

  @override
  State<ClindApp> createState() => _ClindAppState();
}

class _ClindAppState extends State<ClindApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClindTheme(
      themeData: ClindThemeData.dark(),
      child: MaterialApp.router(
        themeMode: ThemeMode.dark,
        localizationsDelegates: [
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: [
          const Locale('ko'),
        ],
        routerConfig: Modular.routerConfig,
        builder: (context, child) => ClindUriHandlerWidget(
          child: child!,
        ),
      ),
    );
  }
}

class ClindUriHandlerWidget extends StatefulWidget {
  final Widget child;

  const ClindUriHandlerWidget({
    super.key,
    required this.child,
  });

  @override
  State<ClindUriHandlerWidget> createState() => _ClindUriHandlerWidgetState();
}

class _ClindUriHandlerWidgetState extends State<ClindUriHandlerWidget> {
  StreamSubscription<RouteEvent>? _routeEventSubscription;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _subscribeRouteEvent();
    });
    super.initState();
  }

  @override
  void dispose() {
    _unsubscribeRouteEvent();
    super.dispose();
  }

  void _subscribeRouteEvent() {
    _routeEventSubscription = Modular.get<EventBus>().on<RouteEvent>().listen((event) {
      _open(event.route);
    });
  }

  void _unsubscribeRouteEvent() {
    _routeEventSubscription?.cancel();
    _routeEventSubscription = null;
  }

  Future<void> _open(String route) async {
    final Uri uri = Uri.tryParse(route) ?? Uri();

    int? tabIndex;
    if (uri.path == CommunityRoute.community.path) {
      tabIndex = 0;
    } else if (uri.path == NotificationRoute.notification.path) {
      tabIndex = 1;
    } else if (uri.path == MyRoute.my.path) {
      tabIndex = 2;
    }

    if (tabIndex != null) {
      Modular.get<EventBus>().fire(HomeTabEvent(tabIndex));

      if (tabIndex == 0) {
        final int nestedTabIndex = switch (uri.queryParameters['type'] ?? '') {
          'popular' => 1,
          _ => 0,
        };
        Modular.get<EventBus>().fire(CommunityNestedTabEvent(nestedTabIndex));
      }

      return;
    }

    Modular.to.pushNamed(
      uri.path,
      arguments: {
        ...uri.queryParameters,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
