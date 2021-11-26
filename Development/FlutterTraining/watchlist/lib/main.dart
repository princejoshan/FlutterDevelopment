import 'package:flutter/material.dart';
import 'Views/contact_list.dart';
import './Helper/app_constants.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MyWatchlistConstants.myWatchListTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(MyWatchlistConstants.MyWatchListtitle,
              style: const TextStyle(color: Colors.blue)),
          bottom: const TabBar(
            tabs: MyWatchlistConstants.myWatchListTabs,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: MyWatchlistConstants.myWatchListTabs.map((Tab tab) {
            return const MyWatclist();
          }).toList(),
        ),
      ),
    );
  }
}
