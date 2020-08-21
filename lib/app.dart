import 'package:flutter/material.dart';
import 'package:tests/home.dart';
import 'colors.dart';

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      home: HomePage(),
      theme: _testTheme,
    );
  }
}

final ThemeData _testTheme = _buildTestTheme();

ThemeData _buildTestTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: _testColorScheme,
    toggleableActiveColor: primaryColor,
    accentColor: secondaryColor,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
//    cardColor: backgroundColor,
    textSelectionColor: primaryColor,
    errorColor: errorColor,
    buttonTheme: const ButtonThemeData(
      colorScheme: _testColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildTestTextTheme(base.textTheme),
    primaryTextTheme: _buildTestTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTestTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
//    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
//      backgroundColor: primaryColor,
//      foregroundColor: primaryTextColor,
//    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        backgroundColor: primaryColor,
        selectedItemColor: secondaryColor,
        unselectedItemColor: secondaryTextColor),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: secondaryColor);
}

TextTheme _buildTestTextTheme(TextTheme base) {
  return base.copyWith(
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
  ).apply(
    displayColor: primaryTextColor,
    bodyColor: primaryTextColor,
  );
}

const ColorScheme _testColorScheme = ColorScheme(
  primary: primaryColor,
  primaryVariant: primaryVariantColor,
  secondary: secondaryColor,
  secondaryVariant: secondaryVariantColor,
  surface: surfaceColor,
  background: backgroundColor,
  error: errorColor,
  onPrimary: onPrimaryColor,
  onSecondary: onSecondaryColor,
  onSurface: onSurfaceColor,
  onBackground: onBackgroundColor,
  onError: onErrorColor,
  brightness: Brightness.light,
);

const defaultLetterSpacing = 0.03;
