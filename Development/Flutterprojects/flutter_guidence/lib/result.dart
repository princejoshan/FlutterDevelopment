import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  int total = 0;
  // ignore: use_key_in_widget_constructors
  Result(this.total);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('you have done it $total'),
    );
  }
}
