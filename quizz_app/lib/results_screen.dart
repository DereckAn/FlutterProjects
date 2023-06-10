import 'package:flutter/material.dart';
import 'package:quizz_app/questions_summary.dart';

import 'data/dummy_questions.dart';

class Results extends StatelessWidget {
  const Results(this.chooseAnswer, this.onReset, {super.key});
  final List<String> chooseAnswer;
  final void Function() onReset;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

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
    final numtotalQuestions = questionss.length;
    final sumaryData = getSummary();
    final correctQuestions = sumaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    // Color answerColor = getSummary()[1] == getSummary['user_answer'] ? Colors.green : Colors.red;
    

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                'You answers $correctQuestions out of $numtotalQuestions questions correctly',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 40),
            QuestionsSummary(getSummary()),
            const SizedBox(height: 40),
            TextButton.icon(
              label: const Text('Try again'),
              icon: const Icon(Icons.refresh), 
              onPressed: onReset
              ),
          ],
        ),
      ),
    );
  }
}
