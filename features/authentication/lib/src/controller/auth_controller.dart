import 'package:components/components.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final IFirebaseAuth fbaRepo;
  final IFrdCountriesRepo frdCountriesRepo;

  AuthController({
    required this.fbaRepo,
    required this.frdCountriesRepo,
  });

  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<EmailTextFormFieldState>();
  final pwdKey = GlobalKey<PasswordTextFieldState>();
  final cngPwdKey = GlobalKey<PasswordTextFieldState>();
  final fnKey = GlobalKey<FirstNameFormFieldState>();
  final lnKey = GlobalKey<LastNameFormFieldState>();
  final genderKey = GlobalKey<GenderFormFieldState>();
  final phoneKey = GlobalKey<PhoneTextFormFieldState>();
  final dobKey = GlobalKey<DobFormFieldState>();
  final countryKey = GlobalKey<CountryFormFieldState>();

  final RxBool _isEmailExist = false.obs;

  bool get isEmailExist => _isEmailExist.value;
  final RxBool _isCheckingEmail = false.obs;

  bool get isCheckingEmail => _isCheckingEmail.value;

  List<Country> get countries => _countries;
  final RxList<Country> _countries = <Country>[].obs;

  List<String> get countryNames => _countryNames;
  final RxList<String> _countryNames = <String>[].obs;

  Country? get selectedCountry => _selectedCountry.value;

  // ignore: unnecessary_cast
  final Rx<Country?> _selectedCountry = (null as Country?).obs;

  void selectCountry(int index, String countryName) {
    var countryList = countries.where((e) => e.name == countryName).toList();
    if (countryList.isNotEmpty) {
      _selectedCountry.value = countryList.first;
    }
  }

  void getCountries() async {
    await frdCountriesRepo.getCountries().then((value) {
      if (value.countries != null) {
        _countries.value = value.countries ?? [];
        _countryNames.value = countries.map((e) => e.name ?? '').toList();
      }
    }).catchError((onError) {});
  }

  Future<bool> verifyEmail() async {
    showLoader('Verifying email..');
    String? email = emailKey.currentState?.emailController.text ?? '';
    _isEmailExist.value = await fbaRepo
        .verifyEmail(email)
        .then((value) => value)
        .catchError((onError) => onError);
    _isCheckingEmail.value = true;
    dismissEasyLoading();
    if (!isEmailExist) {
      showError('Email not exist, please register!');
    }
    return isEmailExist;
  }

  Future<bool> login() async {
    showLoader('Please wait, logging you in..');
    String? email = emailKey.currentState?.emailController.text ?? '';
    String? pwd = pwdKey.currentState?.passwordController.text ?? '';
    FirebaseUserResponse response = await fbaRepo
        .login(FirebaseAuthBody(email: email, password: pwd))
        .then((value) => value)
        .catchError((onError) => onError);
    print(response);
    dismissEasyLoading();
    if (response.user != null) {
      showSuccess('Successfully logged in!');
      Get.offAllNamed(Routes.dashboard);
      return true;
    }
    showError('Failed logged in, please try again! ${response.error}');
    return false;
  }

  Future<bool> register() async {
    if (formKey.currentState?.validate() == true) {
      showLoader('Please wait, Registering your profile..');
      String email = emailKey.currentState?.emailController.text ?? '';
      String pwd = pwdKey.currentState?.passwordController.text ?? '';
      String fName = fnKey.currentState?.firstNameController.text ?? '';
      String lName = lnKey.currentState?.lastNameController.text ?? '';
      String phone = phoneKey.currentState?.phoneController.text ?? '';
      String gender = genderKey.currentState?.genderController.text ?? '';
      String dob = dobKey.currentState?.dobController.text ?? '';
      String countryName =
          countryKey.currentState?.countryController.text ?? '';
      FirebaseAuthBody authBody = FirebaseAuthBody(
        email: email,
        password: pwd,
        firstName: fName,
        lastName: lName,
        mobile: phone,
        gender: gender,
        dob: dob,
        countryName: countryName,
      );
      FirebaseUserResponse response = await fbaRepo
          .register(authBody)
          .then((value) => value)
          .catchError((onError) => onError);
      print(response);
      dismissEasyLoading();
      if (response.user != null) {
        showSuccess('Successfully registered..');
        Get.offAllNamed(Routes.dashboard);
        return true;
      }
      showSuccess('Failed registering, please try again! ${response.error}');
    }
    return false;
  }
}
