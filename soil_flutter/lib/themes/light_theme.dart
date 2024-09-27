import 'package:flutter/material.dart';

class LightTheme {
  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffFF8A37),
    onPrimary: Color(0xff1E1E1E),
    primaryContainer: Color(0xffFF8A37),
    onPrimaryContainer: Color(0xff1E1E1E),

    secondary: Color(0xDD000000),
    onSecondary: Color(0xff1E1E1E),
    secondaryContainer: Color(0xDD000000),
    onSecondaryContainer: Color(0xff1E1E1E),

    tertiary: Color(0xffd9d9d9),
    onTertiary: Color(0xff2d2d2d),

    error: Color(0xffd32f2f),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffef9a9a),

    surface: Color(0xffe5e5e5),
    onSurface: Color(0xff1E1E1E),


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
