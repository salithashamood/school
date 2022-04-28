import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controllers/permission_controller.dart';
import 'package:school/screens/camera_view_screen.dart';
import 'package:school/utils/image.dart';
import 'package:sizer/sizer.dart';

class ReportMainScreen extends StatefulWidget {
  final List? selectedImages;
  const ReportMainScreen({Key? key, this.selectedImages}) : super(key: key);

  @override
  State<ReportMainScreen> createState() => _ReportMainScreenState();
}

class _ReportMainScreenState extends State<ReportMainScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.selectedImages!.length);
    setState(() {});
    return Scaffold(
      body: Center(
        child: Container(
          height: 6.h,
          width: 6.h,
          child: Stack(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}
