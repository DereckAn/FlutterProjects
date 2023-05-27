import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'Color Matcher Game', style: TextStyle(fontSize: 50),
              ),
            ),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, '/juego');
            }, 
            child: const Text('START'),),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, '/juego');
            }, 
            child: const Text('STATS'),),

          ],
        );
  }
}