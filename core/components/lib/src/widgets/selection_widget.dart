import 'package:components/components.dart';
import 'package:components/src/button/select_button.dart';
import 'package:flutter/material.dart';

class SelectionWidget extends StatelessWidget {
  final String hint;
  final String title;
  final bool readOnly;
  final bool isNumber;
  final Function()? onPressSelect;
  final Key? fieldKey;

  const SelectionWidget({
    Key? key,
    required this.hint,
    required this.title,
    this.readOnly = true,
    this.isNumber = false,
    this.onPressSelect,
    this.fieldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsHelper.kLightGrey,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: title,
                    textColor: ColorsHelper.kBlack,
                  ),
                ),
                readOnly ? SelectButton(onPressed: onPressSelect) : Container(),
              ],
            ),
          ),
          Divider(color: ColorsHelper.kBlack.withOpacity(0.4), height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomFormField(
              hint: hint,
              readOnly: readOnly,
              isNumber: isNumber,
              key: fieldKey,
            ),
          ),
        ],
      ),
    );
  }
}
