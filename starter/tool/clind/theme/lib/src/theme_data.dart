import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tool_clind_theme/gen/gen.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindThemeData extends ICoreThemeData {
  const ClindThemeData({
    required super.appBarTheme,
    required super.textTheme,
    required super.colorScheme,
    required super.navigationBarThemeData,
    required super.dialogTheme,
    required super.dividerTheme,
  });

  factory ClindThemeData.light() {
    return ClindThemeData(
      appBarTheme: ClindAppBarTheme.light(),
      textTheme: const ClindTextTheme(),
      colorScheme: ClindColorScheme.light(),
      navigationBarThemeData: ClindNavigationBarThemeData.light(),
      dialogTheme: ClindDialogTheme.light(),
      dividerTheme: ClindDividerTheme.light(),
    );
  }

  factory ClindThemeData.dark() {
    return ClindThemeData(
      appBarTheme: ClindAppBarTheme.dark(),
      textTheme: const ClindTextTheme(),
      colorScheme: ClindColorScheme.dark(),
      navigationBarThemeData: ClindNavigationBarThemeData.dark(),
      dialogTheme: ClindDialogTheme.dark(),
      dividerTheme: ClindDividerTheme.dark(),
    );
  }
}

class ClindAppBarTheme extends ICoreAppBarTheme {
  const ClindAppBarTheme({
    required super.systemOverlayStyle,
    required super.primaryColor,
    required super.backgroundColor,
    super.toolbarHeight = 44.0,
    super.titleSpacing = 0.0,
    super.centerTitle = true,
  });

  factory ClindAppBarTheme.light() {
    return const ClindAppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      primaryColor: ColorName.gray800,
      backgroundColor: ColorName.white,
    );
  }

  factory ClindAppBarTheme.dark() {
    return const ClindAppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      primaryColor: ColorName.gray200,
      backgroundColor: ColorName.darkBlack,
    );
  }
}

class ClindTextTheme extends ICoreTextTheme {
  const ClindTextTheme();
}

extension on ClindTextTheme {
  TextStyle defaultTextStyleForSize(double size) => TextStyle(
        package: kToolClindThemePackageName,
        fontFamily: FontFamily.pretendard,
        fontSize: size,
        height: size / size,
      );
}

extension ClindTextThemeDefaultExtension on ClindTextTheme {
  // w600
  TextStyle get default20SemiBold => defaultTextStyleForSize(20.0).toSemiBold();

  TextStyle get default17SemiBold => defaultTextStyleForSize(17.0).toSemiBold();

  TextStyle get default16SemiBold => defaultTextStyleForSize(16.0).toSemiBold();

  TextStyle get default15SemiBold => defaultTextStyleForSize(15.0).toSemiBold();

  TextStyle get default14SemiBold => defaultTextStyleForSize(14.0).toSemiBold();

  // w500
  TextStyle get default17Medium => defaultTextStyleForSize(17.0).toMedium();

  TextStyle get default15Medium => defaultTextStyleForSize(15.0).toMedium();

  TextStyle get default14Medium => defaultTextStyleForSize(14.0).toMedium();

  TextStyle get default13Medium => defaultTextStyleForSize(13.0).toMedium();

  TextStyle get default12Medium => defaultTextStyleForSize(12.0).toMedium();

  // w400
  TextStyle get default22Regular => defaultTextStyleForSize(22.0).toRegular();

  TextStyle get default17Regular => defaultTextStyleForSize(17.0).toRegular();

  TextStyle get default16Regular => defaultTextStyleForSize(16.0).toRegular();

  TextStyle get default15Regular => defaultTextStyleForSize(15.0).toRegular();

  TextStyle get default14Regular => defaultTextStyleForSize(14.0).toRegular();

  TextStyle get default13Regular => defaultTextStyleForSize(13.0).toRegular();

  TextStyle get default12Regular => defaultTextStyleForSize(12.0).toRegular();

  TextStyle get default11Regular => defaultTextStyleForSize(11.0).toRegular();

  // w300
  TextStyle get default13Light => defaultTextStyleForSize(13.0).toLight();

  TextStyle get default11Light => defaultTextStyleForSize(11.0).toLight();
}

extension on ClindTextTheme {
  TextStyle poppinsTextStyleForSize(double size) => defaultTextStyleForSize(size).copyWith(
        fontFamily: FontFamily.poppins,
      );
}

extension ClindTextThemePoppinsExtension on ClindTextTheme {
  // w700
  TextStyle get poppins30Bold => poppinsTextStyleForSize(30.0).toBold();

  TextStyle get poppins24Bold => poppinsTextStyleForSize(24.0).toBold();

  TextStyle get poppins18Bold => poppinsTextStyleForSize(18.0).toBold();
}

extension on TextStyle {
  TextStyle toBold() => copyWith(fontWeight: FontWeight.w700);

  TextStyle toSemiBold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle toMedium() => copyWith(fontWeight: FontWeight.w500);

  TextStyle toRegular() => copyWith(fontWeight: FontWeight.w400);

  TextStyle toLight() => copyWith(fontWeight: FontWeight.w300);
}

