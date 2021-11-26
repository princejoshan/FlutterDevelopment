import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  final List<Map<String, Object>> questions;
  final int questionsIndex;
  final Function answerQuestions;

  // ignore: use_key_in_widget_constructors
  const Quiz(this.answerQuestions, this.questionsIndex, this.questions);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Question(questions[questionsIndex]["Ques"] as String),
        ...(questions[questionsIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestions(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
