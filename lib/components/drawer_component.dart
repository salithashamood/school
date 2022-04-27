import 'package:flutter/material.dart';
import 'package:school/components/drawer_widget_components.dart';
import 'package:sizer/sizer.dart';
import '../utils/image.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  bool isSwitched = true;
  bool isVissibleLeft = false;
  bool isVissibleRight = false;

  clickLeftDetails() {
    setState(() {
      setState(() {
        isVissibleLeft = !isVissibleLeft;
        isVissibleRight = false;
      });
    });
  }

  clickRightDetails() {
    setState(() {
      setState(() {
        isVissibleLeft = false;
        isVissibleRight = !isVissibleRight;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: Drawer(
        elevation: 5,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  accountDetails('Surendra', 'Jayawardana'),
                  drawerDetails(clickLeftDetails, clickRightDetails),
                  leftMenu(isVissibleLeft),
                  rightMenu(isVissibleRight),
                  divider(),
                  drawerAction(
                      text: 'Notification',
                      icon: notificationIcon,
                      color: Colors.black,
                      isPreLoad: false),
                  divider(),
                  drawerAction(
                      text: 'Contact Us',
                      icon: contactUsIcon,
                      color: Colors.black,
                      isPreLoad: false),
                  divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SizedBox(
                      height: 5.h,
                      child: Row(
                        children: [
                          Image.asset(preLoadIcon),
                          SizedBox(
                            width: 2.w,
                          ),
                          const Text(
                            'Pre - Load Previous Data',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (v) {
                              setState(() {
                                isSwitched = !isSwitched;
                              });
                            },
                            // activeColor: primaryColor,
                            // activeTrackColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // drawerAction(
                  //     text: 'Pre - Load Previous Data',
                  //     icon: preLoadIcon,
                  //     color: primaryColor,
                  //     isPreLoad: true,
                  //     isSwitched: isSwitched,
                  //     toggleSwitch: toggleSwitch),
                  divider(),
                  drawerAction(
                      text: 'Log Out',
                      icon: logOutIcon,
                      color: Colors.red,
                      isPreLoad: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
