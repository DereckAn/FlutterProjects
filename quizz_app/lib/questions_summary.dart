import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: summary.map(
      (data) {
        return Row(
          children: [
            Text(((data['question index'] as int) + 1).toString()),
            Column(
              children: [
                Text(data['question'] as String),
                const SizedBox(height: 10),
                Text(data['correct_answer'] as String),
                Text(data['user_answer'] as String),
              ],
            )
          ],
        );
      },
    ).toList());
  }
}
