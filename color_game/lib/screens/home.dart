import 'package:flutter/material.dart';

import '../components/gradient_cont.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: GradientContainer( 
          Color.fromRGBO(136, 14, 79, 1),
          Colors.red,
          Color.fromARGB(255, 25, 121, 168),
          Color.fromARGB(255, 8, 139, 113),
          Color.fromARGB(255, 145, 242, 26), 
          Color.fromARGB(255, 198, 174, 38), ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}