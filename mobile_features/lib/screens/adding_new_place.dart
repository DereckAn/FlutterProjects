import 'package:flutter/material.dart';

class AddingNewPlaceScreen extends StatefulWidget {
  const AddingNewPlaceScreen({super.key});

  @override
  State<AddingNewPlaceScreen> createState() => _AddingNewPlaceScreenState();
}

class _AddingNewPlaceScreenState extends State<AddingNewPlaceScreen> {
  final titlePlace = TextEditingController();

  @override
  void dispose() {
    titlePlace.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add a new place'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name of the place'),
                controller: titlePlace,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
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
          ),
        ));
  }
}
