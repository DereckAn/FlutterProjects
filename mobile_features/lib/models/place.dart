import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {

  Place({
    required this.title,
    required this.image,
    String? id,
    // required this.location,
  }): id = id ?? uuid.v4(); // con esto tendre un id automaticamente por default pero puedo crear uno si quiero 


  final String id;
  final String title;
  final File image;
  // final PlaceLocation location;
}

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}