import 'package:flutter/material.dart';

import 'style_text.dart';

const starAligment = Alignment.topLeft;
const endAligment = Alignment.bottomRight;

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
        ], begin: starAligment, end:endAligment),
      ),
      child: const Center(child: StyleText("donde estan perros?")),
    );
  }
}
