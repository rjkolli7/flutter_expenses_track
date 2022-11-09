import 'package:add_income_expense/add_income_expense.dart';
import 'package:authentication/authentication.dart';
import 'package:components/components.dart';
import 'package:coremodules/src/bindings/app_bindings.dart';
import 'package:dashboard/dashboard.dart';
import 'package:expenses/expenses.dart';
import 'package:get/get.dart';
import 'package:incomes/incomes.dart';
import 'package:profile/profile.dart';
import 'package:splash/splash.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      binding: SplashBindings(),
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.auth,
      binding: AuthBindings(),
      page: () => AuthPageMain(),
    ),
    GetPage(
      name: Routes.dashboard,
      binding: CoreBindings(),
      page: () => DashboardMain(),
    ),
    GetPage(
      name: Routes.addIncomeExpense,
      binding: AddIncomeExpensesBindings(),
      page: () => AddIncomeExpensePage(),
    ),
    GetPage(
      name: Routes.expenses,
      binding: ExpensesBindings(),
      page: () => ExpensesPage(),
    ),
    GetPage(
      name: Routes.incomes,
      binding: IncomesBindings(),
      page: () => IncomesPage(),
    ),
    GetPage(
      name: Routes.profile,
      binding: ProfileBindings(),
      page: () => ProfilePage(),
    ),
  ];
}
