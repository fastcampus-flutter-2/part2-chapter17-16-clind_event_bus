import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ICoreThemeData {
  final ICoreAppBarTheme appBarTheme;
  final ICoreTextTheme textTheme;
  final ICoreColorScheme colorScheme;
  final ICoreNavigationBarThemeData navigationBarThemeData;
  final ICoreDialogTheme dialogTheme;
  final ICoreDividerTheme dividerTheme;

  const ICoreThemeData({
    required this.appBarTheme,
    required this.textTheme,
    required this.colorScheme,
    required this.navigationBarThemeData,
    required this.dialogTheme,
    required this.dividerTheme,
  });
}

abstract class ICoreAppBarTheme {
  final SystemUiOverlayStyle systemOverlayStyle;
  final Color primaryColor;
  final Color backgroundColor;
  final double toolbarHeight;
  final double titleSpacing;
  final bool centerTitle;

  const ICoreAppBarTheme({
    required this.systemOverlayStyle,
    required this.primaryColor,
    required this.backgroundColor,
    required this.toolbarHeight,
    required this.titleSpacing,
    required this.centerTitle,
  });
}

abstract class ICoreTextTheme {
  const ICoreTextTheme();
}

abstract class ICoreColorScheme {
  final Brightness brightness;

  const ICoreColorScheme({
    required this.brightness,
  });
}

abstract class ICoreNavigationBarThemeData {
  final Color backgroundColor;
  final double height;

  const ICoreNavigationBarThemeData({
    required this.backgroundColor,
    required this.height,
  });
}

abstract class ICoreDialogTheme {
  final TextStyle titleTextStyle;
  final Color backgroundColor;
  final TextStyle confirmTextStyle;
  final Color confirmBackgroundColor;
  final TextStyle cancelTextStyle;
  final Color cancelBackgroundColor;

  const ICoreDialogTheme({
    required this.titleTextStyle,
    required this.backgroundColor,
    required this.confirmTextStyle,
    required this.confirmBackgroundColor,
    required this.cancelTextStyle,
    required this.cancelBackgroundColor,
  });
}

abstract class ICoreDividerTheme {
  final Color color;

  const ICoreDividerTheme({
    required this.color,
  });
}
