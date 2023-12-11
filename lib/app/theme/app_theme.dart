import 'package:flutter/material.dart';

import 'color_schemes.g.dart';
import 'custom_color.g.dart';

class AppTheme {
  AppTheme._(); //this is to prevent anyone from instantiating this object

  static final lightTheme = ThemeData.light().copyWith(
    colorScheme: lightColorScheme,
    extensions: [lightCustomColors],
  );

  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    extensions: [darkCustomColors],
  );
}
