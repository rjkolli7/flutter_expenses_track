import 'package:components/components.dart';
import 'package:dashboard/src/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardHeader extends GetResponsiveView<DashboardController> {
  DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Hello ${controller.userName}',
            textSize: 20,
            textColor: ColorsHelper.kDarkBlue.withOpacity(0.7),
          ),
          TextWidget(
            text: 'Welcome Back',
            textSize: 24,
            textColor: ColorsHelper.kOrange,
          ),
          SizedBox(height: 10),
          Card(
            color: ColorsHelper.kDarkBlue,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: SizesHelper.kPaddingM,
                vertical: SizesHelper.kPaddingS,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Total Incomes & Expenses',
                    textSize: 12,
                    textColor: ColorsHelper.kOrange,
                  ),
                  SizedBox(height: 3),
                  TextWidget(
                    text: 'Available Balance',
                    textSize: 16,
                    textColor: ColorsHelper.kOrange,
                  ),
                  SizedBox(height: 5),
                  TextWidget(
                    text:
                        '${controller.selectedCountry?.symbol ?? ''} ${controller.balanceAmount.toStringAsFixed(2)}',
                    textSize: 25,
                    textColor: ColorsHelper.kWhite,
                  ),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Incomes',
                            textSize: 12,
                            textColor: ColorsHelper.kOrange,
                          ),
                          SizedBox(height: 5),
                          TextWidget(
                            text:
                                '${controller.selectedCountry?.symbol ?? ''} ${controller.totalIncomes.toStringAsFixed(2)}',
                            textSize: 20,
                            textColor: ColorsHelper.kWhite,
                          ),
                        ],
                      ),
                      Expanded(flex: 1, child: Container()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Expenses',
                            textSize: 12,
                            textColor: ColorsHelper.kOrange,
                          ),
                          SizedBox(height: 5),
                          TextWidget(
                            text:
                                '${controller.selectedCountry?.symbol ?? ''} ${controller.totalExpenses.toStringAsFixed(2)}',
                            textSize: 20,
                            textColor: ColorsHelper.kWhite,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
