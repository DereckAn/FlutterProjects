import 'package:flutter/material.dart';

import 'gradient_container.dart';


void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 57, 133, 90),
        body: GradientContainer(Color.fromARGB(255, 141, 10, 10), Color.fromARGB(255, 54, 244, 73),),
      ),
    ),
  );
}
