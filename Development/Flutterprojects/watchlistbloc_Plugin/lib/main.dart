import 'package:bloc100/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UI_Files/home_screen.dart';

import 'bloc/contacts_bloc.dart';
import 'bloc/theme_data_bloc.dart';
import 'bloc/theme_data_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrences().init(); // Call sharedpreference class here
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeDataBloc(),
      child: BlocBuilder<ThemeDataBloc, ThemeDataState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: BlocProvider(
              create: (context) => ContactsBloc(),
              child: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
