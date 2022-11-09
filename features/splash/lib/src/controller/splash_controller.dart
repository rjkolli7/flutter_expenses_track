import 'dart:async';

import 'package:components/components.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final IFirebaseAuth fbaRepo;

  SplashController({required this.fbaRepo});

  void checkLogin() async {
    FirebaseUserResponse? user = await fbaRepo.currentUser();
    Timer(Duration(seconds: 1), () {
      if (user != null) {
        Get.toNamed(Routes.dashboard);
      } else {
        Get.toNamed(Routes.auth);
      }
    });
  }
}
