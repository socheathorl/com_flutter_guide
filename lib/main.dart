import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "What's your favourite color?",
        'answer': [
          'Red',
          'Blue',
          'White',
          'Green'
        ]
      },
      {
        'questionText': "What's your favourite animal?",
        'answer': [
          'Dog',
          'Cat',
          'Rabbit',
          'Cow'
        ]
      },
      {
        'questionText': "What's your favourite phone?",
        'answer': [
          'IPhone',
          'Samsung',
          'Mi',
          'Vivo'
        ]
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answer'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
