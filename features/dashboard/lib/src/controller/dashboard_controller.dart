import 'package:components/components.dart';
import 'package:dashboard/src/model/expense_income_data.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  final IFrdIncomesRepo frdIncomesRepo;
  final IFrdExpensesRepo frdExpensesRepo;
  final IFirebaseAuth firebaseAuthRepo;
  final IFrdUsers frdUsersRepo;
  final IFrdCountriesRepo frdCountriesRepo;

  DashboardController({
    required this.frdIncomesRepo,
    required this.frdExpensesRepo,
    required this.frdUsersRepo,
    required this.firebaseAuthRepo,
    required this.frdCountriesRepo,
  });

  init() async {
    await getUser();
    await getCountries();
    await getIncomes();
    await getExpenses();
    filterExpensesIncomesByDate();
  }

  List<ExpenseIncomeData> expenseIncomes = List.empty(growable: true);

  List<ExpenseIncomeData> get expenseIncomesList => _expenseIncomesList;
  final RxList<ExpenseIncomeData> _expenseIncomesList =
      <ExpenseIncomeData>[].obs;

  List<Income> get incomes => _incomes;
  final RxList<Income> _incomes = <Income>[].obs;

  List<Expense> get expenses => _expenses;
  final RxList<Expense> _expenses = <Expense>[].obs;

  double get totalIncomes => _totalIncomes.value;
  final RxDouble _totalIncomes = 0.0.obs;

  double get totalExpenses => _totalExpenses.value;
  final RxDouble _totalExpenses = 0.0.obs;

  double get balanceAmount => _balanceAmount.value;
  final RxDouble _balanceAmount = 0.0.obs;

  String get userName => _userName.value;
  final RxString _userName = ''.obs;

  List<Country> get countries => _countries;
  final RxList<Country> _countries = <Country>[].obs;

  List<String> get countryNames => _countryNames;
  final RxList<String> _countryNames = <String>[].obs;

  Country? get selectedCountry => _selectedCountry.value;

  // ignore: unnecessary_cast
  final Rx<Country?> _selectedCountry = (null as Country?).obs;

  FirebaseUserData? get firebaseUser => _firebaseUser.value;

  // ignore: unnecessary_cast
  final Rx<FirebaseUserData?> _firebaseUser = (null as FirebaseUserData?).obs;

  void filterExpensesIncomesByDate() {
    expenseIncomes.sort((d1, d2) {
      int d2Time = d2.timeStamp ?? 0;
      int d1Time = d1.timeStamp ?? 0;
      return d2Time.compareTo(d1Time);
    });
    _expenseIncomesList.value = expenseIncomes;
  }

  void selectCountry(int index, String countryName) {
    var countryList = countries.where((e) => e.name == countryName).toList();
    if (countryList.isNotEmpty) {
      _selectedCountry.value = countryList.first;
    }
  }

  Future getCountries() async {
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

  void getAvailableBalance() {
    _balanceAmount.value = totalIncomes - totalExpenses;
  }

  Future getIncomes() async {
    await frdIncomesRepo.getIncomes().then((value) {
      if (value.incomesList != null && value.incomesList!.isNotEmpty) {
        double totalIncomeAmount = 0.0;
        expenseIncomes.clear();
        _incomes.value = value.incomesList!.map((e) {
          totalIncomeAmount = totalIncomeAmount + (e.amount ?? 0.0);
          Map<String, dynamic> map = e.toMap();
          map['currencySymbol'] = selectedCountry?.symbol ?? '';
          expenseIncomes.add(ExpenseIncomeData.fromMap(map));
          return e;
        }).toList();
        _totalIncomes.value = totalIncomeAmount;
      }
      getAvailableBalance();
    }).catchError((onError) {});
  }

  Future getExpenses() async {
    await frdExpensesRepo.getExpenses().then((value) {
      if (value.expensesList != null && value.expensesList!.isNotEmpty) {
        double totalExpensesAmount = 0.0;
        _expenses.value = value.expensesList!.map((e) {
          totalExpensesAmount = totalExpensesAmount + (e.amount ?? 0.0);
          Map<String, dynamic> map = e.toMap();
          map['currencySymbol'] = selectedCountry?.symbol ?? '';
          expenseIncomes.add(ExpenseIncomeData.fromMap(map));
          return e;
        }).toList();
        _totalExpenses.value = totalExpensesAmount;
      }
      getAvailableBalance();
    }).catchError((onError) {});
  }

  Future getUser() async {
    FirebaseUserResponse? user = await firebaseAuthRepo.currentUser();
    if (user != null && user.user?.uid != null) {
      String uid = user.user!.uid!;
      frdUsersRepo.getUser(uid).then((value) {
        if (value.user != null) {
          _firebaseUser.value = value.user!;
          _userName.value =
              '${firebaseUser?.firstName ?? ''} ${firebaseUser?.lastName ?? ''}';
        }
      }).catchError((onError) {});
    }
  }
}