class ClindColorScheme extends ICoreColorScheme {
  ClindColorScheme({
    required super.brightness,
  });

  factory ClindColorScheme.light() {
    return ClindColorScheme(
      brightness: Brightness.light,
    );
  }

  factory ClindColorScheme.dark() {
    return ClindColorScheme(
      brightness: Brightness.dark,
    );
  }

  bool get isDarkMode => brightness == Brightness.dark;

  Color get white => isDarkMode ? ColorName.white : ColorName.black;

  Color get black => isDarkMode ? ColorName.black : ColorName.white;

  Color get darkBlack => isDarkMode ? ColorName.darkBlack : ColorName.white;

  Color get lightBlack => isDarkMode ? ColorName.lightBlack : ColorName.white;

  Color get darkGray => isDarkMode ? ColorName.darkGray : ColorName.lightGray;

  Color get bg => isDarkMode ? ColorName.bg : ColorName.bg2;

  Color get bg2 => isDarkMode ? ColorName.bg2 : ColorName.bg;

  Color get gray100 => isDarkMode ? ColorName.gray100 : ColorName.gray900;

  Color get gray200 => isDarkMode ? ColorName.gray200 : ColorName.gray800;

  Color get gray300 => isDarkMode ? ColorName.gray300 : ColorName.gray700;

  Color get gray400 => isDarkMode ? ColorName.gray400 : ColorName.gray600;

  Color get gray500 => isDarkMode ? ColorName.gray500 : ColorName.gray500;

  Color get gray600 => isDarkMode ? ColorName.gray600 : ColorName.gray400;

  Color get gray700 => isDarkMode ? ColorName.gray700 : ColorName.gray300;

  Color get gray800 => isDarkMode ? ColorName.gray800 : ColorName.gray200;

  Color get gray900 => isDarkMode ? ColorName.gray900 : ColorName.gray100;
}

class ClindNavigationBarThemeData extends ICoreNavigationBarThemeData {
  const ClindNavigationBarThemeData({
    required super.backgroundColor,
    super.height = 58.0,
  });

  factory ClindNavigationBarThemeData.light() {
    return const ClindNavigationBarThemeData(
      backgroundColor: ColorName.white,
    );
  }

  factory ClindNavigationBarThemeData.dark() {
    return const ClindNavigationBarThemeData(
      backgroundColor: ColorName.darkBlack,
    );
  }
}

class ClindDialogTheme extends ICoreDialogTheme {
  const ClindDialogTheme({
    required super.titleTextStyle,
    required super.backgroundColor,
    required super.confirmTextStyle,
    required super.confirmBackgroundColor,
    required super.cancelTextStyle,
    required super.cancelBackgroundColor,
  });

  factory ClindDialogTheme.light() {
    const ClindTextTheme data = ClindTextTheme();
    return ClindDialogTheme(
      titleTextStyle: data.default15Medium.copyWith(
        color: ColorName.gray800,
      ),
      backgroundColor: ColorName.gray200,
      confirmTextStyle: data.default15SemiBold.copyWith(
        color: ColorName.black,
      ),
      confirmBackgroundColor: ColorName.gray400,
      cancelTextStyle: data.default15Medium.copyWith(
        color: ColorName.gray800,
      ),
      cancelBackgroundColor: ColorName.gray200,
    );
  }

  factory ClindDialogTheme.dark() {
    const ClindTextTheme data = ClindTextTheme();
    return ClindDialogTheme(
      titleTextStyle: data.default15Medium.copyWith(
        color: ColorName.gray200,
      ),
      backgroundColor: ColorName.gray800,
      confirmTextStyle: data.default16SemiBold.copyWith(
        color: ColorName.white,
      ),
      confirmBackgroundColor: ColorName.gray600,
      cancelTextStyle: data.default15Medium.copyWith(
        color: ColorName.gray200,
      ),
      cancelBackgroundColor: ColorName.gray800,
    );
  }
}

class ClindDividerTheme extends ICoreDividerTheme {
  const ClindDividerTheme({
    required super.color,
  });

  factory ClindDividerTheme.light() {
    return const ClindDividerTheme(
      color: ColorName.gray200,
    );
  }

  factory ClindDividerTheme.dark() {
    return const ClindDividerTheme(
      color: ColorName.gray800,
    );
  }
}

extension ClindThemeDataExtension on BuildContext {
  ClindThemeData get themeData {
    return ClindTheme.of(this);
  }

  ClindAppBarTheme get appBarTheme {
    return themeData.appBarTheme as ClindAppBarTheme;
  }

  ClindTextTheme get textTheme {
    return themeData.textTheme as ClindTextTheme;
  }

  ClindColorScheme get colorScheme {
    return themeData.colorScheme as ClindColorScheme;
  }

  ClindNavigationBarThemeData get navigationBarThemeData {
    return themeData.navigationBarThemeData as ClindNavigationBarThemeData;
  }

  ClindDialogTheme get dialogTheme {
    return themeData.dialogTheme as ClindDialogTheme;
  }

  ClindDividerTheme get dividerTheme {
    return themeData.dividerTheme as ClindDividerTheme;
  }
}
