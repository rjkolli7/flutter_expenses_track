import 'package:components/components.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

initEasyLoading() => EasyLoading.init();
void easyLoadingConfig() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = ColorsHelper.kDarkBlue
    ..backgroundColor = ColorsHelper.kLightGrey
    ..indicatorColor = ColorsHelper.kOrange
    ..textColor = ColorsHelper.kOrange
    ..maskColor = ColorsHelper.kBlue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

void showToast(String message) {
  EasyLoading.showToast(message);
}

void showSuccess(String message) {
  EasyLoading.showSuccess(message);
}

void showError(String message) {
  EasyLoading.showError(message);
}

void showLoader(String? message) {
  EasyLoading.show(
    status: message ?? 'Loading...',
  );
}

void dismissEasyLoading() {
  EasyLoading.dismiss();
}
