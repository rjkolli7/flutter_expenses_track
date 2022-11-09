import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomes/incomes.dart';
import 'package:incomes/src/ui/income_transaction_list.dart';

class IncomesPage extends GetResponsiveView<IncomesController> {
  IncomesPage({
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
        child: IncomeTransactionList(),
      ),
    );
  }
}
