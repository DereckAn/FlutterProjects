import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {

  Place({
    required this.title,
    // required this.description,
    // required this.imageUrl,
  }): id = uuid.v4();


  final String id;
  final String title;
  // final String? description;
  // final String? imageUrl;
}