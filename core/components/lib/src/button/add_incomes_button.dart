import 'package:components/src/button/styled_button.dart';
import 'package:components/src/commons/string_helper.dart';
import 'package:flutter/material.dart';

class AddUpdateIncomeButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isUpdate;

  const AddUpdateIncomeButton(
      {Key? key, required this.onPressed, this.isUpdate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledMaterialButton(
      onPressed: onPressed,
      title: isUpdate ? StringHelper.updateIncome : StringHelper.addIncome,
    );
  }
}
