import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
            children: summary.map(
          (data) {
            final Color answerColor = data['user_answer'] as String ==
                    data['correct_answer'] as String
                ? Colors.green
                : Colors.red;
            return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  height: 45,
                  width: 45,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: answerColor),
                  // padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Center(
                      child: Text(
                    ((data['question index'] as int)).toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
                ),
                Expanded( 
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.start),
                        const SizedBox(height: 6),
                        Text(data['correct_answer'] as String,
                            style: const TextStyle(color: Colors.green)),
                        Text(data['user_answer'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 155, 54, 244))),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
