import 'package:explore_bangladesh/screen/dashboard/local_widget/dashboard_tab_sliver.dart';
import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  final TabController tabController;
  const DashboardTab({Key? key, required this.tabController}) : super(key: key);

  Text trendTopText(String title) => Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      );

  @override
  Widget build(BuildContext context) {
    return HomePageTabSliver(
      child: Container(
        height: 80,
        color: const Color(0xff7b1fa2),
        child: TabBar(
          indicatorColor: Colors.deepPurpleAccent,
          padding: const EdgeInsets.only(top: 10),
          labelColor: Colors.deepPurpleAccent,
          controller: tabController,
          tabs: [
            Tab(
              child: trendTopText('Trend'),
            ),
            Tab(
              child: trendTopText('Top'),
            ),
            Tab(
              child: trendTopText('Featured'),
            ),
          ],
        ),
      ),
    );
  }
}
