import 'package:explore_bangladesh/screen/dashboard/local_widget/dashboard_sliver_appbar.dart';
import 'package:explore_bangladesh/screen/dashboard/local_widget/dashboard_tab.dart';
import 'package:explore_bangladesh/screen/dashboard/local_widget/dashboard_tabbar_view.dart';
import 'package:explore_bangladesh/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const DashboardSliverAppbar(),
            DashboardTab(tabController: tabController),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: const [
            DashBoardGridview(),
            DashBoardGridview(),
            DashBoardGridview(),
          ],
        ),
      ),
    );
  }
}
