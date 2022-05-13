import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/main.dart';
import 'package:school/utils/colors.dart';
import 'package:sizer/sizer.dart';

import '../utils/image.dart';

divider() {
  return Container(
    padding: const EdgeInsets.only(left: 12),
    child: const Divider(
      color: Colors.grey,
      thickness: 0.75,
    ),
  );
}

drawerAction({
  required String text,
  required String icon,
  required Color color,
  required bool isPreLoad,
  // Function? toggleSwitch,
  // bool? isSwitched
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 12),
    child: SizedBox(
      height: 5.h,
      child: Row(
        children: [
          Image.asset(icon),
          SizedBox(
            width: 2.w,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w700, color: color),
          ),
          // SizedBox(
          //   width: 13.w,
          // ),
          // isPreLoad
          //     ? Switch(
          //         value: isSwitched!,
          //         onChanged: (v) {
          //           isSwitched = !isSwitched!;
          //         },
          //         activeColor: primaryColor,
          //         activeTrackColor: Colors.blue,
          //       )
          //     : Container(),
        ],
      ),
    ),
  );
}

accountDetails(String fName, String lName) {
  return SizedBox(
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          fName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Text(
                            lName,
                            style: const TextStyle(
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
                      width: 35.w,
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: isTablet ? 45 : 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                child: CircleAvatar(
                  radius: 5.h,
                  child: const Icon(
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
  );
}

triangleIcon(color, bool isleft) {
  return Positioned(
    top: -2.h,
    left: isleft ? 10.w : null,
    right: isleft ? null : 25.w,
    child: Transform.rotate(
      // angle: math.pi / 4,
      angle: pi / 4,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    ),
  );
}

boxListView(color) {
  List<String> sampleData = [
    'Lorem ipsum dolor sit amet',
    'consectetur adipiscing elit',
    'sed do eiusmod tempor incididunt ',
    'Ut enim ad minim veniam',
    'quis nostrud exercitation ullamco ',
    'Duis aute irure dolor in reprehenderit',
    'Excepteur sint occaecat cupidatat non',
    'sunt in culpa qui officia deserunt mollit',
    'Lorem ipsum dolor sit amet',
    'consectetur adipiscing elit',
  ];
  return Positioned(
    top: 20,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: 85.w,
      height: 75.h,
      color: color,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: sampleData.map((e) {
          return Row(
            children: [
              Expanded(
                  child: Text(
                e,
                style: const TextStyle(color: Colors.white),
              )),
              IconButton(onPressed: () {}, icon: Image.asset(arrowRight)),
            ],
          );
        }).toList(),
      ),
    ),
  );
}

leftMenu(bool visibility) {
  return Visibility(
    visible: visibility,
    child: SizedBox(
      height: 74.h,
      child: Stack(
        children: [
          triangleIcon(Colors.blue[900], true),
          boxListView(Colors.blue[900]),
        ],
      ),
    ),
  );
}

rightMenu(bool visibility) {
  return Visibility(
    visible: visibility,
    child: SizedBox(
      height: 74.h,
      child: Stack(
        children: [
          triangleIcon(primaryColor, false),
          boxListView(primaryColor),
        ],
      ),
    ),
  );
}

drawerDetails(VoidCallback onTapLeft, VoidCallback onTapRight) {
  return SizedBox(
    height: 20.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        box(onTapLeft, 'Hotel Bentota', Colors.white, Colors.blue[900],
            organisationIcon, arrowDownIcon),
        Image.asset(separatorIcon),
        box(onTapRight, 'Waste Managenment', Colors.white, primaryColor,
            organisationIcon, dropDownIcon),
      ],
    ),
  );
}

box(VoidCallback onTap, String text, Color textColor, containerColor,
    String image, icon) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: isTablet ? 25.h : 20.h,
      width: isTablet ? 25.h : 20.h,
      padding: const EdgeInsets.only(left: 8, top: 5),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
            width: 15.w,
            child: Image.asset(image),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 21.w,
                child: Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 10.w,
                child: IconButton(
                  icon: Image.asset(
                    icon,
                  ),
                  onPressed: onTap,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
