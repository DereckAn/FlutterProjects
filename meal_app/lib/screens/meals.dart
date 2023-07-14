import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
      return ListTile(
        title: Text(meals[index].title),
      );
    });

    if (meals.isEmpty) {
      content =  Center(
        child: Column(
          children: [
            Text('Uh oh ... nothing here!', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground,),),
            const SizedBox(height: 20),
            Text('Add some meals to get started or change category', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground,),),
          ],
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
