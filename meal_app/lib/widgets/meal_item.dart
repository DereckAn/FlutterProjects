import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item_trail.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,  required this.onMealSelected});
  final Meal meal;
  final void Function( Meal meal) onMealSelected;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            onMealSelected(meal);
            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealsDetailsScreen(meal: meal, ),),);
          },
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ), // Esto es para que la imagen no carge de repente, sino que se vea borrosa desde el principio
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2, //Maximas lineas que puede tener el texto
                        textAlign: TextAlign.center, //Centrado
                        softWrap: true, // Que este envuelto en un lindo formato
                        overflow: TextOverflow
                            .ellipsis, // Esto es lo que apsara ocn el texto cuando se salga del margen
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 17),
                          MealIteamTrail(
                              icon: Icons.schedule, label:'${meal.duration} min'),
                          const SizedBox(width: 17),
                          MealIteamTrail(
                              icon: Icons.work, label:complexityText),
                               const SizedBox(width: 17),
                          MealIteamTrail(
                              icon: Icons.attach_money, label:affordabilityText),
                        ],
                      ),
                    ],
                  ),
                ),
              ) // Juega con esto para aprender a usarlo
            ],
          ),
        ));
  }
}
