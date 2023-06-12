import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../data/categories.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';

class GroceryListF extends StatefulWidget {
  const GroceryListF({super.key});

  @override
  State<GroceryListF> createState() => _GroceryListStateF();
}

class _GroceryListStateF extends State<GroceryListF> {
  List<GroceryItem> _groceryItems = [];
  Future<List<GroceryItem>>? _groceryItemsFuture;
  String? error;

  // var isLoading = true;

  @override
  void initState() {
    super.initState();
    _groceryItemsFuture = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        'hola-2da75-default-rtdb.firebaseio.com', 'shopping-list.json');
    // try {
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      // setState(() {
      //   error = "Error 400 or more";
      // });
      throw Exception('Error 400 or more');
    }

    if (response.body == 'null') {
      // setState(() {
      //   isLoading = false;
      // });
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (element) => element.value.title == item.value['category'])
          .value;

      loadedItems.add(GroceryItem(
        id: item.key,
        name: item.value['name'],
        quantity: item.value['quantity'],
        category: category,
      ));
    }
    return loadedItems;

    // setState(() {
    //   _groceryItems = loadedItems;
    //   isLoading = false;
    // });

    // } catch (e) {
    //   setState(() {
    //     error = "Something went wrong ";
    //   });
    // }

    // throw Exception('Error 400 or more'); No usarlo ahorita

    // print(response.body);
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (context) => const NewItem()));
    // Navigator.pushNamed(context, '/new-item');
    // Esta es una nueva manera de camiar de paginas.
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewItem()));

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  // void removeItem(GroceryItem item) {
  //   final url = Uri.https('hola-2da75-default-rtdb.firebaseio.com',
  //       'shopping-list/${item.id}.json');

  //   http.delete(url);

  //   setState(() {
  //     _groceryItems.remove(item);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items yet!'),
    );

    // if (isLoading) {
    //   content = const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }

    // if (error != null) {
    //   content = Center(
    //     child: Text(error!),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
          ),
        ],
      ),
      body: FutureBuilder(
        future: _groceryItemsFuture,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No items yet!'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Dismissible(
              onDismissed: (direction) => setState(() {
                final url = Uri.https('hola-2da75-default-rtdb.firebaseio.com',
                    'shopping-list/${ snapshot.data![index].id}.json');

                http.delete(url);
                 snapshot.data!.removeAt(index);
              }),
              key: ValueKey( snapshot.data![index].id),
              child: ListTile(
                title: Text( snapshot.data![index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color:  snapshot.data![index].category.color,
                ),
                trailing: Text('${ snapshot.data![index].quantity}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
