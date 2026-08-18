import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/styles/quiz_text_style.dart';

class ResultQuestionRow extends StatelessWidget{
  const ResultQuestionRow({
    super.key,
    required this.index,
    required this.questionText,
    required this.userAnswer,
    required this.correctAnswer,
  });
  final int index;
  final String questionText;
  final String userAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    var isCorrect = userAnswer == correctAnswer;
    var checkText = isCorrect ? 'Correct' : 'Incorrect';
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Q${index + 1}: $questionText',
          style: QuizTextStyle.titleBoldPrimary(context),
        ),
        const SizedBox(height: 4),
        Text(
          'Your answer: $userAnswer ($checkText)',
          style: QuizTextStyle.subTitleColoredPrimary(
            context,
            isCorrect ? Colors.green : Colors.red,
          ),
        ),
        if (!isCorrect)
        Text(
          'Correct answer: $correctAnswer',
          style: QuizTextStyle.subTitleColoredPrimary(
            context,
            Colors.green,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}