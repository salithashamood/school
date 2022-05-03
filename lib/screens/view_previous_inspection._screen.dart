import 'package:flutter/material.dart';
import 'package:school/utils/image.dart';
import 'package:sizer/sizer.dart';

class ViewPreviousInspection extends StatefulWidget {
  const ViewPreviousInspection({Key? key}) : super(key: key);

  @override
  State<ViewPreviousInspection> createState() => _ViewPreviousInspectionState();
}

class _ViewPreviousInspectionState extends State<ViewPreviousInspection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Stack(
                    children: [
                      Text(
                        'Door - Glass Wo...',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(drawerCloseButton),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
