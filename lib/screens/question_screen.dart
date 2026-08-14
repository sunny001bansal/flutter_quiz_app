import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/buttons/option_button.dart';
import 'package:fultter_quiz_app/models/quiz_question.dart';

import '../background/gradient_background.dart';
import '../data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  State<QuestionScreen> createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {

  var currentQuestionIndex = 0;

  void quizQuestionAnswered() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: GradientBackground(
          child: QuestionScreenContent(quizQuestionAnswered, currentQuestion: currentQuestion),
      ),
    );
  }
}

class QuestionScreenContent extends StatelessWidget {
  const QuestionScreenContent(this.quizQuestionAnswered, {super.key, required this.currentQuestion});

  final void Function() quizQuestionAnswered;
  final QuizQuestion currentQuestion;

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
              child: Image.asset(
                'assets/images/quiz_logo.png',
                width: 150,
                color: Color.fromARGB(150, 255, 255, 255),
              ),
            ),

            // 2. Question & Options dead-centered relative to the entire screen height
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Fits height to contents
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      currentQuestion.question,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Option buttons
                    for (var option in currentQuestion.options) ...[
                      OptionButton(
                        optionText: option,
                        onPressed: quizQuestionAnswered,
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