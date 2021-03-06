import 'package:contact_bloc/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/contact_bloc.dart';
import 'package:contact_bloc/helper/constants.dart';
import 'package:contact_bloc/view/contact.dart';
import 'package:contact_bloc/bloc/theme_bloc.dart';

void main() {
  runApp(const MaterialApp(home: AppHomePage()));
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _MyAppState();
}

class _MyAppState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.appThemeState,
            home: BlocProvider(
              create: (context) => ContactListBloc(),
              child: const ContactsScreen(),
            ),
          );
        },
      ),
    );
  }
}
