import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../components/view_card_components.dart';
import '../components/view_previous_inspection_components.dart';

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
          padding:
              const EdgeInsets.only(top: 24, left: 21, right: 20, bottom: 5),
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: ListView(
              children: [
                topStackWidget(),
                dateWidget(),
                sizedBox(3.h),
                topImageWidget(),
                sizedBox(3.h),
                middleRowWidget('Work Priority', 'Work'),
                sizedBox(2.h),
                middleRowWidget('Repair Cost', '99.99 USD'),
                sizedBox(2.h),
                middleRowWidget('Remaining Useful life', 'Useful'),
                sizedBox(2.h),
                middleRowWidget('Serverity', 'Servirity'),
                sizedBox(2.h),
                middleRowWidget('Exttent', 'Extend'),
                sizedBox(2.h),
                descriptionWidget(),
                sizedBox(2.h),
                photosWidget(),
                sizedBox(1.h),
                bottomButtonWidget(),
                sizedBox(1.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
