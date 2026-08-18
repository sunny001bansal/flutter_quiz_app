import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/buttons/option_button.dart';
import 'package:fultter_quiz_app/images/logo_image.dart';
import 'package:fultter_quiz_app/models/quiz_question.dart';

import '../background/gradient_background.dart';
import '../data/questions.dart';
import '../styles/quiz_text_style.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.quizQuestionAnswered, {super.key});

  final void Function(String) quizQuestionAnswered;

  @override
  State<QuestionScreen> createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void quizQuestionAnswered(String answer) {
    widget.quizQuestionAnswered(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: GradientBackground(
        child: QuestionScreenContent(
          quizQuestionAnswered,
          currentQuestion: currentQuestion,
          currentQuestionIndex: currentQuestionIndex,
        ),
      ),
    );
  }
}

class QuestionScreenContent extends StatelessWidget {
  const QuestionScreenContent(
    this.quizQuestionAnswered, {
    super.key,
    required this.currentQuestion,
    required this.currentQuestionIndex,
  });

  final void Function(String) quizQuestionAnswered;
  final QuizQuestion currentQuestion;
  final int currentQuestionIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            // 1. Logo anchored directly at the top of the screen
            Align(
              alignment: Alignment.topCenter,
              child: LogoImage(150, Color.fromARGB(150, 255, 255, 255)),
            ),

            // 2. Question & Options dead-centered relative to the entire screen height
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Fits height to contents
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Q${currentQuestionIndex + 1}. ${currentQuestion.question}',
                      textAlign: TextAlign.center,
                      style: QuizTextStyle.headerBoldPrimary(context),
                    ),
                    const SizedBox(height: 25),

                    // Option buttons
                    for (var option in currentQuestion.options) ...[
                      OptionButton(
                        optionText: option,
                        onPressed: () => quizQuestionAnswered(option),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
