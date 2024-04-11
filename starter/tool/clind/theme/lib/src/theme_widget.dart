import 'package:core_theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindTheme extends ICoreTheme {
  const ClindTheme({
    super.key,
    required ClindThemeData themeData,
    required super.child,
  }) : super(themeData: themeData);

  static ClindThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ClindTheme>()!.themeData as ClindThemeData;
  }
}
