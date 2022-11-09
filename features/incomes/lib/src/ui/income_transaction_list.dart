import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomes/incomes.dart';
import 'package:incomes/src/ui/income_transaction_list_item.dart';

class IncomeTransactionList extends GetResponsiveView<IncomesController> {
  final Function()? onIncomeNoDataActionClick;
  IncomeTransactionList({
    Key? key,
    this.onIncomeNoDataActionClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Incomes History',
            textColor: ColorsHelper.kBlack,
            textSize: 16,
          ),
          SizedBox(height: 10),
          controller.incomes.isNotEmpty
              ? ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.incomes.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      var data = controller.incomes[index];
                      return IncomeTransactionListItem(
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
                    message: 'No income transactions',
                    description: 'Add incomes to track your daily earnings',
                    buttonText: '+ Add Income',
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
