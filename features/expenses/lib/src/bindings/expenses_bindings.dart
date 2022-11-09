import 'package:expenses/src/controller/expenses_controller.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';

class ExpensesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IFrdCountriesRepo>(() => FrdCountriesRepoImpl());
    Get.lazyPut<IFrdUsers>(() => FrdUsersRepo());
    Get.lazyPut<IFirebaseAuth>(() => FirebaseAuthRepo());
    Get.lazyPut<IFrdExpensesRepo>(() => FrdExpensesRepoImpl());
    Get.lazyPut(
      () => ExpensesController(
        frdExpensesRepo: Get.find(),
        frdCountriesRepo: Get.find(),
        frdUsersRepo: Get.find(),
        firebaseAuthRepo: Get.find(),
      ),
    );
  }
}
