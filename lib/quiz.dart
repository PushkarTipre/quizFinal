import 'package:flutter/material.dart';
import 'package:quizfinal/screens/Questions_Screen.dart';
import 'package:quizfinal/screens/Quiz_Home_Screen.dart';
import 'screens/Results_Screen.dart';

import 'models/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreenId = 'main-screen';
  List<String> selectedAnswers = [];

  void changeScreen() {
    setState(() {
      activeScreenId = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreenId = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreenId = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidget = activeScreenId == 'main-screen'
        ? Quiz_Home_Screen(changeScreen: changeScreen)
        : Questions_Screen(
            onSelectAnswer: chooseAnswer,
          );
    if (activeScreenId == 'results-screen') {
      screenWidget = Results_Screen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 95, 20, 170),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }
}
