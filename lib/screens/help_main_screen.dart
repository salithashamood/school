import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/components/appbar_component.dart';
import 'package:school/components/help_main_components.dart';
import 'package:sizer/sizer.dart';

import '../components/home_components.dart';
import '../utils/colors.dart';

class HelpMainScreen extends StatefulWidget {
  const HelpMainScreen({Key? key}) : super(key: key);

  @override
  State<HelpMainScreen> createState() => _HelpMainScreenState();
}

class _HelpMainScreenState extends State<HelpMainScreen> {
  bool isClickButton = false;
  final searchController = TextEditingController();
  clickSearchButton() {
    setState(() {
      isClickButton = !isClickButton;
    });
  }
  tapBackButton() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        isHaveTitle: false,
        isHomePage: false,
        secondTitle: 'Help',
        toolBarHeight: 13.h,
        backTap: tapBackButton,
      ),
      body: helpList(),
    );
  }
}
