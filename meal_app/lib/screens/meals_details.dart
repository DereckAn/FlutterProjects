import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 15),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            for (final ingredient in meal.ingredients)
              ListTile(
                leading:  CircleAvatar(
                  child: Text((meal.ingredients.indexOf(ingredient)+1).toString()),
                ),
                title: Text(ingredient),
              ),
            // ListView.builder(
            //   itemCount: meal.ingredients.length,
            //   itemBuilder: (ctx, index) {
            //     return ListTile(
            //       leading:  CircleAvatar(
            //         child: Text((index+1).toString()),
            //       ),
            //       title: Text(meal.ingredients[index]),
            //     );
            //   },
            // ),
            const SizedBox(height: 15),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            for (final step in meal.steps)
              ListTile(
                leading:  CircleAvatar(
                  child: Text((meal.steps.indexOf(step)+1).toString()),
                ),
                title: Text(step),
              ),
            // ListView.builder(
            //   itemCount: meal.steps.length,
            //   itemBuilder: (ctx, index) {
            //     return ListTile(
            //       leading:  CircleAvatar(
            //         child: Text((index+1).toString()),
            //       ),
            //       title: Text(meal.steps[index]),
            //     );
            //   },
            // ),
          ],
          
        ),
      )
    );
  }
}