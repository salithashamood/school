import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/components/drawer_widget_components.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';
import '../utils/image.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  bool isSwitched = false;

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
                  SizedBox(
                    height: 20.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 65.w,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Surendra',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        const Expanded(
                                          child: Text(
                                            'Jayawardana',
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      width: 32.w,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ImageIcon(
                                            AssetImage(myAccountIcon),
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            'My Account',
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Container(
                                child: const CircleAvatar(
                                  radius: 30,
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Image.asset(drawerCloseButton),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 8, top: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 20.h,
                          width: 22.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                                width: 15.w,
                                child: Image.asset(organisationIcon),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 15.w,
                                    child: const Text(
                                      'Hotel Bentota',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    child: IconButton(
                                      icon: Image.asset(dropDownIcon,
                                          color: Colors.white),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Image.asset(separatorIcon),
                        Container(
                          height: 20.h,
                          width: 22.h,
                          padding: const EdgeInsets.only(left: 6, top: 5),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                                width: 15.w,
                                child: Image.asset(organisationIcon),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 23.w,
                                    child: const Text(
                                      'Waste Managenment',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  SizedBox(
                                    child: IconButton(
                                      icon: Image.asset(
                                        dropDownIcon,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            width: 13.w,
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
