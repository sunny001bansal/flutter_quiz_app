import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/background/gradient_background.dart';
import 'screens/question_screen.dart';
import 'screens/start_screen.dart';

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => QuizAppState();
}

class QuizAppState extends State<QuizApp> {

  late Widget activeScreen = StartScreen(switchScreen);

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 57, 19, 58)),
      ),
      home: GradientBackground(child: activeScreen),
    );
  }
}