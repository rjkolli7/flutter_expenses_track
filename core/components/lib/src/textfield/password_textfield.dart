import 'package:components/src/commons/string_helper.dart';
import 'package:flutter/material.dart';

import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PasswordTextFieldState();
  }
}

class PasswordTextFieldState extends State<PasswordTextField> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: passwordController,
      hint: StringHelper.passwordHint,
      type: TextFormFieldType.password,
    );
  }
}
