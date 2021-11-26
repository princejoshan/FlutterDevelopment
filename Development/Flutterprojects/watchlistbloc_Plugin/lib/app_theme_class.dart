import 'package:flutter/material.dart';

class AppThemeClass {
  static final Map appThemeData = {
    AppThemeEnum.lightTheme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    ),
    AppThemeEnum.darkTheme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.yellow,
    ),
  };
}

enum AppThemeEnum { lightTheme, darkTheme }
