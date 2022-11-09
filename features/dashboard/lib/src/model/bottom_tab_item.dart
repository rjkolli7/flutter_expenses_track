import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';

class TabBottomItem extends TabItem {
  final Widget child;
  TabBottomItem({required super.icon, super.title, required this.child});
}
