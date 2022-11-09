import 'package:components/components.dart';
import 'package:expenses/expenses.dart';
import 'package:expenses/src/ui/expense_transaction_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseTransactionList extends GetResponsiveView<ExpensesController> {
  ExpenseTransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Expenses History',
            textColor: ColorsHelper.kBlack,
            textSize: 16,
          ),
          SizedBox(height: 10),
          controller.expenses.isNotEmpty
              ? ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.expenses.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      var data = controller.expenses[index];
                      return ExpenseTransactionListItem(
                        data: data,
                      );
                    });
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                      color: ColorsHelper.kBlack.withOpacity(0.3),
                    );
                  },
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizesHelper.kPaddingEL,
                      horizontal: SizesHelper.kPaddingS),
                  child: NoDataWidget(
                    message: 'No Expenses transactions',
                    description: 'Add expenses to track your daily spends',
                    buttonText: '+ Add Expense',
                    onActionClick: () {
                      controller.tabController?.index = 2;
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
