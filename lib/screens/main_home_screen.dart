import 'package:flutter/material.dart';
import 'package:school/components/botom_navigation_bar_component.dart';
import 'package:school/screens/chat_main_screen.dart';
import 'package:school/screens/help_main_screen.dart';
import 'package:school/screens/home_page.dart';
import 'package:school/screens/report_main_screen.dart';
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
    ReportMainScreen(selectedImages: []),
    HelpMainScreen(),
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
    );
  }
}
