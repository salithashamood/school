import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/screens/camera_view_screen.dart';
import 'package:school/utils/image.dart';

class ReportMainScreen extends StatefulWidget {
  const ReportMainScreen({Key? key}) : super(key: key);

  @override
  State<ReportMainScreen> createState() => _ReportMainScreenState();
}

class _ReportMainScreenState extends State<ReportMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            Get.to(CameraViewScreen());
          },
          icon: Image.asset(cameraIcon),
        ),
      ),
    );
  }
}
