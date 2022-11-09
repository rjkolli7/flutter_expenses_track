import 'package:components/components.dart';
import 'package:dashboard/src/controller/dashboard_controller.dart';
import 'package:dashboard/src/ui/dashboard_header.dart';
import 'package:dashboard/src/ui/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetResponsiveView<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizesHelper.kPaddingL,
          vertical: SizesHelper.kPaddingEL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DashboardHeader(),
            SizedBox(height: 20),
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
