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
  void binds(Injector i) => imports.map((import) => import.binds(i)).toList();

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
      ),
    );
  }
}
