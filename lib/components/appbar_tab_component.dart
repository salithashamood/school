import 'package:flutter/material.dart';
import 'package:school/components/home_components.dart';
import 'package:sizer/sizer.dart';

class AppBarTab extends StatefulWidget {
  final TabController tabController;
  const AppBarTab({Key? key, required this.tabController}) : super(key: key);

  @override
  State<AppBarTab> createState() => _AppBarTabState();
}

class _AppBarTabState extends State<AppBarTab> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: SizedBox(
        width: 100.w,
        child: Card(
          elevation: 1,
          child: DefaultTabController(
            length: 4,
            initialIndex: 0,
            animationDuration: const Duration(milliseconds: 500),
            child: TabBar(
              padding: EdgeInsets.only(left: 15, right: 15),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              controller: widget.tabController,
              labelPadding: const EdgeInsets.only(
                  top: 0, left: 10, right: 15, bottom: 10),
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: [
                appBarTab('Building Type'),
                appBarTab('Building'),
                appBarTab('Functional Areas'),
                appBarTab('Functional'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
