import 'package:flutter/material.dart';

class LightTheme {
  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffFF8A37),
    onPrimary: Color(0xff1E1E1E),
    primaryContainer: Color(0xffFF8A37),
    onPrimaryContainer: Color(0xffffffff),

    secondary: Color(0xDD000000),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xDD000000),
    onSecondaryContainer: Color(0xffffffff),

    tertiary: Color(0xffd9d9d9),

    error: Color(0xffd32f2f),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffef9a9a),

    surface: Color(0xffe5e5e5),
    onSurface: Color(0xffe5e5e5),


  );

  static ThemeData get theme {
    return ThemeData(
      colorScheme: colorScheme,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.all(14),
        ),
      ),
    );
  }
}
