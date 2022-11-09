import 'package:components/components.dart';
import 'package:flutter/material.dart';

class StyledMaterialButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color buttonColor;
  final Color textColor;

  const StyledMaterialButton(
      {Key? key,
      this.onPressed,
      required this.title,
      this.buttonColor = ColorsHelper.kDarkBlue,
      this.textColor = ColorsHelper.kWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      padding: const EdgeInsets.symmetric(
          vertical: SizesHelper.kPaddingS, horizontal: SizesHelper.kPaddingL),
      child: TextWidget(
        text: title,
        textColor: textColor,
        textSize: Theme.of(context).textTheme.labelLarge?.fontSize,
      ),
    );
  }
}
