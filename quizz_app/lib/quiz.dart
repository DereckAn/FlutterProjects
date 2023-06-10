import 'package:flutter/material.dart';
import 'package:quizz_app/data/dummy_questions.dart';
import 'package:quizz_app/questions.dart';
import 'package:quizz_app/results_screen.dart';

import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  var activeScreen2 =
      "start-screen"; // Este metodo es para eliminar el inistate

  // Widget? activeSreen;
  // @override
  // void initState() {
  //   super.initState();
  //   activeSreen = MyHomePage(switchScreen);
  // }

  void reatartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen2 = 'start-screen';
    });
  }

  void switchScreen() {
    setState(() {
      // activeSreen = const Questions();
      activeScreen2 = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questionss.length) {
      setState(() {
        // selectedAnswer = [];
        activeScreen2 = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var anotherMethod = activeScreen2 == 'start-screen'
        ? MyHomePage(switchScreen)
        : (activeScreen2 == 'questions-screen'
            ? Questions(chooseAnswer)
            : Results(selectedAnswer, reatartQuiz));

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 73, 148, 161),
          body: anotherMethod,
        ));
  }
}
