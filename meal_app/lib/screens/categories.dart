import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: GridView(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          children: const [
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
            Text('5'),
            Text('6'),
            Text('7'),
            Text('8'),
            Text('9'),
            Text('10'),

          ],
        ));
  }
}
