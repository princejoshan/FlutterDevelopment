import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
  String questionText;
  // ignore: use_key_in_widget_constructors
  Question(this.questionText);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }
}
