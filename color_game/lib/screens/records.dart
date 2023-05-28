import 'package:flutter/material.dart';

class Records extends StatelessWidget {
  const Records({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Records'),
      ),
      body: const Center(
        child: Text('Records'),
      ),);
  }
}