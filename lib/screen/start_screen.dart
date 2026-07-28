import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme.dart';

import '../background/gradient_background.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientBackground(
          child: StartScreenContent(),
        ),
      ),
    );
  }
}

class StartScreenContent extends StatelessWidget {
  const StartScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/quiz_logo.png', width: 300),
        const SizedBox(height: 20),
        Text(
          'Quiz App',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Navigate to the next screen or perform an action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            padding: EdgeInsets.all(16)
          ),
          child: const Text('Get Started'),
        ),
      ],
    );
  }
}