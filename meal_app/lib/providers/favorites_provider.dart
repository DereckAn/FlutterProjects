import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void addOrRemove(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
  // void add(Meal meal) {
  //   state = [...state, meal];
  // }

  // void remove(Meal meal) {
  //   state = state.where((m) => m.id != meal.id).toList();
  // }

  // bool contains(Meal meal) {
  //   return state.any((m) => m.id == meal.id);
  // }
}


//Este esta optimizdo para data que cambia y que se puede modificar
final favoriteMeals = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) => FavoriteMealsNotifier());