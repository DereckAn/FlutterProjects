import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ColorGame());
}

class ColorGame extends StatefulWidget {
  const ColorGame({super.key});

  @override
  _ColorGameState createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGame> {
  List<String> colors = ["rojo", "azul", "verde", "amarillo", "naranja"];
  late String currentColor;
  late String currentText;
  late int score;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    score = 0;
    generateRandomColor();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      generateRandomColor();
    });
  }

  void generateRandomColor() {
    setState(() {
      currentColor = colors[Random().nextInt(colors.length)];
      currentText = colors[Random().nextInt(colors.length)];
    });
  }

  void checkAnswer(bool isCorrect) {
    if ((currentColor == currentText && isCorrect) ||
        (currentColor != currentText && !isCorrect)) {
      setState(() {
        score++;
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Game',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Color Game'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Score: $score',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            Container(
              width: 200,
              height: 200,
              color: _getColor(currentColor),
              child: Center(
                child: Text(
                  currentText,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => checkAnswer(true),
                  child: const Text('Correcto'),
                ),
                ElevatedButton(
                  onPressed: () => checkAnswer(false),
                  child: const Text('Incorrecto'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(String color) {
    switch (color) {
      case "rojo":
        return Colors.red;
      case "azul":
        return Colors.blue;
      case "verde":
        return Colors.green;
      case "amarillo":
        return Colors.yellow;
      case "naranja":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
