import 'package:flutter/material.dart';
import 'color.dart';

final ColorScheme darkColorScheme = ColorScheme.dark(
  primary: primaryColor,
  onPrimary: Colors.black,
  secondary: secondaryColor,
  onSecondary: Colors.black,
  surface: Color(0xFF1E1E1E),
  onSurface: Colors.white,
  error: Colors.red[400]!,
  onError: Colors.black,
  tertiary: Colors.black26,
  onTertiary: Colors.white24,
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  brightness: Brightness.dark,
);
