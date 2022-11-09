import 'package:authentication/src/controller/auth_controller.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetResponsiveView<AuthController> {
  final Animation<double> animation;

  LoginForm({
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? SizesHelper.kSpaceM : SizesHelper.kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizesHelper.kPaddingL),
      child: Obx(() {
        return Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 0.0,
                child: EmailTextFormField(
                  key: controller.emailKey,
                ),
              ),
              !controller.isCheckingEmail
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: space,
                      ),
                      child: FadeSlideTransition(
                        animation: animation,
                        additionalOffset: space,
                        child: PasswordTextField(
                          key: controller.pwdKey,
                        ),
                      ),
                    ),
              SizedBox(height: space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 2 * space,
                child: LoginButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      if (!controller.isCheckingEmail) {
                        await controller.verifyEmail();
                      } else if (controller.isCheckingEmail &&
                          controller.isEmailExist) {
                        controller.login();
                      }
                    }
                  },
                ),
              ),
              SizedBox(height: space),
            ],
          ),
        );
      }),
    );
  }
}
