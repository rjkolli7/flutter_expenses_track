import 'package:components/components.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddIncomeExpenseController extends GetxController
    with StateMixin<dynamic> {
  final IFrdIncomesRepo frdIncomesRepo;
  final IFrdExpensesRepo frdExpensesRepo;
  final IFrdCategoryTypesRepo frdCategoryTypesRepo;
  final IFrdCategoriesRepo frdCategoriesRepo;

  AddIncomeExpenseController({
    required this.frdIncomesRepo,
    required this.frdExpensesRepo,
    required this.frdCategoriesRepo,
    required this.frdCategoryTypesRepo,
  });

  final formKey = GlobalKey<FormState>();
  final categoryTypeKey = GlobalKey<CustomFormFieldState>();
  final categoryKey = GlobalKey<CustomFormFieldState>();
  final dateKey = GlobalKey<CustomFormFieldState>();
  final remarkKey = GlobalKey<CustomFormFieldState>();
  final amountKey = GlobalKey<CustomFormFieldState>();

  List<Categories> get categories => _categories;
  final RxList<Categories> _categories = <Categories>[].obs;

  List<Categories> get filteredCategories => _filteredCategories;
  final RxList<Categories> _filteredCategories = <Categories>[].obs;

  List<String> get categoryNames => _categoryNames;
  final RxList<String> _categoryNames = <String>[].obs;

  List<CategoryType> get categoryTypes => _categoryTypes;
  final RxList<CategoryType> _categoryTypes = <CategoryType>[].obs;

  List<String> get categoryTypeNames => _categoryTypeNames;
  final RxList<String> _categoryTypeNames = <String>[].obs;

  CategoryType? get selectedCategoryType => _selectedCategoryType.value;

  // ignore: unnecessary_cast
  final Rx<CategoryType?> _selectedCategoryType = (null as CategoryType?).obs;

  Categories? get selectedCategories => _selectedCategories.value;

  // ignore: unnecessary_cast
  final Rx<Categories?> _selectedCategories = (null as Categories?).obs;

  int get selectedCategoryIndex => _selectedCategoryIndex.value;

  // ignore: unnecessary_cast
  final RxInt _selectedCategoryIndex = (-1).obs;

  int get selectedCategoryTypeIndex => _selectedCategoryTypeIndex.value;

  // ignore: unnecessary_cast
  final RxInt _selectedCategoryTypeIndex = (-1).obs;

  int dateTimeStamp = -1;

  void getCategoryTypes() async {
    await frdCategoryTypesRepo.getCategoryTypes().then((value) {
      if (value.categoryTypesList != null) {
        _categoryTypes.value = value.categoryTypesList ?? [];
        _categoryTypeNames.value =
            categoryTypes.map((e) => e.type ?? '').toList();
      }
    }).catchError((onError) {});
  }

  Future getCategories() async {
    await frdCategoriesRepo.getCategories().then((value) {
      if (value.categoriesList != null) {
        List<Categories> filteredCategories = value.categoriesList ?? [];
        _categories.value = filteredCategories;
      }
    }).catchError((onError) {});
  }

  Future getCategoriesByTypeId() async {
    if (categories.isEmpty) {
      await getCategories();
    }
    List<Categories> filteredCategories = categories
        .where((element) => element.typeId == selectedCategoryType?.id)
        .toList();
    _filteredCategories.value = filteredCategories;
    _categoryNames.value = filteredCategories.map((e) => e.name ?? '').toList();
  }

  void selectCategoryType(int index, CategoryType type) async {
    _selectedCategoryType.value = type;
    categoryTypeKey.currentState?.customerFieldController.text =
        type.type ?? '';
    _selectedCategoryTypeIndex.value = index;
    selectCategory(-1, null);
    await getCategoriesByTypeId();
  }

  void selectCategory(int index, Categories? category) {
    _selectedCategories.value = category;
    categoryKey.currentState?.customerFieldController.text =
        category?.name ?? '';
    _selectedCategoryIndex.value = index;
  }

  Future<bool> addExpenses() async {
    String amount = amountKey.currentState?.customerFieldController.text ?? '';
    String date = dateKey.currentState?.customerFieldController.text ?? '';
    if (selectedCategories == null &&
        selectedCategoryType == null &&
        amount.isEmpty &&
        date.isEmpty) {
      return false;
    }
    showLoader('Adding expense..');
    ExpenseBody body = ExpenseBody(
      categoryType: selectedCategoryType?.type,
      category: selectedCategories?.name,
      date: date,
      remark: remarkKey.currentState?.customerFieldController.text ?? '',
      amount: double.parse(amount),
      timeStamp: dateTimeStamp,
    );
    String response = await frdExpensesRepo
        .addExpenses(body)
        .then((value) => value)
        .catchError((onError) => onError);
    dismissEasyLoading();
    if (response == 'success') {
      showSuccess('Expense added successfully!');
      clearAll();
      return true;
    }
    showError('Failed to add expense! $response}');
    return false;
  }

  void clearAll() {
    amountKey.currentState?.customerFieldController.text = '';
    dateKey.currentState?.customerFieldController.text = '';
    remarkKey.currentState?.customerFieldController.text = '';
    categoryKey.currentState?.customerFieldController.text = '';
    categoryTypeKey.currentState?.customerFieldController.text = '';
    _selectedCategoryType.value = null;
    _selectedCategoryTypeIndex.value = -1;
    _selectedCategories.value = null;
    _selectedCategoryIndex.value = -1;
  }

  Future<bool> addIncomes() async {
    String amount = amountKey.currentState?.customerFieldController.text ?? '';
    String date = dateKey.currentState?.customerFieldController.text ?? '';
    if (selectedCategories == null && amount.isEmpty && date.isEmpty) {
      return false;
    }
    showLoader('Adding income..');
    IncomeBody body = IncomeBody(
      categoryType: selectedCategoryType?.type,
      category: selectedCategories?.name,
      date: date,
      remark: remarkKey.currentState?.customerFieldController.text ?? '',
      amount: double.parse(amount),
      timeStamp: dateTimeStamp,
    );
    String response = await frdIncomesRepo
        .addIncome(body)
        .then((value) => value)
        .catchError((onError) => onError);
    dismissEasyLoading();
    if (response == 'success') {
      showSuccess('Income added successfully!');
      clearAll();
      return true;
    }
    showError('Failed to add income! $response}');
    return false;
  }
}
