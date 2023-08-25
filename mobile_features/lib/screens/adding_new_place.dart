import 'package:flutter/material.dart';

class AddingNewPlace extends StatelessWidget {
  const AddingNewPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add a new place'),
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name of the place'),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add place'),
              ),
            ),
          ],
        ));
  }
}
