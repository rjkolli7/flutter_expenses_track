import 'package:components/src/button/styled_button.dart';
import 'package:components/src/commons/string_helper.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final Function()? onPressed;

  const RegisterButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledMaterialButton(
      onPressed: onPressed,
      title: StringHelper.signUpWithEmail,
    );
  }
}
