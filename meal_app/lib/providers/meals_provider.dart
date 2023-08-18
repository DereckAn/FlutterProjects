import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';

//esto es para crear un provider muy simple y con informacion sencilla que no se cambiara 
//informacion estatica
final mealsProvider = Provider((ref){
  return dummyMeals;
});