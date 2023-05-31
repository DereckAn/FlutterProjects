import 'package:flutter/material.dart';
import 'package:quizz_app/questions.dart';

import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeSreen ;

  @override
  void initState() {
    super.initState();
    activeSreen = MyHomePage(switchScreen);
  }

  void switchScreen(){
    setState(() {
      activeSreen = const Questions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: activeSreen ,
    );
  }
}