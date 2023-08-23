import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.filterMeals});
  // final void Function(Meal meal) onFavoritePressed;
  final List<Meal> filterMeals;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationControl;

  @override
  void initState() {
    super.initState();
    _animationControl = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        upperBound: 1,
        lowerBound: 0);
    _animationControl.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationControl.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.filterMeals
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
    return AnimatedBuilder(
      animation: _animationControl,
      child: GridView(
        //Con el child podemos usar la seccion de categorias sin animarlas. Solo haran parte de la animacion.
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
      ),
      builder: (context, child) => 
      SlideTransition( // Esta manera de animacion es mas optima y tenemos extra features

        position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0)).animate(CurvedAnimation(parent: _animationControl, curve: Curves.easeIn)),
          // position: _animationControl.drive(
          //     Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))),
          // child: child),

      // Padding(
      //     padding: EdgeInsets.only(top: 100 - _animationControl.value * 100),
      //     child: child),
    ),
    );
  }
}
