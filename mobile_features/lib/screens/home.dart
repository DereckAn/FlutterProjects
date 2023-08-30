import 'package:flutter/material.dart';
import 'package:mobile_features/providers/user_places.dart';
import 'package:mobile_features/screens/adding_new_place.dart';
import 'package:mobile_features/widgets/places_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<void> placesFuture;


  @override
  void initState() {
    super.initState();
    placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: placesFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : PlacesList(
                    places: userPlaces,
                  ),
      ),
    );
  }
}
