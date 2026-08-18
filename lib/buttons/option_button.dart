import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/styles/quiz_text_style.dart';

class OptionButton extends StatelessWidget{
  const OptionButton({super.key, required this.optionText, this.onPressed});

  final String optionText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
        ),
        child: Text(
            optionText,
          style: QuizTextStyle.subTitlePrimary(context),
        ),
      );
  }
}