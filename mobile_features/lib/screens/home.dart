import 'package:flutter/material.dart';
import 'package:mobile_features/providers/user_places.dart';
import 'package:mobile_features/screens/adding_new_place.dart';
import 'package:mobile_features/widgets/places_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddingNewPlaceScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: true,
        title: const Text('My Places'),
      ),
      body:
       PlacesList(
        places: userPlaces,
      ),
    );
  }
}
