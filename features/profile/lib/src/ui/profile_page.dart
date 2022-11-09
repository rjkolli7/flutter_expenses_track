import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/profile.dart';

class ProfilePage extends GetResponsiveView<ProfileController> {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getCountries();
    controller.getUserInfo();
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: SizesHelper.kPaddingEL,
              horizontal: SizesHelper.kPaddingL,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FirstNameFormField(key: controller.fnKey),
                  const SizedBox(height: 10),
                  LastNameFormField(key: controller.lnKey),
                  const SizedBox(height: 10),
                  EmailTextFormField(
                    key: controller.emailKey,
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                  CountryFormField(
                      key: controller.countryKey,
                      enabled: false,
                      countries: controller.countryNames,
                      onCountrySelected: (index, countryName) {
                        controller.selectCountry(index, countryName);
                      }),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextWidget(
                            text:
                                '+ ${controller.selectedCountry?.code ?? '60'}',
                            textColor: ColorsHelper.kBlack.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Obx(
                          () => PhoneTextFormField(
                            key: controller.phoneKey,
                            length: controller.selectedCountry?.phoneLength,
                            minLength: controller.selectedCountry?.phoneLength,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GenderFormField(key: controller.genderKey),
                  const SizedBox(height: 10),
                  DobFormField(key: controller.dobKey),
                  const SizedBox(height: 30),
                  UpdateProfileButton(
                    onPressed: () async {
                      bool response = await controller.updateUserInfo();
                    },
                  ),
                  const SizedBox(height: 30),
                  Visibility(
                    visible: GetPlatform.isMobile,
                    child: LogoutButton(
                      onPressed: () {
                        controller.logout();
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
