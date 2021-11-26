// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc100/UI_Files/home_screen.dart';
import 'package:bloc100/bloc/contacts_bloc.dart';
import 'package:bloc100/bloc/theme_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc100/main.dart';

void main() {
  testWidgets('Sorting and theme widget test', (WidgetTester tester) async {
    // await tester.pumpWidget(const MyApp());

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) => ContactsBloc(),
        child: const HomePage(),
      ),
    ));
    var settingsIcons = find.byIcon(Icons.settings);
    await tester.tap(settingsIcons);
    await tester.pump();

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) => ThemeDataBloc(),
        child: const MyApp(),
      ),
    ));
    var themeOptions = find.text('Light Theme');
    expect(themeOptions, findsOneWidget);
  });
}
