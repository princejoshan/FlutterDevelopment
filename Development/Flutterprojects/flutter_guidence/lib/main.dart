// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

// // ignore: must_be_immutable
// class MyApp extends StatelessWidget {
//   // ignore: non_constant_identifier_names
//   var QuesIndex = 0;
//   MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // ignore: non_constant_identifier_names, unused_local_variable
//     var Ques = ['Name', 'Age'];
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text("Watchlist"),
//           ),
//           body: Row(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               Text(Ques.elementAt(QuesIndex)),
//               // ignore: deprecated_member_use
//               RaisedButton(child: Text('Answer1'), onPressed: answerBtn),
//               // ignore: deprecated_member_use
//               RaisedButton(child: Text('Answer2'), onPressed: answerBtn),
//             ],
//           )),
//     );
//   }

//   void answerBtn() {
//     QuesIndex = QuesIndex + 1;
//   }
// }

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // ignore: non_constant_identifier_names
  var QuesIndex = 0;
  var totalScore = 0;
  // ignore: non_constant_identifier_names
  var Ques = [
    {
      'Ques': 'Fav Language',
      'answers': [
        {'text': 'Swift', 'score': 10},
        {'text': 'C', 'score': 8},
        {'text': 'C++', 'score': 5}
      ]
    },
    {
      'Ques': 'Fav Country',
      'answers': [
        {'text': 'India', 'score': 10},
        {'text': 'Aus', 'score': 8},
        {'text': 'UK', 'score': 5}
      ]
    },
    {
      'Ques': 'Fav food',
      'answers': [
        {'text': 'Briyani', 'score': 10},
        {'text': 'Rice', 'score': 8},
        {'text': 'Pasta', 'score': 5}
      ]
    }
  ];

  void answerBtn(int total) {
    setState(() {
      // if (Ques.length > QuesIndex + 1) {
      QuesIndex = QuesIndex + 1;
      totalScore += total;
      //   print(totalScore);
      // } else {
      //   QuesIndex = 0;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names, unused_local_variable
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Watchlist"),
          ),
          body: QuesIndex < Ques.length
              ? Quiz(answerBtn, QuesIndex, Ques)
              : Result(totalScore)),
    );
  }
}
