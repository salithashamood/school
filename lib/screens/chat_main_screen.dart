import 'package:flutter/material.dart';
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
      appBar: AppBar(
        elevation: 0,
        shape: appBarShape(),
        toolbarHeight: 10.h,
        bottom: appBarPreferredSize(
            searchController, clickSearchButton, isClickButton, 'Chat'),
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: chatTile(),
    );
  }
}
