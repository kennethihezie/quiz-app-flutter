import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/model/Question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final quiz = [
    Question.name("The U.S. Declaration of Independence was adopted in 1776", true),
    Question.name("The U.S. Declaration of Independence was adopted in 1776", true),
    Question.name("The U.S. Declaration of Independence was adopted in 1776", true),
    Question.name("The U.S. Declaration of Independence was adopted in 1776", true),
    Question.name("The U.S. Declaration of Independence was adopted in 1776", true),

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
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/flag.png", width: 250, height: 180,),
          ),


          Container(
            height: 120.0,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(12.0)
            ),
            child: Text("Hello"),
          )
        ],
      ),
    );
  }

  Question _generateRandomQuestion(){
    final randIndex = Random(quiz.length);
    return quiz[randIndex];
  }
}
