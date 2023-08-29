import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_features/models/place.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class UserPLacesNotifier extends StateNotifier<List<Place>> {
  UserPLacesNotifier() : super(const []); // this is the constructor

  void add(String title, File image, 
  // PlaceLocation location
  ) async {

    // crear el path donde guardaremos la foto 
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    
    final fileName = path.basename(image.path);

    final copiedImage = await image.copy('${appDir.path}/$fileName');


    // void add(Place place)
    // state = [...state, place];
    final newPlace = Place(title: title, image: copiedImage, );
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