import 'package:expences020/model/expense.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.listOfExpenses, this.onDelete, {super.key});

  final List<Expense> listOfExpenses;
  final void Function(Expense expense) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((cont, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.5),
            margin:  EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
          key: ValueKey(listOfExpenses[index]),
          // esto para eliminar los objetos de la lsita
          onDismissed: (direction) {
            onDelete(listOfExpenses[index]);
          },
          child: ExpenseItem(listOfExpenses[index]))),
      itemCount: listOfExpenses.length,
    );
  }
}
