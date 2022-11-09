import 'package:dashboard/src/controller/dashboard_controller.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IFrdIncomesRepo>(() => FrdIncomesRepoImpl());
    Get.lazyPut<IFrdExpensesRepo>(() => FrdExpensesRepoImpl());
    Get.lazyPut<IFrdUsers>(() => FrdUsersRepo());
    Get.lazyPut<IFirebaseAuth>(() => FirebaseAuthRepo());
    Get.lazyPut<IFrdCountriesRepo>(() => FrdCountriesRepoImpl());
    Get.lazyPut(() => DashboardController(
          frdExpensesRepo: Get.find(),
          frdIncomesRepo: Get.find(),
          frdUsersRepo: Get.find(),
          firebaseAuthRepo: Get.find(),
          frdCountriesRepo: Get.find(),
        ));
  }
}
