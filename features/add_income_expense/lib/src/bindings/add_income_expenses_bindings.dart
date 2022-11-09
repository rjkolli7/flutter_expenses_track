import 'package:add_income_expense/src/controller/add_income_expense_controller.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';

class AddIncomeExpensesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IFrdIncomesRepo>(() => FrdIncomesRepoImpl());
    Get.lazyPut<IFrdExpensesRepo>(() => FrdExpensesRepoImpl());
    Get.lazyPut<IFrdCategoriesRepo>(() => FrdCategoriesRepoImpl());
    Get.lazyPut<IFrdCategoryTypesRepo>(() => FrdCategoryTypesRepoImpl());
    Get.lazyPut(
      () => AddIncomeExpenseController(
        frdIncomesRepo: Get.find(),
        frdExpensesRepo: Get.find(),
        frdCategoriesRepo: Get.find(),
        frdCategoryTypesRepo: Get.find(),
      ),
    );
  }
}
