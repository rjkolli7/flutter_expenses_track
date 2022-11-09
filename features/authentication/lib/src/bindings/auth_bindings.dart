import 'package:authentication/src/controller/auth_controller.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IFirebaseAuth>(() => FirebaseAuthRepo());
    Get.lazyPut<IFrdCountriesRepo>(() => FrdCountriesRepoImpl());
    Get.lazyPut(() => AuthController(
          fbaRepo: Get.find(),
          frdCountriesRepo: Get.find(),
        ));
  }
}
