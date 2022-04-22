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

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // init();
  }

  init() async {
    final jwt = await UserSecureStorage.getJwtToken();
    print(jwt);
    await UserSecureStorage.deleteAll();
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: appBarShape(),
        toolbarHeight: 15.h,
        bottom: appBarPreferredSize(searchController),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: appBarTitle('Hotel Bentota'),
        actions: [
          appBarActionButton(),
        ],
        leading: appBarLeading(),
      ),
    );
  }
}
