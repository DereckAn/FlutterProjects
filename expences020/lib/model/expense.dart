import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  food,
  clothing,
  housing,
  leisure,
  education,
  health,
  entertainment,
  other,
  travel,
  work
}

const categoryIcons = {
Category.food: Icons.lunch_dining,
Category.clothing: Icons.shopping_bag,
Category.housing: Icons.home,
Category.leisure: Icons.sports_soccer,
Category.education: Icons.school,
Category.health: Icons.local_hospital,
Category.entertainment: Icons.movie,
Category.other: Icons.money,
Category.travel: Icons.flight,
Category.work: Icons.work,
};

class Expense {

  Expense({required this.category,required this.title, required this.amount, required this.date}) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}