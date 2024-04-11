import 'package:flutter/widgets.dart';

import 'theme_data.dart';

abstract class ICoreTheme extends InheritedWidget {
  final ICoreThemeData themeData;

  const ICoreTheme({
    super.key,
    required this.themeData,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant ICoreTheme oldWidget) {
    return themeData != oldWidget.themeData;
  }
}
