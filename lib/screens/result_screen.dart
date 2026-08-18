import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/styles/quiz_text_style.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Text(
          'Your score is $score',
          style: QuizTextStyle.titlePrimary(context),
        ),
      ),
    );
  }
}