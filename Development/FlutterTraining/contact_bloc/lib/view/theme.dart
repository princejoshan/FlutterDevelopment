import 'package:flutter/material.dart';

class AppTheme {
  static final Map appThemeData = {
    AppThemeEnum.lightTheme: ThemeData(
      brightness: Brightness.light,
      //primarySwatch: Colors.blue,
    ),
    AppThemeEnum.darkTheme: ThemeData(
      brightness: Brightness.dark,
      //primarySwatch: Colors.blue,
    ),
  };
}

enum AppThemeEnum { lightTheme, darkTheme }
