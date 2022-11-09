import 'package:components/components.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final Function()? onPressed;

  const SelectButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        minWidth: 0,
        height: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: TextWidget(
          text: 'Select',
          textColor: ColorsHelper.kGreenAccent,
        ));
  }
}
