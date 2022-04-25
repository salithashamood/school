import 'package:flutter/material.dart';
import 'package:school/utils/colors.dart';
import 'package:sizer/sizer.dart';

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
