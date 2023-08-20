import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  void toggle(Filter filter, bool active) {
    // state[filter] = active; //not allowed to mutate state directly
    state = {
      ...state,
      filter: active,
    };
  }
}

final filterProvider = StateNotifierProvider<Filters, Map<Filter, bool>>((ref) => Filters());