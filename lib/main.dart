import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers':[
        {'text': 'Black', 'score':10},
        {'text': 'Red', 'score':5},
        {'text': 'Green', 'score':3},
        {'text': 'White', 'score':1},
      ],

    },
    {
      'questionText': 'what\'s your favorite Animal?',
      'answers':[
        {'text': 'Dog', 'score':10},
        {'text': 'Cat', 'score':7},
        {'text': 'Tiger', 'score':5},
        {'text': 'Lion', 'score':2},
      ],
    },
    {
      'questionText': 'what\'s your Imagination?',
      'answers':[
        {'text': 'Vivid', 'score':8},
        {'text': 'Accurate', 'score':6},
        {'text': 'Worrying', 'score':5},
        {'text': 'Peace', 'score':1},
      ],
    },
  ];
  var _questionIndex = 0;
  var totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      totalScore = 0;
    });

  }
  void _answerQuestion(int score){

    totalScore = totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

  } 

  @override
  Widget build(BuildContext context){


    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text("My First App"),),
      body: _questionIndex < _questions.length ?
        Quiz(
          questions:_questions,
          questionIndex: _questionIndex,
          answerQuestion: _answerQuestion,) :
      Result(totalScore, _resetQuiz),
    ),
    );
  }
}