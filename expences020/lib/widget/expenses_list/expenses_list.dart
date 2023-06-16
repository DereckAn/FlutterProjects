import 'package:expences020/model/expense.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.listOfExpenses, {super.key});

  final List<Expense> listOfExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((cont, index) => ExpenseItem(listOfExpenses[index])),
      itemCount: listOfExpenses.length,
    );
  }
}