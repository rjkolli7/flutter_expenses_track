import 'package:components/components.dart';
import 'package:dashboard/src/controller/dashboard_controller.dart';
import 'package:dashboard/src/ui/transaction_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionList extends GetResponsiveView<DashboardController> {
  TransactionList({
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
            text: 'Transaction History',
            textColor: ColorsHelper.kBlack,
            textSize: 16,
          ),
          SizedBox(height: 10),
          controller.expenseIncomesList.isNotEmpty
              ? ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.expenseIncomesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      var data = controller.expenseIncomesList[index];
                      String category = data.category ?? 'N/A';
                      String categoryType = data.categoryType ?? 'N/A';
                      String amount =
                          '${(data.categoryType ?? '').toLowerCase() == 'income' ? '+' : '-'} ${data.currencySymbol} ${data.amount}';
                      String remark = data.remark ?? 'N/A';
                      String date = data.date ?? 'N/A';
                      Color categoryTypeColor =
                          (data.categoryType ?? '').toLowerCase() == 'income'
                              ? ColorsHelper.kGreenAccent
                              : ColorsHelper.kRed;
                      return TransactionListItem(
                        amount: amount,
                        date: date,
                        category: category,
                        categoryType: categoryType,
                        remark: remark,
                        categoryTypeColor: categoryTypeColor,
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
                    message: 'No Transaction found',
                    description:
                        'Add incomes and expenses to track your daily spends and earnings',
                    buttonText: '+ Add',
                    onActionClick: () {
                      controller.tabController?.index = 2;
                    },
                  ),
                )
        ],
      ),
    );
  }
}
