import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 148, 161),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/pato.png',
                width: 300,
                // color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Learning Flutter the fun way with Quizz App',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
