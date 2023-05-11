import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
              "donde estan perros?",
              style: TextStyle(fontSize: 30, color: Colors.white),
            );
  }
}