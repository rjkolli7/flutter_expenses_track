import 'package:firebase_integration/firebase_integration.dart';

abstract class IFrdExpensesRepo {
  Future<String> addExpenses(ExpenseBody body);
  Future<String> updateExpenses(ExpenseBody body);
  Future<ExpensesResponse> getExpenses();
}
