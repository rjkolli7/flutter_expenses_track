import 'package:flutter/material.dart';

import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class CustomFormField extends StatefulWidget {
  final bool readOnly;
  final String hint;
  final bool isNumber;
  const CustomFormField({
    Key? key,
    this.readOnly = false,
    this.isNumber = false,
    this.hint = '',
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomFormFieldState();
  }
}

class CustomFormFieldState extends State<CustomFormField> {
  final customerFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: customerFieldController,
      hint: widget.hint,
      type: widget.isNumber
          ? TextFormFieldType.number
          : TextFormFieldType.unknown,
      readOnly: widget.readOnly,
      border: InputBorder.none,
    );
  }
}
