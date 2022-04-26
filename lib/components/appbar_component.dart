import 'package:flutter/material.dart';
import 'package:school/components/home_components.dart';

import '../utils/colors.dart';

class AppBarComponent extends StatefulWidget implements PreferredSizeWidget {
  final double toolBarHeight;
  final String? title;
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final String secondTitle;
  final bool isHaveTitle;
  final bool isHomePage;
  const AppBarComponent(
      {Key? key,
      required this.toolBarHeight,
      this.title,
      this.scaffoldkey,
      required this.secondTitle,
      required this.isHaveTitle, required this.isHomePage})
      : super(key: key);

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(toolBarHeight);
}

class _AppBarComponentState extends State<AppBarComponent> {
  // GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  bool isClickButton = false;
  final searchController = TextEditingController();
  clickSearchButton() {
    setState(() {
      isClickButton = !isClickButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    clickDrawer() {
      widget.scaffoldkey!.currentState!.openDrawer();
    }

    return AppBar(
      elevation: 0,
      shape: appBarShape(),
      toolbarHeight: widget.toolBarHeight,
      bottom: appBarPreferredSize(searchController, clickSearchButton,
          isClickButton, widget.secondTitle),
      backgroundColor: primaryColor,
      centerTitle: true,
      title: widget.isHaveTitle ? appBarTitle(widget.title!) : Container(),
      actions: [
       widget.isHomePage ? appBarActionButton() : Container(),
      ],
      leading: widget.isHomePage ? appBarLeading(clickDrawer) : IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
    );
  }
}
