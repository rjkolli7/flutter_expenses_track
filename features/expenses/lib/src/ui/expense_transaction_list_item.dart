import 'package:components/components.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:flutter/material.dart';

class ExpenseTransactionListItem extends StatelessWidget {
  final Expense data;

  const ExpenseTransactionListItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return ListTile(
      onTap: () {},
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: category,
                textSize: 14,
                textColor: ColorsHelper.kBlack,
              ),
              TextWidget(
                text: categoryType,
                textSize: 12,
                textColor: categoryTypeColor,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                  text: amount, textSize: 12, textColor: categoryTypeColor),
              TextWidget(
                text: date,
                textSize: 12,
                textColor: ColorsHelper.kBlack.withOpacity(0.5),
              ),
            ],
          ),
        ],
      ),
      subtitle: TextWidget(
        text: remark,
        textColor: ColorsHelper.kBlack.withOpacity(0.5),
      ),
    );
  }
}
