import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/background/gradient_background.dart';
import 'package:fultter_quiz_app/styles/quiz_text_style.dart';

import '../data/questions.dart';
import '../images/logo_image.dart';
import '../widgets/result_question_row.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.submittedAnswers,
    required this.routeToStartScreen,
  });

  final List<String> submittedAnswers;
  final void Function() routeToStartScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: ResultScreenContent(
          submittedAnswers: submittedAnswers,
          navigateToStartScreen: routeToStartScreen,
        ),
      ),
    );
  }
}

class ResultScreenContent extends StatelessWidget {
  const ResultScreenContent({
    super.key,
    required this.submittedAnswers,
    required this.navigateToStartScreen,
  });

  final List<String> submittedAnswers;
  final void Function() navigateToStartScreen;

  String getResultTitleText() {
    int correctAnswersCount = 0;
    for (int i = 0; i < submittedAnswers.length; i++) {
      if (submittedAnswers[i] == answers[i]) {
        correctAnswersCount++;
      }
    }
    return 'You answered $correctAnswersCount out of ${answers.length} questions correctly!';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 1. Logo anchored directly at the top of the screen
                  LogoImage(150, Color.fromARGB(150, 255, 255, 255)),
                  const SizedBox(height: 25),
                  Text(
                    getResultTitleText(),
                    textAlign: TextAlign.center,
                    style: QuizTextStyle.headerBoldPrimary(context),
                  ),
            const SizedBox(height: 50),

            // 2. Centered text displaying the submitted answers
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    for (int i = 0; i < questions.length; i++)
                      ResultQuestionRow(
                        index: i,
                        questionText: questions[i].question,
                        userAnswer: submittedAnswers[i],
                        correctAnswer: answers[i],
                      ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: navigateToStartScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: EdgeInsets.all(16),
                  ),
                  child: const Text('Home'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
