import 'package:flutter/material.dart';
import 'package:quizz_app/data/dummy_questions.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/answer_button.dart';

class Questions extends StatefulWidget {
  const Questions(this.onAnswer, {super.key});

  final void Function(String answer) onAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var questionIndex = 0;

  void answerQuestion(String answer) {
    widget.onAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionss[questionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 27, 64, 133),
              ),
            ),
            const SizedBox(height: 40),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(answer, () => answerQuestion(answer)  );
            }),
          ],
        ),
      ),
    );
  }
}
