import 'package:flutter/material.dart';
import 'dart:math';

import 'style_text.dart';

final randomizer = Random();


class RolerDice extends StatefulWidget {
  const RolerDice({super.key});

  @override
  State<RolerDice> createState() => _RolerDiceState();
}

class _RolerDiceState extends State<RolerDice> {
  var activeImage = 'assets/images/dice-1.png';

  void rolDice() {
    var randomNumber = randomizer.nextInt(6) + 1;
    setState(() {
      activeImage = 'assets/images/dice-$randomNumber.png';
    });

    // print('cambio de imagen');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeImage,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: rolDice,
            style: TextButton.styleFrom(
                // padding: const EdgeInsets.only(top:20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 30)),
            child: const StyleText("Random Dice")),
      ],
    );
  }
}
