import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';
import 'package:incomes/src/controller/incomes_controller.dart';

class IncomesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IFrdIncomesRepo>(() => FrdIncomesRepoImpl());
    Get.lazyPut<IFrdCountriesRepo>(() => FrdCountriesRepoImpl());
    Get.lazyPut<IFrdUsers>(() => FrdUsersRepo());
    Get.lazyPut<IFirebaseAuth>(() => FirebaseAuthRepo());
    Get.lazyPut(
      () => IncomesController(
        frdIncomesRepo: Get.find(),
        frdCountriesRepo: Get.find(),
        frdUsersRepo: Get.find(),
        firebaseAuthRepo: Get.find(),
      ),
    );
  }
}
