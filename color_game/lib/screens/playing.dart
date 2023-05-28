import 'package:color_game/components/two_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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

final random = Random();

late int score;





class Playing extends StatefulWidget {
  const Playing({super.key});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  void _changeBackgroundColor() {
    final keys = colorMap.keys.toList();
    final randomKey = keys[random.nextInt(keys.length)];
    final randomKey2 = keys[random.nextInt(keys.length)];
    final randomColor = colorMap[randomKey];

    print(_areEquals(randomKey, randomKey2));

    setState(() {
      _backgroundColor = randomColor!;
      _stringColor = randomKey2;
    });
  }

  bool _areEquals(String key1, String key2) {
    return key1 == key2;
  }

  Color _backgroundColor = Colors.pink;
  String _stringColor = 'Ready?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Score: ',
        ),
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                _stringColor,
                style: const TextStyle(fontSize: 50),
              ))),
          Expanded(flex: 2, child: TwoButtons(_changeBackgroundColor)),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
