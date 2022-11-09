import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final TextAlign textAlign;

  const TextWidget(
      {Key? key,
      required this.text,
      this.textSize,
      this.textColor,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: textSize,
          color: textColor ?? Theme.of(context).textTheme.bodyLarge?.color),
    );
  }
}
