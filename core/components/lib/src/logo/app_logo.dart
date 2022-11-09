import 'dart:math';

import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final Color? color;
  final double? size;
  final Icon? icon;

  const AppLogo({
    this.color,
    this.size,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 4,
      child: icon ??
          Icon(
            Icons.account_balance_wallet,
            color: color,
            size: size,
          ),
    );
  }
}
