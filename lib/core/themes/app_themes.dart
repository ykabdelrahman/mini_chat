import 'package:flutter/material.dart';
import 'colors_manager.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorsManager.bgColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: ColorsManager.bgColor,
      ));
}
