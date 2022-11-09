import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController with StateMixin<dynamic> {
  TabController? get tabController => _tabController.value;

  // ignore: unnecessary_cast
  final Rx<TabController?> _tabController = (null as TabController?).obs;

  void setTabController(TabController? tabController) {
    _tabController.value = tabController;
  }
}
