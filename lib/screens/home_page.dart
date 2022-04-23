import 'package:flutter/material.dart';
import 'package:school/components/home_components.dart';
import 'package:school/utils/user_secure_storage.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isClickButton = false;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
    // init();
  }

  init() async {
    final jwt = await UserSecureStorage.getJwtToken();
    print(jwt);
    await UserSecureStorage.deleteAll();
  }

  final searchController = TextEditingController();

  clickSearchButton() {
    setState(() {
      isClickButton = !isClickButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: appBarShape(),
        toolbarHeight: 17.h,
        bottom: appBarPreferredSize(
            searchController, clickSearchButton, isClickButton),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: appBarTitle('Hotel Bentota'),
        actions: [
          appBarActionButton(),
        ],
        leading: appBarLeading(),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45),
            child: TabBarView(
              children: [
                appBarTabView('Two story buildings'),
                appBarTabView('Aliquam tincidunt mauris eu risus'),
                appBarTabView('Vestibulum auctor dapibus neque'),
                appBarTabView('Nunc dignissim risus id metus'),
              ],
              controller: _tabController,
            ),
          ),
          Positioned(
            // left: 25,
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
                    controller: _tabController,
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
          ),
        ],
      ),
    );
  }
}
