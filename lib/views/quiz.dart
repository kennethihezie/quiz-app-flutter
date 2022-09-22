import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/model/Question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 1;

  final quiz = [
    Question.name("The U.S. Declaration of Independence was adopted in 1776", true),
    Question.name("There are 100 U.S Senators", true),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (context) {
          return Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/flag.png", width: 250, height: 180,),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120.0,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(quiz[_currentQuestionIndex].question, style: const TextStyle(fontSize: 16.0, color: Colors.white),),
                  ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(onPressed: () => _nextQuestion(false), color: Colors.blueGrey.shade900, child: const Icon(Icons.arrow_back, color: Colors.white,),),

                    RaisedButton(onPressed: () => _checkAnswer(true, context), color: Colors.blueGrey.shade900, child: const Text("TRUE", style: TextStyle(color: Colors.white),),),

                    RaisedButton(onPressed: () => _checkAnswer(false, context), color: Colors.blueGrey.shade900, child: const Text("FALSE", style: TextStyle(color: Colors.white),),),

                    RaisedButton(onPressed: () => _nextQuestion(true), color: Colors.blueGrey.shade900, child: const Icon(Icons.arrow_forward, color: Colors.white,),)
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }

  _checkAnswer(bool value, BuildContext context){
    if(value == quiz[_currentQuestionIndex].isCorrect){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Correct"), duration: Duration(microseconds: 1000), backgroundColor: Colors.green,));
      _nextQuestion(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Incorrect"), duration: Duration(microseconds: 1000), backgroundColor: Colors.redAccent,));
      _nextQuestion(true);
    }
  }

  _nextQuestion(bool isNext){
    if(isNext){
      setState((){
        //take the question back to 0 when the end is reached
        _currentQuestionIndex = (_currentQuestionIndex + 1) % quiz.length;
      });
    } else {
      setState((){
        //take the question back to 0 when the end is reached
        _currentQuestionIndex = (_currentQuestionIndex - 1) % quiz.length;
      });
    }
  }
}
