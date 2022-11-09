import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesChoice extends StatefulWidget {
  final List<String> categoriesList;
  final Function(int?) onSelectCategory;
  final String? title;
  final int? defaultValue;

  const CategoriesChoice({
    Key? key,
    required this.categoriesList,
    required this.onSelectCategory,
    this.title,
    this.defaultValue,
  }) : super(key: key);

  @override
  State<CategoriesChoice> createState() => _CategoriesChoiceState();
}

class _CategoriesChoiceState extends State<CategoriesChoice> {
  int? _value = -1;

  @override
  void initState() {
    _value = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizesHelper.kPaddingEL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  color: ColorsHelper.kBlack,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              TextWidget(
                text: widget.title ?? 'Select',
                textColor: ColorsHelper.kBlack,
                textSize: 20,
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizesHelper.kPaddingL),
            child: TextWidget(
              text:
                  'You can only select a minimum of 1 to be added to your incomes & expenses list',
              textColor: ColorsHelper.kBlack,
              textSize: 12,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Divider(
            color: ColorsHelper.kBlack.withOpacity(0.2),
            height: 2,
            thickness: 2,
          ),
          SizedBox(height: 20),
          Wrap(
            children: List.generate(widget.categoriesList.length, (index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                child: ChoiceChip(
                  label: TextWidget(
                    text: widget.categoriesList[index],
                    textColor: _value == index
                        ? ColorsHelper.kWhite
                        : ColorsHelper.kBlack,
                  ),
                  selected: _value == index,
                  backgroundColor: ColorsHelper.kLightGrey,
                  selectedColor: ColorsHelper.kDarkBlue,
                  elevation: 0,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                    widget.onSelectCategory(_value);
                  },
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
