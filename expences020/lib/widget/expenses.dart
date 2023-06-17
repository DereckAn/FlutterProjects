import 'package:expences020/model/expense.dart';
import 'package:flutter/material.dart';

import 'expenses_list/expenses_list.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        category: Category.other,
        title: "Videogame",
        amount: 69.99,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        title: "Pollo",
        amount: 9.99,
        date: DateTime.now()),
    Expense(
        category: Category.housing,
        title: "Jabon",
        amount: 14.99,
        date: DateTime.now()),
    Expense(
        category: Category.housing,
        title: "Jabon",
        amount: 14.99,
        date: DateTime.now()),
  ];

  _openAdd() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _openAdd,
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: ExpensesList(_registerExpenses)),
          ],
        ));
  }
}
