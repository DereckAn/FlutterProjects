import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/providers/meals_provider.dart';
// import '../data/dummy_data.dart';
import 'package:meal_app/providers/favorites_provider.dart';

import '../widgets/main_drawer.dart';
import 'filter.dart';
import 'package:meal_app/providers/filters_provider.dart';

// const _initialFilters = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false,
// };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favoriteMeals = [];
  // Map<Filter, bool> _filters = _initialFilters;

  
  // void _pasarMealFavorite(Meal meal) {
  //   final isFavorite = _favoriteMeals.contains(meal);
  //   if (isFavorite) {
  //     setState(() {
  //     _favoriteMeals.remove(meal);
  //     });
  //     showInfo('Removed from favorites');
  //   } else {
  //     setState(() {
  //     _favoriteMeals.add(meal);
  //     });
  //     showInfo('Add it to favorites');

  //   }
  // }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (context) => const FilterScreen()));
      // setState(() {
      //   _filters = result ??
      //       _initialFilters; //Este es una operacion por default y es lo mismo que poner if(result != null){_filters = result}
      // });
    }
    // } else {
    //   Navigator.of(context).pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filterProvider);
    final filterMeals = meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesPage(
        // onFavoritePressed: _pasarMealFavorite, 
        filterMeals: filterMeals);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMealas = ref.watch(favoriteMeals);
      activePage = MealsPage(
          meals: favoriteMealas, 
          // onFavoritePressed: _pasarMealFavorite
          );
      activePageTitle = ' Your favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.amberAccent,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
