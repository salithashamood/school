import 'package:flutter/material.dart';
import 'package:school/components/botom_navigation_bar_component.dart';
import 'package:school/screens/chat_main_screen.dart';
import 'package:school/screens/home_page.dart';
import 'package:school/utils/image.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ChatMainScreen(),
    Center(
      child: Text(
        'Report',
      ),
    ),
    Center(
      child: Text(
        'Help',
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBarComponent(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   currentIndex: _selectedIndex,
      //   elevation: 25,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: _onItemTapped,
      //   // fixedColor: Colors.red,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(
      //         AssetImage(
      //           _selectedIndex == 0 ? activeHomeIcon : normalHomeIcon,
      //         ),
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(
      //         AssetImage(_selectedIndex == 1 ? activeChatIcon : normalChatIcon),
      //       ),
      //       label: 'Chat',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(
      //         AssetImage(
      //             _selectedIndex == 2 ? activeReportIcon : normalReportIcon),
      //       ),
      //       label: 'Report',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(
      //         AssetImage(_selectedIndex == 3 ? activeHelpIcon : normalHelpIcon),
      //         // color: Colors.pink,
      //       ),
      //       label: 'Help',
      //     ),
      //   ],
      // ),
    );
  }
}
