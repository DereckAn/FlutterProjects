import 'package:flutter/material.dart';
import 'package:quizz_app/questions.dart';

import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen2 =
      "start-screen"; // Este metodo es para eliminar el inistate

  Widget? activeSreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeSreen = MyHomePage(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      // activeSreen = const Questions();
      activeScreen2 = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    var anotherMethod = activeScreen2 == 'start-screen' //esto se llama "turnary expresion"
          ? MyHomePage(switchScreen)
          : const Questions();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: anotherMethod,
    );
  }
}
