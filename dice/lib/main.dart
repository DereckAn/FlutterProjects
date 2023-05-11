import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 57, 133, 90),
        body: GradientContainer()
      ),
    ),
  );
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key}) : super(key: key);

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
            child: Text(
              "donde estan perros?",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        );
  }
}
