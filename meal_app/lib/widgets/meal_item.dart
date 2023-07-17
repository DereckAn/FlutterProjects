import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {},
      child: Stack(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
          ), // Esto es para que la imagen no carge de repente, sino que se vea borrosa desde el principio
          Positioned(
            bottom: 0,
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
                      overflow: TextOverflow.ellipsis, // Esto es lo que apsara ocn el texto cuando se salga del margen 
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [],
                    )
                  ],
                )),
          ) // Juega con esto para aprender a usarlo
        ],
      ),
    ));
  }
}
