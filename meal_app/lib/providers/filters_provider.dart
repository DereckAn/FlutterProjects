import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';
enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class Filters extends StateNotifier<Map<Filter, bool>> {
  Filters() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void toggle(Filter filter, bool active) {
    // state[filter] = active; //not allowed to mutate state directly
    state = {
      ...state,
      filter: active,
    };
  }
}

final filterProvider = StateNotifierProvider<Filters, Map<Filter, bool>>((ref) => Filters());


final filteredMealsProvider = Provider((ref) {
  final filters = ref.watch(filterProvider);
  final meals = ref.watch(mealsProvider);

  return meals.where((meal) {
    if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});