import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function()? selectHandler;
  final String answerText;
  // ignore: use_key_in_widget_constructors
  const Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        // ignore: unnecessary_cast
        onPressed: selectHandler,
      ),
    );
  }
}
