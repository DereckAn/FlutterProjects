import 'dart:async';

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
  Color _backgroundColor = Colors.pink;
  String _stringColor = 'pink';
  int score = 0;
  late Timer _timer;
  late int _secondRemaining = 2;
  late bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

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
        _secondRemaining = 2;
      });
      // return true;
    } else {
      setState(() {
        _isGameOver = true;
      });
      // return false;
    }
  }

  bool checkIsSame() {
    return _backgroundColor == colorMap[_stringColor];
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(milliseconds:  600),
      (Timer timer) {
        if (_secondRemaining == 0) {
          _timer.cancel();
          setState(() {
            _isGameOver = true;
          });
        } else {
          setState(() {
            _secondRemaining--;
          });
        }
      },
    );
  }

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
      body: _isGameOver
          ? EndGame(score)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: 1 - _secondRemaining / 2,
                          strokeWidth: 5,
                          backgroundColor: _backgroundColor,
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 76, 187, 12)),
                        ),
                        Center(
                          child: Text(
                            '$_stringColor $_secondRemaining',
                            style: const TextStyle(fontSize: 50),
                          ),
                        ),
                      ],
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
