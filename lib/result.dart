import 'dart:ui';

import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if(resultScore <=8){
      resultText = 'You are awesome!';
    }else if(resultScore <=12){
      resultText = 'You are innocent!';
    }else if(resultScore <=16){
      resultText = 'You are whatever!';
    }else{
      resultText = 'You are weird!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text
            (resultPhrase,
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic,
            ),),
          FlatButton(
            child: Text("Restart Quiz"),
            color: Colors.black87,
            textColor: Colors.amberAccent,

            onPressed: resetHandler,
          )
        ],
      ) ,
    );
  }
}
