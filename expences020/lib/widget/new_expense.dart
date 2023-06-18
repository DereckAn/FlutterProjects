import 'package:expences020/model/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _entereTitle = '';
  // void _saveTitle(String title) {
  //   _entereTitle = title;
  // }

  final _titleController = TextEditingController();
  final _amoutnController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.other;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      //este es un widget ya hecho por flutter para mostrar un calendario
      context: context,
      initialDate: now,
      firstDate: DateTime(2021),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    //esto es oara eliminar el controlador
    //porue si no se elimina se queda en memoria y se puede generar un error
    _titleController.dispose();
    _amoutnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller:
                _titleController, //Estos son varios metodos para obtener el texto
            // onChanged: _saveTitle, // estse es otro meotodo para obtener el texto
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller:
                      _amoutnController, //Estos son varios metodos para obtener el texto
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    labelText: "Amount",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No date chosen'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                  // Esto es importante para crear un dropdown
                  items: Category.values
                      .map(
                        (enu) => DropdownMenuItem(
                          value: category,
                          child: Text(enu.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context); //esto hace que se cierre el wigdet
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    // print(_entereTitle);
                    print(_titleController.text);
                    print(_amoutnController.text);
                  },
                  child: const Text("Add")),
            ],
          )
        ],
      ),
    );
  }
}
