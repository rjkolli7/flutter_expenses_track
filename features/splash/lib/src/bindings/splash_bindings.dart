import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';
import 'package:splash/src/controller/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IFirebaseAuth>(() => FirebaseAuthRepo());
    Get.lazyPut(() => SplashController(fbaRepo: Get.find()));
  }
}
