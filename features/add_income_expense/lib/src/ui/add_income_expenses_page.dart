import 'package:add_income_expense/add_income_expense.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddIncomeExpensePage
    extends GetResponsiveView<AddIncomeExpenseController> {
  AddIncomeExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getCategoryTypes();
    controller.getCategories();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizesHelper.kPaddingM,
          vertical: SizesHelper.kPaddingEL,
        ),
        child: Column(
          children: [
            TextWidget(
              text: 'Add income or expense',
              textSize: 20,
            ),
            SizedBox(height: 20),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SelectionWidget(
                    hint: 'Type',
                    title: 'Select Category Type',
                    fieldKey: controller.categoryTypeKey,
                    onPressSelect: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SafeArea(
                                  child: Obx(() {
                                    return CategoriesChoice(
                                        title: 'Choose Category Type',
                                        categoriesList:
                                            controller.categoryTypeNames,
                                        defaultValue: controller
                                            .selectedCategoryTypeIndex,
                                        onSelectCategory: (selected) {
                                          if (selected != null) {
                                            if (controller
                                                .categoryTypes.isNotEmpty) {
                                              controller.selectCategoryType(
                                                  selected,
                                                  controller
                                                      .categoryTypes[selected]);
                                            }
                                          }
                                        });
                                  }),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  SizedBox(height: 10),
                  SelectionWidget(
                      hint: 'Category',
                      title: 'Add Category',
                      fieldKey: controller.categoryKey,
                      onPressSelect: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16))),
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SafeArea(
                                    child: Obx(() {
                                      return CategoriesChoice(
                                          title: 'Choose Category',
                                          categoriesList:
                                              controller.categoryNames,
                                          defaultValue: controller
                                                  .selectedCategories?.id ??
                                              -1,
                                          onSelectCategory: (selected) {
                                            if (selected != null) {
                                              if (controller.filteredCategories
                                                  .isNotEmpty) {
                                                controller.selectCategory(
                                                    selected,
                                                    controller
                                                            .filteredCategories[
                                                        selected]);
                                              }
                                            }
                                          });
                                    }),
                                  ),
                                ],
                              );
                            });
                      }),
                  SizedBox(height: 10),
                  SelectionWidget(
                    hint: 'Date',
                    title: 'Add Date',
                    fieldKey: controller.dateKey,
                    onPressSelect: () {
                      selectDob(context);
                    },
                  ),
                  SizedBox(height: 10),
                  SelectionWidget(
                    hint: '0.00',
                    title: 'Add Amount',
                    isNumber: true,
                    readOnly: false,
                    fieldKey: controller.amountKey,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SelectionWidget(
              hint: 'Ex: Purchased Macbook, Profit from Stocks',
              title: 'Add Reason (Optional)',
              readOnly: false,
              fieldKey: controller.remarkKey,
            ),
            SizedBox(height: 20),
            Obx(
              () => controller.selectedCategoryType == null
                  ? Container()
                  : controller.selectedCategoryType?.id == 1
                      ? AddUpdateExpenseButton(onPressed: () async {
                          bool isSuccess = await controller.addExpenses();
                        })
                      : AddUpdateIncomeButton(onPressed: () async {
                          bool isSuccess = await controller.addIncomes();
                        }),
            )
          ],
        ),
      ),
    );
  }

  void selectDob(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      controller.dateTimeStamp = pickedDate.microsecondsSinceEpoch;
      int year = pickedDate.year;
      int month = pickedDate.month;
      int date = pickedDate.day;
      var selectedDate = '$date/$month/$year';
      controller.dateKey.currentState?.customerFieldController.text =
          selectedDate;
    }
  }
}
