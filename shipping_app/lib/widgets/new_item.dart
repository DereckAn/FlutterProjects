import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shipping_app/models/category.dart';
// import 'package:shipping_app/models/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'package:shipping_app/models/grocery_item.dart';

import '../data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var enterQuantity = 1;
  var _selectedCategory = categories[Categories.fruit]!;
  var _enteredName = '';
  var _isSending = false;

  void _savaItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      final url = Uri.https(
          'hola-2da75-default-rtdb.firebaseio.com', 'shopping-list.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'name': _enteredName,
            'quantity': enterQuantity,
            'category': _selectedCategory.title,
          },
        ),
      );

      // print(response.body);
      // print(response.statusCode);

      final Map<String, dynamic> resData = json.decode(response.body);

      // ignore: use_build_context_synchronously
      if (!context.mounted) {
        return;
      }

      Navigator.of(context).pop(GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: enterQuantity,
          category: _selectedCategory));

      // Navigator.of(context).pop(GroceryItem(
      //     id: DateTime.now().toString(),
      //     name: _enteredName,
      //     quantity: enterQuantity,
      //     category: _selectedCategory));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(labelText: 'Item Name'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length >= 50) {
                    return 'Must be between 1 and 50 characters long.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) ==
                                null || // Esto es para convertir el string en int
                            int.tryParse(value)! <= 0) {
                          return 'Must be a number greater than 0';
                        }
                        return null;
                      },
                      initialValue: enterQuantity.toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      onSaved: (value) {
                        enterQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: _isSending
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                            },
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isSending ? null : _savaItem,
                      child: _isSending
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Add'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
