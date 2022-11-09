import 'package:firebase_integration/src/database/expenses/model/expense.dart';

class ExpensesResponse {
  final List<Expense>? expensesList;
  String? error;
  ExpensesResponse({this.expensesList, this.error});

  factory ExpensesResponse.fromMap(dynamic map) {
    List<Expense> expenses = [];
    if (map != null) {
      map.forEach((element) {
        expenses.add(Expense.fromMap(element));
      });
    }
    return ExpensesResponse(expensesList: expenses);
  }
}
