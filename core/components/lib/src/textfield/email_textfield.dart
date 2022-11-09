import 'package:components/src/commons/string_helper.dart';
import 'package:flutter/material.dart';

import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class EmailTextFormField extends StatefulWidget {
  final bool enabled;
  const EmailTextFormField({
    Key? key,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EmailTextFormFieldState();
  }
}

class EmailTextFormFieldState extends State<EmailTextFormField> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: emailController,
      hint: StringHelper.emailHint,
      type: TextFormFieldType.email,
      enabled: widget.enabled,
    );
  }
}
