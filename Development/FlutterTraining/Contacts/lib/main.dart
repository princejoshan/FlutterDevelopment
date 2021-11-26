import 'package:flutter/material.dart';
import './mywatchlist.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'MyWatchlist1'),
    const Tab(text: 'MyWatchlist2'),
    const Tab(text: 'MyWatchlist3'),
    // const Tab(text: 'MyWatchlist4'),
    // const Tab(text: 'MyWatchlist5'),
  ];

  var watchlistData = [
    {
      'watchlistName': 'MyWatchlist1',
      'answers': [
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'CTS', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'ZOHO', 'LTP': 3000, 'Chp': '0.5(50%)'}
      ]
    },
    {
      'watchlistName': 'MyWatchlist2',
      'answers': [
        {'Symbol': 'ALPHABET', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'APPLE', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'MICROSOFT', 'LTP': 3000, 'Chp': '0.5(50%)'}
      ]
    },
    {
      'watchlistName': 'MyWatchlist3',
      'answers': [
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'}
      ]
    },
    {
      'watchlistName': 'MyWatchlist4',
      'answers': [
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'}
      ]
    },
    {
      'watchlistName': 'MyWatchlist5',
      'answers': [
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'},
        {'Symbol': 'TCS', 'LTP': 3000, 'Chp': '0.5(50%)'}
      ]
    }
  ];

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MyWatchlist'),
          bottom: TabBar(
            tabs: myTabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            return MyWatclist(watchlistData, tab.text as String);
          }).toList(),
        ),
      ),
    );
  }
}
