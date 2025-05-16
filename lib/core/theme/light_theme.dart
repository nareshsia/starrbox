import 'package:flutter/material.dart';
import 'color.dart';

final ColorScheme lightColorScheme = ColorScheme.light(
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    tertiary: Colors.grey.shade100,
    onTertiary: Colors.grey.shade600
);
