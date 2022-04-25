import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/components/appbar_tab_component.dart';
import 'package:school/components/drawer_component.dart';
import 'package:school/components/home_components.dart';
import 'package:school/utils/image.dart';
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
  bool isClickDrawerButton = false;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
    // init();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  init() async {
    // final jwt = await UserSecureStorage.getJwtToken();
    // print(jwt);
    await UserSecureStorage.deleteAll();
  }

  final searchController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  clickSearchButton() {
    setState(() {
      isClickButton = !isClickButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    clickDrawer() {
      // setState(() {
      //   isClickButton = !isClickButton;
      // });
      scaffoldkey.currentState!.openDrawer();
    }

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        elevation: 0,
        shape: appBarShape(),
        toolbarHeight: 17.h,
        bottom: appBarPreferredSize(
            searchController, clickSearchButton, isClickButton, 'Waste Management'),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: appBarTitle('Hotel Bentota'),
        actions: [
          appBarActionButton(),
        ],
        leading: appBarLeading(clickDrawer),
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
          AppBarTab(tabController: _tabController!),
        ],
      ),
      drawer: const DrawerComponent(),
    );
  }
}
