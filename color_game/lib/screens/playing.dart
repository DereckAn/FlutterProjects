import 'package:color_game/components/two_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:math';

final colors = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.brown,
  Colors.grey,
  Colors.black,
  Colors.white,
];

final colors2 = [
  'red',
  'pink',
  'purple',
  'blue',
  'green',
  'yellow',
  'orange',
  'brown',
  'grey',
  'black',
  'white',
];

final random = Random();

class Playing extends StatefulWidget {
  const Playing({super.key});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  void _changeBackgroundColor() {
    final randomColor = colors[random.nextInt(colors.length)];
    final stringColor = colors2[random.nextInt(colors2.length)];
    setState(() {
      _backgroundColor = randomColor;
      _stringColor = stringColor;
    });
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
          'Playing',
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
