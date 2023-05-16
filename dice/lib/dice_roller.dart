import 'package:flutter/material.dart';

import 'style_text.dart';

class RolerDice extends StatefulWidget {
  const RolerDice({super.key});

  @override
  State<RolerDice> createState() => _RolerDiceState();
}

class _RolerDiceState extends State<RolerDice> {

  var activeImage = 'assets/images/dice-1.png';

  void rolDice() {
    setState(() {
      activeImage = 'assets/images/dice-2.png';
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
                child: const StyleText("Donde estan?"))
      ],
    );
  }
}