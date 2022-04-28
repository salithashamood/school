import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import '../utils/image.dart';

topImageIcons(String name, Color color, String icon) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(icon),
      Positioned(
        child: Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 10, color: color),
        ),
        bottom: 8,
      ),
    ],
  );
}

tabText(String tabName) {
  return Text(tabName);
}

tabBar() {
  return DefaultTabController(
    length: 2,
    initialIndex: 0,
    animationDuration: Duration(milliseconds: 500),
    child: SizedBox(
      width: 44.w,
      child: TabBar(
        padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.only(bottom: 5),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        labelColor: primaryColor,
        unselectedLabelColor: Color(0XFF1F347B),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        tabs: [tabText('Condition Rating'), tabText('Risk Factor')],
      ),
    ),
  );
}

rightActionIcon(
    String icon, VoidCallback tap, bool isCameraIcon, List<Medium> images) {
  return InkWell(
    child: Stack(
      children: [
        Image.asset(icon),
        isCameraIcon
            ? images.isNotEmpty
                ? Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: orangekColor,
                      child: Text(
                        images.length.toString(),
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      ),
                      radius: 8,
                    ),
                  )
                : Container()
            : Container(),
      ],
    ),
    onTap: tap,
  );
}

leftIcon() {
  return Row(
    children: [
      SizedBox(
        width: 28.w,
        child: Text(
          'Door - Glass Work',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: primaryTextColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
        decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: BorderRadius.all(Radius.circular(5.sp)),
        ),
        child: const Text(
          'A45878788',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

bottomRightNumberContainer() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: Color(0XFFEEF2F5).withOpacity(0.75),
      ),
      height: 6.h,
      width: 40.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.1)),
            child: Image.asset(minusIcon),
          ),
          Text(
            '00',
            style: TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.1)),
            child: Image.asset(plusIcon),
          ),
        ],
      ),
    ),
  );
}

bottomLeftContainer() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color(0XFFDEEFFF).withOpacity(0.51),
      ),
      height: 6.h,
      width: 40.w,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Image.asset(backwardIcon),
            ),
            Text(
              'Number',
              style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Image.asset(forwardIcon),
            ),
          ],
        ),
      ),
    ),
  );
}