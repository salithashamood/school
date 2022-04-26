import 'package:flutter/material.dart';
import 'package:school/components/appbar_component.dart';
import 'package:school/components/chat_main_components.dart';
import 'package:sizer/sizer.dart';

import '../components/home_components.dart';
import '../utils/colors.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({Key? key}) : super(key: key);

  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  bool isClickButton = false;
  final searchController = TextEditingController();
  clickSearchButton() {
    setState(() {
      isClickButton = !isClickButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        toolBarHeight: 13.h,
        secondTitle: 'Chat',
        isHaveTitle: false,
        isHomePage: false,
      ),
      body: chatTile(),
    );
  }
}
