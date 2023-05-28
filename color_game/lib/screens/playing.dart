import 'package:color_game/components/two_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../components/end_game.dart';

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
      _stringColor = keys[random.nextInt(keys.length)];
    });
  }

  void checkAnswer(bool isCorrect) {
    if ((checkIsSame() == isCorrect)) {
      setState(() {
        score++;
        generateRandomColor();
      });
      // return true;
    } else {
      setState(() {
        score--;
        generateRandomColor();
      });
      // return false;
    }
  }

  bool checkIsSame() {
    return _backgroundColor == colorMap[_stringColor];
  }

  Color _backgroundColor = Colors.pink;
  String _stringColor = 'pink';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        actions: const [
          EndGame(),],
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
          Expanded(
            flex: 2,
            child: TwoButtons(checkAnswer),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
