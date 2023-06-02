import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'home-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 45, 6, 113),
              Color.fromARGB(255, 70, 28, 142),
              Color.fromARGB(255, 64, 36, 112),
              Color.fromARGB(255, 110, 83, 156)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen == 'home-screen'
              ? HomeScreen(switchScreen)
              : activeScreen == 'results-screen'
                  ? ResultsScreen(
                      chosenAnswers: selectedAnswers, onRestart: restartQuiz)
                  : QuestionScreen(chooseAnswer),
        ),
      ),
    );
  }
}
