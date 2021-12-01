import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class ThemeClass extends StatelessWidget {
  final Brightness _selectedTheme;
  // ignore: use_key_in_widget_constructors
  const ThemeClass(this._selectedTheme);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
    );
  }
}
