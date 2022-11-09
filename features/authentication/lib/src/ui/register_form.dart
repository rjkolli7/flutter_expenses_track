import 'package:authentication/src/controller/auth_controller.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterForm extends GetResponsiveView<AuthController> {
  final Animation<double> animation;

  RegisterForm({
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    controller.getCountries();
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? SizesHelper.kSpaceM : SizesHelper.kSpaceS;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizesHelper.kPaddingL),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: <Widget>[
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 0.0,
              child: EmailTextFormField(key: controller.emailKey),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: space,
              child: PasswordTextField(key: controller.pwdKey),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: space,
              child: FirstNameFormField(key: controller.fnKey),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: space,
              child: LastNameFormField(key: controller.lnKey),
            ),
            SizedBox(height: space),
            CountryFormField(
                key: controller.countryKey,
                countries: controller.countryNames,
                onCountrySelected: (index, countryName) {
                  controller.selectCountry(index, countryName);
                }),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: space,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => TextWidget(
                      text: '+ ${controller.selectedCountry?.code ?? '60'}',
                      textColor: ColorsHelper.kBlack.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Obx(
                      () => PhoneTextFormField(
                        key: controller.phoneKey,
                        length: controller.selectedCountry?.phoneLength,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: space,
              child: GenderFormField(key: controller.genderKey),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: space,
              child: DobFormField(key: controller.dobKey),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 2 * space,
              child: RegisterButton(
                onPressed: () async {
                  bool success = await controller.register();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
