import 'package:flutter/material.dart';
import 'package:school/components/home_components.dart';
import 'package:school/components/view_card_components.dart';

import '../utils/colors.dart';

class AppBarComponent extends StatefulWidget implements PreferredSizeWidget {
  final double toolBarHeight;
  final String? title;
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final String secondTitle;
  final bool isHaveTitle;
  final bool isHomePage;
  final VoidCallback backTap;
  final VoidCallback? tapFilter;
  const AppBarComponent(
      {Key? key,
      required this.toolBarHeight,
      this.title,
      this.scaffoldkey,
      required this.secondTitle,
      required this.isHaveTitle,
      required this.isHomePage,
      required this.backTap, this.tapFilter})
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
      shadowColor: greyColor,
      elevation: 5,
      shape: appBarShape(),
      toolbarHeight: widget.toolBarHeight,
      bottom: widget.secondTitle == ''
          ? null
          : appBarPreferredSize(searchController, clickSearchButton,
              isClickButton, widget.secondTitle),
      backgroundColor: primaryColor,
      centerTitle: true,
      title: widget.isHaveTitle ? appBarTitle(widget.title!) : Container(),
      actions: widget.isHomePage && widget.isHaveTitle
          ? appBarActionButton()
          : widget.isHaveTitle && widget.secondTitle != ''
              ? appBarAction(widget.tapFilter!)
              : null,
      leading: widget.isHomePage
          ? appBarLeading(clickDrawer)
          : IconButton(
              onPressed: widget.backTap,
              icon: const Icon(Icons.arrow_back),
            ),
    );
  }
}
