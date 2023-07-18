import 'package:flutter/material.dart';

class MealIteamTrail extends StatelessWidget {
  const MealIteamTrail({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
         const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}
