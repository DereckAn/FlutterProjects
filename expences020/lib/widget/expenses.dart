import 'package:expences020/model/expense.dart';
import 'package:expences020/widget/chart/chart.dart';
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
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (ctx) => NewExpense(_addExpence),
    );
  }

  void _addExpence(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final index = _registerExpenses.indexOf(expense); //Esto es para que enlistar los itemas ypara cuando los eliminemos y apretemos undo vuelvana aparecer en el mismo lugar 
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpenses.insert(index, expense
              );
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthh = MediaQuery.of(context).size.width;
    
    Widget mainContext = const Center(
      child: Text("There are no expenses yet"),
    );

    if (_registerExpenses.isNotEmpty) {
      mainContext = ExpensesList(_registerExpenses, _deleteExpense);
    }

    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: const Text('Expenses', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _openAdd,
            )
          ],
        ),
        body: widthh < 600 ? Column(
          children: <Widget>[
            Chart(expenses: _registerExpenses),
            Expanded(child: mainContext),
          ],
        ) : Row(
         children: <Widget>[
            Expanded(child: Chart(expenses: _registerExpenses)),
            Expanded(child: mainContext),
          ],
        ),);
  }
}
