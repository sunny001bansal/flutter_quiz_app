import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/buttons/option_button.dart';

import '../background/gradient_background.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  State<QuestionScreen> createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientBackground(
          child: QuestionScreenContent(widget.startQuiz),
        ),
      ),
    );
  }
}

class QuestionScreenContent extends StatelessWidget {
  const QuestionScreenContent(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        const SizedBox(height: 50),
        OptionButton(optionText: 'Answer 1', onPressed: startQuiz),
        const SizedBox(height: 25),
        OptionButton(optionText: 'Answer 2', onPressed: startQuiz),
        const SizedBox(height: 25),
        OptionButton(optionText: 'Answer 3', onPressed: startQuiz),
        const SizedBox(height: 25),
        OptionButton(optionText: 'Answer 4', onPressed: startQuiz),
      ],
    );
  }
}