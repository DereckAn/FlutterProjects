import 'package:flutter/material.dart';
import 'package:quizz_app/data/dummy_questions.dart';

import 'models/answer_button.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final currentQuestion = questionss[0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question, textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(answer, () {});
            }),
          ],
        ),
      ),
    );
  }
}
