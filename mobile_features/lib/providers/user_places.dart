import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_features/models/place.dart';

class UserPLacesNotifier extends StateNotifier<List<Place>> {
  UserPLacesNotifier() : super(const []); // this is the constructor

  void add(String title, File image, PlaceLocation location) {
    // void add(Place place)
    // state = [...state, place];
    final newPlace = Place(title: title, image: image, location: location);
    state = [newPlace, ...state ]; // En este orden siemre el titulo nuevo estara al principio de la lista 
  }

  void remove(Place place) {
    state = state.where((m) => m.id != place.id).toList();
  }

  bool contains(Place place) {
    return state.any((m) => m.id == place.id);
  }
}

final userPlacesProvider = StateNotifierProvider<UserPLacesNotifier, List<Place>>(
    (ref) => UserPLacesNotifier());