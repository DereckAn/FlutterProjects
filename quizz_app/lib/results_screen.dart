import 'package:flutter/material.dart';
import 'package:quizz_app/questions_summary.dart';

import 'data/dummy_questions.dart';

class Results extends StatelessWidget {
  const Results( this.chooseAnswer, {super.key});
  final List<String> chooseAnswer;

  List<Map< String, Object >> getSummary(){
    final List<Map< String, Object >> summary = [];

    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question index': i + 1,
        'question': questionss[i].question,
        'correct_answer': questionss[i].answers[0],
        'user_answer': chooseAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('You answers x out of y questions correctly'),
            const SizedBox(height: 40),
            QuestionsSummary(getSummary()),
            const SizedBox(height: 40),
            TextButton(onPressed: (){}, child: const Text('Try again'))
          ],
        ),
      ),
    );
  }
}
