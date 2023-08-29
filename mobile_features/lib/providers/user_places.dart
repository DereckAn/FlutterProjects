import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_features/models/place.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> getDataBase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)', // no se te olvide por estos ultimos parametros cuando se puedas usar la api de google "lat REAL, lng REAL"
      );
    },
    version: 1,
  );
  return db;
}

class UserPLacesNotifier extends StateNotifier<List<Place>> {
  UserPLacesNotifier() : super(const []); // this is the constructor

  void loadPlaces() async {
    final db = await getDataBase();
    final data =
        await db.query('user_places'); // Esto es para obtener todos los lugares
    final places = data
        .map(
          (row) => Place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(
              row['image'] as String,
            ),
          ),
        )
        .toList();
    state = places;
  }

  void add(
    String title,
    File image,
    // PlaceLocation location
  ) async {
    // crear el path donde guardaremos la foto
    final appDir = await syspaths.getApplicationDocumentsDirectory();

    final fileName = path.basename(image.path);

    final copiedImage = await image.copy('${appDir.path}/$fileName');

    // void add(Place place)
    // state = [...state, place];
    final newPlace = Place(
      title: title,
      image: copiedImage,
    );

    final db = await getDataBase();
    db.insert('user_places', {
      //esta parte es para ingresar los datos a la tabla en la base de datos
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      // 'loc_lat': newPlace.location.latitude,
      // 'loc_lng': newPlace.location.longitude,
    });

    state = [
      newPlace,
      ...state
    ]; // En este orden siemre el titulo nuevo estara al principio de la lista
  }

  void remove(Place place) {
    state = state.where((m) => m.id != place.id).toList();
  }

  bool contains(Place place) {
    return state.any((m) => m.id == place.id);
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPLacesNotifier, List<Place>>(
        (ref) => UserPLacesNotifier());
