import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meal_app/providers/favorites_provider.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;
  // final void Function(Meal meal) onFavoritePressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                // onFavoritePressed(meal);
                final wasAdd = ref.read(favoriteMeals.notifier).addOrRemove(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${wasAdd ? 'Add' : 'Remove'} to favorites'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.star),
            ),
          ],
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
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
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 1, 61, 89),
                    child: Text(
                        (meal.ingredients.indexOf(ingredient) + 1).toString()),
                  ),
                  title: Text(
                    ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
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
                  leading: CircleAvatar(
                    child: Text((meal.steps.indexOf(step) + 1).toString()),
                  ),
                  title: Text(
                    step,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
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
        ));
  }
}
