import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ,
    );
  }
}
