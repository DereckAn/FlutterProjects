import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.filterMeals});
  // final void Function(Meal meal) onFavoritePressed;
  final List<Meal> filterMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = filterMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList(); //Esto es para filtrar la lista
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsPage(
          title: category.title,
          meals: filteredMeals,
          // onFavoritePressed: onFavoritePressed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        //Alternative way availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
