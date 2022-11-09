import 'package:components/src/button/styled_button.dart';
import 'package:components/src/commons/string_helper.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onPressed;

  const LoginButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledMaterialButton(
      onPressed: onPressed,
      title: StringHelper.signInWithEmail,
    );
  }
}
