import 'package:components/src/commons/string_helper.dart';
import 'package:components/src/styles/test_styles.dart';
import 'package:flutter/material.dart';

import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class CountryFormField extends StatefulWidget {
  final List<String> countries;
  final Function(int, String) onCountrySelected;
  final bool enabled;

  const CountryFormField({
    Key? key,
    required this.countries,
    required this.onCountrySelected,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CountryFormFieldState();
  }
}

class CountryFormFieldState extends State<CountryFormField> {
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: countryController,
      hint: StringHelper.selectCountryHint,
      type: TextFormFieldType.country,
      enabled: widget.enabled,
      onTap: () {
        selectCountry();
      },
    );
  }

  void selectCountry() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            StringHelper.selectCountryHint,
            style: TextStyles.titleTextStyle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: List.generate(widget.countries.length, (index) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      setState(() {
                        countryController.text = widget.countries[index];
                      });
                    });
                    widget.onCountrySelected(index, widget.countries[index]);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    widget.countries[index],
                    style: TextStyles.regularTextStyle,
                  ),
                );
              }),
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                StringHelper.cancel,
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
