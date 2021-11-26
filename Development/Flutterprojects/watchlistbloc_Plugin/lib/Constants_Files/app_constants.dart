import 'package:flutter/material.dart';

class Constants {
  static const String contactTitle = 'CONTACTS';
  // static const String watchlistTitle1 = 'Contact 1';
  // static const String watchlistTitle2 = 'Contact 2';
  static const String networkNotAvailableMsg =
      'Network not availble to load the data';
  static const String apiError = 'Failed to the data';

  static const String sorting = 'Sorting';
  static const String alphabetically = 'Alphabetically';
  static const String userID = 'User ID';
  static const String alphabetAscending = 'A - Z';
  static const String alphabetDecending = 'Z - A';
  static const String numericAscending = '0 - 9';
  static const String numericDecending = '9 - 0';
  static const String done = 'Done';
  static const String emptyImg = 'lib/Assests/person.png';
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Contact 1'),
    Tab(text: 'Contact 2'),
    Tab(text: 'Contact 3'),
    Tab(text: 'Contact 4'),
    Tab(text: 'Contact 5'),
  ];
  static const String lightTheme = 'Light';
  static const String darkTheme = 'Dark';
  static const String systemTheme = 'System';
}
