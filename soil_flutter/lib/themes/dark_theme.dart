import 'package:flutter/material.dart';

class DarkTheme {
  static const colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffFF8A37),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffFF8A37),
    onPrimaryContainer: Color(0xffffffff),

    secondary: Color(0xDDFFFFFF),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xDDFFFFFF),
    onSecondaryContainer: Color(0xffffffff),

    tertiary: Color(0xff2d2d2d),
    onTertiary: Color(0xffd9d9d9),

    error: Color(0xffd32f2f),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffef9a9a),

    surface: Color(0xff1E1E1E),
    onSurface: Color(0xffffffff),


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
