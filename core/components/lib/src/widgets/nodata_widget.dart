import 'package:components/components.dart';
import 'package:components/src/button/styled_button.dart';
import 'package:flutter/cupertino.dart';

class NoDataWidget extends StatelessWidget {
  final Icon? icon;
  final String message;
  final String? description;
  final String? buttonText;
  final Function()? onActionClick;

  const NoDataWidget({
    Key? key,
    this.icon,
    required this.message,
    this.description,
    this.onActionClick,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizesHelper.kPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? AppLogo(icon: icon)
              : AppLogo(
                  color: ColorsHelper.kBlue,
                  size: 60.0,
                ),
          SizedBox(height: SizesHelper.kPaddingL),
          TextWidget(
            text: message,
            textColor: ColorsHelper.kBlack,
            textSize: 18,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizesHelper.kPaddingS),
          description != null
              ? TextWidget(
                  text: description!,
                  textColor: ColorsHelper.kBlack.withOpacity(0.4),
                  textSize: 14,
                  textAlign: TextAlign.center,
                )
              : Container(),
          SizedBox(height: SizesHelper.kPaddingL),
          buttonText != null
              ? StyledMaterialButton(
                  title: buttonText!,
                  onPressed: onActionClick,
                  buttonColor: ColorsHelper.kDarkBlue,
                  textColor: ColorsHelper.kWhite,
                )
              : Container(),
        ],
      ),
    );
  }
}
