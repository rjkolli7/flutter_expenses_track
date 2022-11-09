import 'package:authentication/src/controller/auth_controller.dart';
import 'package:authentication/src/ui/login_form.dart';
import 'package:authentication/src/ui/register_form.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetResponsiveView<AuthController> {
  final Animation<double> headerTextAnimation;
  final Animation<double> formElementAnimation;
  final Animation<double> whiteTopClipperAnimation;
  final Animation<double> blueTopClipperAnimation;
  final Animation<double> greyTopClipperAnimation;

  LoginPage({
    required this.headerTextAnimation,
    required this.formElementAnimation,
    required this.whiteTopClipperAnimation,
    required this.blueTopClipperAnimation,
    required this.greyTopClipperAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: SizesHelper.kPaddingEL),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: whiteTopClipperAnimation,
                builder: (_, Widget? child) {
                  return ClipPath(
                    clipper: WhiteTopClipper(
                      yOffset: whiteTopClipperAnimation.value,
                    ),
                    child: child,
                  );
                },
                child: Container(color: ColorsHelper.kGrey),
              ),
              AnimatedBuilder(
                animation: greyTopClipperAnimation,
                builder: (_, Widget? child) {
                  return ClipPath(
                    clipper: GreyTopClipper(
                      yOffset: greyTopClipperAnimation.value,
                    ),
                    child: child,
                  );
                },
                child: Container(color: ColorsHelper.kBlue),
              ),
              AnimatedBuilder(
                animation: blueTopClipperAnimation,
                builder: (_, Widget? child) {
                  return ClipPath(
                    clipper: BlueTopClipper(
                      yOffset: blueTopClipperAnimation.value,
                    ),
                    child: child,
                  );
                },
                child: Container(color: ColorsHelper.kWhite),
              ),
            ],
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: SizesHelper.kPaddingEL),
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Header(animation: headerTextAnimation),
                    SizedBox(height: 180),
                    (!controller.isCheckingEmail || controller.isEmailExist)
                        ? LoginForm(animation: formElementAnimation)
                        : RegisterForm(animation: formElementAnimation),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
