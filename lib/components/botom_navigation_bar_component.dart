import 'package:flutter/material.dart';

import '../utils/image.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  final int selectedIndex;
  final Function onTap;
  const BottomNavigationBarComponent(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.blue, width: 2.0),
          bottom: BorderSide(color: Colors.blue, width: 2.0),
          left: BorderSide(color: Colors.blue, width: 2.0),
          right: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => widget.onTap(0),
            icon: Image.asset(
              widget.selectedIndex == 0 ? activeHomeIcon : normalHomeIcon,
            ),
          ),
          IconButton(
            onPressed: () => widget.onTap(1),
            icon: Image.asset(
              widget.selectedIndex == 1 ? activeChatIcon : normalChatIcon,
            ),
          ),
          IconButton(
            onPressed: () => widget.onTap(2),
            icon: Image.asset(
              widget.selectedIndex == 2 ? activeReportIcon : normalReportIcon,
            ),
          ),
          IconButton(
            onPressed: () => widget.onTap(3),
            icon: Image.asset(
              widget.selectedIndex == 3 ? activeHelpIcon : normalHelpIcon,
            ),
          ),
        ],
      ),
    );
  }
}
