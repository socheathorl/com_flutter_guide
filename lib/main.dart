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
  final _questions = const [
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
  int _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Column(
                children: [
                  Question(_questions[_questionIndex]['questionText'] as String),
                  ...(_questions[_questionIndex]['answer'] as List<String>).map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
