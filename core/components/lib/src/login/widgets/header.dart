import 'package:components/src/animation/fade_slide_transition.dart';
import 'package:components/src/commons/color_helper.dart';
import 'package:components/src/commons/sizes_helper.dart';
import 'package:components/src/logo/app_logo.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;

  const Header({
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizesHelper.kPaddingEL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const AppLogo(
            color: ColorsHelper.kBlue,
            size: 48.0,
          ),
          const SizedBox(height: SizesHelper.kSpaceM),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              'Welcome to Expense Tracker',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorsHelper.kBlack, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: SizesHelper.kSpaceS),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              'Track your income and expenses',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorsHelper.kBlack.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
