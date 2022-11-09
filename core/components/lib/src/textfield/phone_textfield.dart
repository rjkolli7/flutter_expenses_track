import 'package:components/src/commons/string_helper.dart';
import 'package:flutter/material.dart';

import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class PhoneTextFormField extends StatefulWidget {
  final int? length;
  final int? minLength;

  const PhoneTextFormField({Key? key, this.length = 10, this.minLength = 8})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PhoneTextFormFieldState();
  }
}

class PhoneTextFormFieldState extends State<PhoneTextFormField> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: phoneController,
      hint: StringHelper.phoneNumberHint,
      type: TextFormFieldType.phoneNumber,
      length: widget.length,
      minLength: widget.minLength,
    );
  }
}
