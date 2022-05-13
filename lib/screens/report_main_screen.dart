import 'package:flutter/material.dart';
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
        child: SizedBox(
          height: 6.h,
          width: 6.h,
          child: Stack(
            children: const [
            ],
          ),
        ),
      ),
    );
  }
}
