import 'package:components/components.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';

class ExpensesController extends BaseController {
  final IFrdExpensesRepo frdExpensesRepo;
  final IFrdCountriesRepo frdCountriesRepo;
  final IFirebaseAuth firebaseAuthRepo;
  final IFrdUsers frdUsersRepo;

  ExpensesController({
    required this.frdExpensesRepo,
    required this.frdCountriesRepo,
    required this.firebaseAuthRepo,
    required this.frdUsersRepo,
  });

  init() async {
    await getCountries();
    await getUser();
    await getExpenses();
    selectCountry(0, firebaseUser?.countryName ?? '');
  }

  List<Expense> get expenses => _expenses;
  final RxList<Expense> _expenses = <Expense>[].obs;

  List<Country> get countries => _countries;
  final RxList<Country> _countries = <Country>[].obs;

  Country? get selectedCountry => _selectedCountry.value;

  // ignore: unnecessary_cast
  final Rx<Country?> _selectedCountry = (null as Country?).obs;

  FirebaseUserData? get firebaseUser => _firebaseUser.value;

  // ignore: unnecessary_cast
  final Rx<FirebaseUserData?> _firebaseUser = (null as FirebaseUserData?).obs;

  Future getCountries() async {
    await frdCountriesRepo.getCountries().then((value) {
      if (value.countries != null) {
        _countries.value = value.countries ?? [];
        if (countries.isNotEmpty) {
          selectCountry(0, firebaseUser?.countryName ?? '');
        }
      }
    }).catchError((onError) {});
  }

  void selectCountry(int index, String countryName) {
    var countryList = countries.where((e) => e.name == countryName).toList();
    if (countryList.isNotEmpty) {
      _selectedCountry.value = countryList.first;
    }
  }

  Future getUser() async {
    FirebaseUserResponse? user = await firebaseAuthRepo.currentUser();
    if (user != null && user.user?.uid != null) {
      String uid = user.user!.uid!;
      frdUsersRepo.getUser(uid).then((value) {
        if (value.user != null) {
          _firebaseUser.value = value.user!;
          '${firebaseUser?.firstName ?? ''} ${firebaseUser?.lastName ?? ''}';
        }
      }).catchError((onError) {});
    }
  }

  Future getExpenses() async {
    await frdExpensesRepo.getExpenses().then((value) {
      if (value.expensesList != null && value.expensesList!.isNotEmpty) {
        _expenses.value = value.expensesList!.map((e) {
          e.currencySymbol = selectedCountry?.symbol ?? '';
          return e;
        }).toList();
      }
    }).catchError((onError) {});
  }
}
