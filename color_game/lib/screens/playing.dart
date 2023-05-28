import 'package:color_game/components/two_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();
const colorMap = {
  'red': Colors.red,
  'green': Colors.green,
  'blue': Colors.blue,
  'purple': Colors.purple,
  'yellow': Colors.yellow,
  'black': Colors.black,
  'white': Colors.white,
  'pink': Colors.pink,
  'orange': Colors.orange,
  'brown': Colors.brown,
  'grey': Colors.grey,
};
final keys = colorMap.keys.toList();
late int score;

class Playing extends StatefulWidget {
  const Playing({super.key});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  int score = 0;

  void generateRandomColor() {
    setState(() {
      _backgroundColor = colorMap[keys[random.nextInt(keys.length)]]!;
      // print(_backgroundColor);
      _stringColor = keys[random.nextInt(keys.length)];
      // print(_stringColor);
      score++;
    });
  }

  void checkAnswer(bool isCorrect) {
    if ((_backgroundColor == colorMap[_stringColor] && isCorrect) ||
        (_backgroundColor != colorMap[_stringColor] && !isCorrect)) {
      setState(() {
        score++;
        generateRandomColor();
      });
    }
  }

  bool checkIsSame() {
    return _backgroundColor == colorMap[_stringColor];
  }

  Color _backgroundColor = Colors.pink;
  String _stringColor = 'Ready?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Score: $score',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                _stringColor,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          Expanded(flex: 2, child: TwoButtons(generateRandomColor)),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
