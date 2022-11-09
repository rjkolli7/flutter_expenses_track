import 'package:components/components.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final IFrdUsers frdUsers;
  final IFirebaseAuth firebaseAuthRepo;
  final IFrdCountriesRepo frdCountriesRepo;

  ProfileController({
    required this.frdUsers,
    required this.firebaseAuthRepo,
    required this.frdCountriesRepo,
  });

  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<EmailTextFormFieldState>();
  final fnKey = GlobalKey<FirstNameFormFieldState>();
  final lnKey = GlobalKey<LastNameFormFieldState>();
  final genderKey = GlobalKey<GenderFormFieldState>();
  final phoneKey = GlobalKey<PhoneTextFormFieldState>();
  final countryKey = GlobalKey<CountryFormFieldState>();
  final dobKey = GlobalKey<DobFormFieldState>();

  String? _uid;
  FirebaseUserData? firebaseUser;

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
        if (countries.isNotEmpty) {
          selectCountry(0, firebaseUser?.countryName ?? '');
        }
      }
    }).catchError((onError) {});
  }

  void getUserInfo() async {
    FirebaseUserResponse? user = await firebaseAuthRepo.currentUser();
    if (user != null) {
      _uid = user.user?.uid;
      frdUsers.getUser(_uid ?? '').then((value) {
        if (value.user != null) {
          firebaseUser = value.user!;
          emailKey.currentState?.emailController.text =
              firebaseUser?.email ?? '';
          fnKey.currentState?.firstNameController.text =
              firebaseUser?.firstName ?? '';
          lnKey.currentState?.lastNameController.text =
              firebaseUser?.lastName ?? '';
          genderKey.currentState?.genderController.text =
              firebaseUser?.gender ?? '';
          phoneKey.currentState?.phoneController.text =
              firebaseUser?.mobile ?? '';
          dobKey.currentState?.dobController.text = firebaseUser?.dob ?? '';
          countryKey.currentState?.countryController.text =
              firebaseUser?.countryName ?? '';
          if (countries.isNotEmpty) {
            selectCountry(0, firebaseUser?.countryName ?? '');
          }
        }
      }).catchError((onError) {});
    }
  }

  Future<bool> updateUserInfo() async {
    if (formKey.currentState?.validate() == true) {
      showLoader('Updating Profile...');
      String email = emailKey.currentState?.emailController.text ?? '';
      String fName = fnKey.currentState?.firstNameController.text ?? '';
      String lName = lnKey.currentState?.lastNameController.text ?? '';
      String gender = genderKey.currentState?.genderController.text ?? '';
      String phone = phoneKey.currentState?.phoneController.text ?? '';
      String dob = dobKey.currentState?.dobController.text ?? '';
      String country = countryKey.currentState?.countryController.text ?? '';

      FirebaseAuthBody authBody = FirebaseAuthBody(
        email: email,
        firstName: fName,
        lastName: lName,
        mobile: phone,
        gender: gender,
        dob: dob,
        uid: _uid,
        countryName: country,
      );
      FirebaseUserResponse response = await frdUsers
          .updateUser(authBody)
          .then((value) => value)
          .catchError((onError) => onError);
      print(response);
      dismissEasyLoading();
      if (response.user != null) {
        showSuccess('Updated profile successfully!');
        return true;
      }
      showError('Failed updating profile! ${response.error}');
    }
    return false;
  }

  void logout() async {
    await firebaseAuthRepo.logout();
    Get.offAllNamed(Routes.auth);
  }
}
