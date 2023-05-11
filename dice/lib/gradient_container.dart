import 'package:flutter/material.dart';

import 'style_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 100, 175, 121),
              Color.fromARGB(255, 32, 92, 197),
              Color.fromARGB(255, 133, 22, 22),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: const Center(
            child: StyleText()
          ),
        );
  }
}
