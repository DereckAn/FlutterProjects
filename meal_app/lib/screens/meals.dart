import 'package:flutter/material.dart';
import 'package:meal_app/screens/meals_details.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key, this.title, required this.meals, required this.onFavoritePressed});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onFavoritePressed;


  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push( MaterialPageRoute(builder: (_) {
      return MealsDetailsScreen(meal: meal, onFavoritePressed: onFavoritePressed );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: meals[index],  onMealSelected:  (meal) {
            selectMeal(context, meal);
          },);
        });

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              'Add some meals to get started or change category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if(title == null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
