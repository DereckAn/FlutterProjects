import 'package:flutter/material.dart';

import 'models/answer_button.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The questions will go here'), 
          const SizedBox(height: 20),
         AnswerButton('1', (){}),
         AnswerButton('2', (){}),
         AnswerButton('3', (){}),
         AnswerButton('4', (){}),
          ],
      ),
    );
  }
}
