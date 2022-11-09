import 'package:components/components.dart';
import 'package:expenses/expenses.dart';
import 'package:expenses/src/ui/expense_transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensesPage extends GetResponsiveView<ExpensesController> {
  ExpensesPage({
    Key? key,
  }) : super(key: key);

  void setTabController(TabController? tabController) {
    controller.setTabController(tabController);
  }

  @override
  Widget build(BuildContext context) {
    controller.init();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizesHelper.kPaddingL,
          vertical: SizesHelper.kPaddingEL,
        ),
        child: ExpenseTransactionList(),
      ),
    );
  }
}
