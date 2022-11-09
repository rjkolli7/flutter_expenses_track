import 'package:add_income_expense/add_income_expense.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dashboard/src/controller/dashboard_controller.dart';
import 'package:dashboard/src/model/bottom_tab_item.dart';
import 'package:dashboard/src/ui/dasboard_page.dart';
import 'package:expenses/expenses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomes/incomes.dart';
import 'package:profile/profile.dart';

class DashboardMain extends StatefulWidget {
  const DashboardMain({Key? key}) : super(key: key);

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain>
    with SingleTickerProviderStateMixin {
  late List<TabBottomItem> tabItems;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    IncomesPage incomesPage = IncomesPage();
    ExpensesPage expensesPage = ExpensesPage();
    tabItems = <TabBottomItem>[
      TabBottomItem(
        icon: Icons.dashboard,
        title: 'Dashboard',
        child: DashboardPage(),
      ),
      TabBottomItem(
        icon: Icons.savings,
        title: 'Incomes',
        child: incomesPage,
      ),
      TabBottomItem(
        icon: Icons.add,
        title: '',
        child: AddIncomeExpensePage(),
      ),
      TabBottomItem(
        icon: Icons.payments,
        title: 'Expenses',
        child: expensesPage,
      ),
      TabBottomItem(
        icon: Icons.person,
        title: 'Profile',
        child: ProfilePage(),
      ),
    ];
    tabController = TabController(length: tabItems.length, vsync: this);
    incomesPage.setTabController(tabController);
    expensesPage.setTabController(tabController);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: GetBuilder<DashboardController>(builder: (controller) {
        controller.setTabController(tabController);
        return DefaultTabController(
          initialIndex: 0,
          length: tabItems.length,
          child: Scaffold(
            body: TabBarView(
              controller: tabController,
              children: tabItems
                  .map(
                    (i) => SingleChildScrollView(child: i.child),
                  )
                  .toList(growable: false),
            ),
            bottomNavigationBar: ConvexAppBar(
              style: TabStyle.fixedCircle,
              controller: tabController,
              items: tabItems,
              onTap: (i) {
                tabController.index = i;
              },
            ),
          ),
        );
      }),
    );
  }
}
