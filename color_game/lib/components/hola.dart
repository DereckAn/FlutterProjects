import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(ColorGame());
}

class ColorGame extends StatefulWidget {
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
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
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
          title: Text('Color Game'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            Container(
              width: 200,
              height: 200,
              color: _getColor(currentColor),
              child: Center(
                child: Text(
                  currentText,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => checkAnswer(true),
                  child: Text('Correcto'),
                ),
                ElevatedButton(
                  onPressed: () => checkAnswer(false),
                  child: Text('Incorrecto'),
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
