import 'package:flutter/material.dart';
import 'package:mobile_features/screens/adding_new_place.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AddingNewPlace(),),);
            },
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: true,
        title: const Text('My Places'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
