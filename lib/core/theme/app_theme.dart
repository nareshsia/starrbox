import 'package:flutter/material.dart';
import 'package:starrbox/core/theme/dark_theme.dart';
import 'package:starrbox/core/theme/text_theme.dart';

import 'light_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    brightness: Brightness.light,
    textTheme: poppinsTextThemeLight
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    brightness: Brightness.dark,
      textTheme: poppinsTextThemeLight
  );
}
