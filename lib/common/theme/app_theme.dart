import 'package:flutter/material.dart';

import 'color_schemes.g.dart';
import 'custom_color.g.dart';

class AppTheme {
  final String key;
  final ThemeData theme;

  AppTheme(this.key, this.theme);

  static const String system = 'system';
  static const String light = 'light';
  static const String dark = 'dark';
  static const String warm = 'warm';

  static final lightTheme = ThemeData.light().copyWith(
    colorScheme: lightColorScheme,
    extensions: [lightCustomColors],
    bottomAppBarTheme: BottomAppBarTheme(
      color: lightColorScheme.surface,
      surfaceTintColor: lightColorScheme.surfaceTint,
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    extensions: [darkCustomColors],
    bottomAppBarTheme: BottomAppBarTheme(
      color: darkColorScheme.surface,
      surfaceTintColor: darkColorScheme.surfaceTint,
    ),
  );

  // 暖阳色
  static final warmTheme = ThemeData.light().copyWith(
    colorScheme: warmColorScheme,
    bottomAppBarTheme: BottomAppBarTheme(
      color: warmColorScheme.surface,
      surfaceTintColor: warmColorScheme.surfaceTint,
    ),
  );
}
