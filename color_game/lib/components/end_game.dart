import 'package:flutter/material.dart';

import 'button.dart';

class EndGame extends StatelessWidget {
  const EndGame(this.lastScore,{super.key});
  final int lastScore;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'GAME OVER',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  'SCORE: $lastScore',
                  style: const TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonG('RESTART', '/juego'),
                SizedBox(
                  height: 25,),
                ButtonG('MENU', '/'),
                SizedBox(
                  height: 15,),
                ButtonG('RECORDS', '/records'),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
