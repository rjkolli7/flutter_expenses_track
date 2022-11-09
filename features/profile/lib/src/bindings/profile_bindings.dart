import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';
import 'package:profile/src/controller/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IFirebaseAuth>(() => FirebaseAuthRepo());
    Get.lazyPut<IFrdUsers>(() => FrdUsersRepo());
    Get.lazyPut<IFrdCountriesRepo>(() => FrdCountriesRepoImpl());
    Get.lazyPut(
      () => ProfileController(
        frdUsers: Get.find(),
        firebaseAuthRepo: Get.find(),
        frdCountriesRepo: Get.find(),
      ),
    );
  }
}
