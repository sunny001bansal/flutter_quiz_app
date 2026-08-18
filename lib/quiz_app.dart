import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/screens/result_screen.dart';
import 'data/questions.dart';
import 'screens/question_screen.dart';
import 'screens/start_screen.dart';

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => QuizAppState();
}

class QuizAppState extends State<QuizApp> {

  late Widget activeScreen = StartScreen(switchScreen);
  final List<String> selectedAnswers = [];

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
            submittedAnswers: selectedAnswers,
            routeToStartScreen: routeToStartScreen
        );
      });
    }
  }

  void routeToStartScreen() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = StartScreen(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(chooseAnswers);
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
      home: activeScreen,
    );
  }
}