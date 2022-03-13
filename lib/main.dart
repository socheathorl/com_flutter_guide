import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

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
        {
          'text': 'Red',
          'score': 10
        },
        {
          'text': 'Blue',
          'score': 8
        },
        {
          'text': 'White',
          'score': 5
        },
        {
          'text': 'Green',
          'score': 2
        },
      ]
    },
    {
      'questionText': "What's your favourite animal?",
      'answer': [
        {
          'text': 'Dog',
          'score': 9
        },
        {
          'text': 'Cat',
          'score': 5
        },
        {
          'text': 'Rabbit',
          'score': 10
        },
        {
          'text': 'Cow',
          'score': 3
        },
      ]
    },
    {
      'questionText': "What's your favourite phone?",
      'answer': [
        {
          'text': 'IPhone',
          'score': 9
        },
        {
          'text': 'Samsung',
          'score': 10
        },
        {
          'text': 'Mi',
          'score': 8
        },
        {
          'text': 'Vivo',
          'score': 6
        },
      ]
    }
  ];
  int _questionIndex = 0;
  int _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer chosen!');
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
