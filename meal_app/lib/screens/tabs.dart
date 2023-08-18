import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/providers/meals_provider.dart';
// import '../data/dummy_data.dart';
import '../widgets/main_drawer.dart';
import 'filter.dart';

const _initialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = []; 
  Map<Filter, bool> _filters =  _initialFilters;

  void showInfo(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _pasarMealFavorite(Meal meal) {
    final isFavorite = _favoriteMeals.contains(meal);
    if (isFavorite) {
      setState(() {
      _favoriteMeals.remove(meal);
      });
      showInfo('Removed from favorites');
    } else {
      setState(() {
      _favoriteMeals.add(meal);
      });
      showInfo('Add it to favorites');

    }
  }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
      Navigator.of(context).pop();
    if(identifier == 'filters'){
      final result = await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (context)=>  FilterScreen( actualFilters: _filters)));
      setState(() {
      _filters = result ?? _initialFilters; //Este es una operacion por default y es lo mismo que poner if(result != null){_filters = result}
      });

    }
    // } else {
    //   Navigator.of(context).pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final filterMeals = meals.where((meal) {
      if (_filters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_filters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage =  CategoriesPage(onFavoritePressed:_pasarMealFavorite, filterMeals: filterMeals);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsPage(meals: _favoriteMeals, onFavoritePressed: _pasarMealFavorite);
      activePageTitle = ' Your favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer:  MainDrawer( onSelectScreen: setScreen),
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
