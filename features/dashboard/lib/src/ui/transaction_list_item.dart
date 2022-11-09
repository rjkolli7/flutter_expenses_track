import 'package:components/components.dart';
import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  final String category;
  final String categoryType;
  final String amount;
  final String date;
  final String remark;
  final Color categoryTypeColor;

  const TransactionListItem({
    Key? key,
    required this.category,
    required this.categoryType,
    required this.amount,
    required this.date,
    required this.remark,
    required this.categoryTypeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
