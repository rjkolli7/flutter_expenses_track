import 'package:add_income_expense/add_income_expense.dart';
import 'package:authentication/authentication.dart';
import 'package:dashboard/dashboard.dart';
import 'package:expenses/expenses.dart';
import 'package:get/get.dart';
import 'package:incomes/incomes.dart';
import 'package:profile/profile.dart';
import 'package:splash/splash.dart';

class CoreBindings extends Bindings {
  @override
  void dependencies() {
    AuthBindings().dependencies();
    SplashBindings().dependencies();
    DashboardBindings().dependencies();
    ProfileBindings().dependencies();
    IncomesBindings().dependencies();
    ExpensesBindings().dependencies();
    AddIncomeExpensesBindings().dependencies();
  }
}
