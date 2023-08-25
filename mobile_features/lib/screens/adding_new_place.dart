import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_features/providers/user_places.dart';
import 'package:mobile_features/widgets/poner_imagen.dart';

//recuerda cambiar el statefull widget por el consumer statefull widget para tener acceso a al provider
class AddingNewPlaceScreen extends ConsumerStatefulWidget { 
  const AddingNewPlaceScreen({super.key});

  @override
  ConsumerState<AddingNewPlaceScreen> createState() => _AddingNewPlaceScreenState();
}

class _AddingNewPlaceScreenState extends ConsumerState<AddingNewPlaceScreen> {
  final titlePlace = TextEditingController();

  @override
  void dispose() {
    titlePlace.dispose();
    super.dispose();
  }

  void savePlace() { // este metodo es para guardar el titulo en el provedor y luego volver a la pantalla anterior
    if (titlePlace.text.isEmpty) { // si el titulo esta vacio no se guarda nada
      return;
    }
    ref.read(userPlacesProvider.notifier).add(titlePlace.text); // aqui se guarda el titulo en el provedor
    Navigator.of(context).pop(); // aqui se vuelve a la pantalla anterior
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
              const ImageInput(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: savePlace,
                  icon: const Icon(Icons.add),
                  label: const Text('Add place'),
                ),
              ),
            ],
          ),
        ));
  }
}
