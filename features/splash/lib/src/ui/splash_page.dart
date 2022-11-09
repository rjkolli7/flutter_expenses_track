import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash/src/controller/splash_controller.dart';

class SplashPage extends GetResponsiveView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.checkLogin();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorsHelper.kDarkBlue,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(
                color: ColorsHelper.kWhite,
                size: 100,
              ),
              SizedBox(height: SizesHelper.kPaddingEL),
              TextWidget(
                text: 'Expenses Tracker',
                textColor: ColorsHelper.kWhite,
                textSize: SizesHelper.kPaddingL,
              )
            ],
          ),
        ),
      ),
    );
  }
}
