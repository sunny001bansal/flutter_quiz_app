import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/images/logo_image.dart';
import 'package:fultter_quiz_app/styles/quiz_text_style.dart';

import '../background/gradient_background.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientBackground(child: StartScreenContent(startQuiz)),
      ),
    );
  }
}

class StartScreenContent extends StatelessWidget {
  const StartScreenContent(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LogoImage(300, Colors.white),
        const SizedBox(height: 20),
        Text(
          'Quiz App',
          style: QuizTextStyle.headerBoldPrimary(context),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            padding: EdgeInsets.all(16),
          ),
          icon: const Icon(Icons.arrow_forward),
          label: Text(
            'Get Started',
            style: QuizTextStyle.subTitleBoldPrimary(context),
          ),
        ),
      ],
    );
  }
}
