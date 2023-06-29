import 'package:expences020/model/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.addExpense, {super.key});

  final void Function(Expense expense) addExpense;

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

  void _submittedForm() {
    //validation
    final enteredAmount = double.tryParse(_amoutnController
        .text); //esto es para convertir el texto a double para el validation
    final amountValid = enteredAmount == null || enteredAmount <= 0;
    if (amountValid ||
        _titleController.text.trim().isEmpty ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please enter a valid amount and title'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'))
          ],
        ),
      );
      return;
    }
    widget.addExpense(Expense(
        category: _selectedCategory,
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!));
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
    final keyBoard = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
final widthh = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 60, 16, keyBoard + 16),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton(
                        value: _selectedCategory,
                        // Esto es importante para crear un dropdown
                        items: Category.values
                            .map(
                              (enu) => DropdownMenuItem(
                                value: enu,
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
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(
                                  context); //esto hace que se cierre el wigdet
                            },
                            child: const Text('Cancel')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _submittedForm();
                            }, //() => Navigator.pop(context
                            child: const Text("Add")),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
