import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:school/components/appbar_component.dart';
import 'package:school/components/view_card_components.dart';
import 'package:school/components/view_card_top_component.dart';
import 'package:school/controllers/filter_controller.dart';
import 'package:school/screens/camera_view_screen.dart';
import 'package:school/utils/colors.dart';
import 'package:sizer/sizer.dart';

import '../controllers/permission_controller.dart';

class ViewCardScreen extends StatefulWidget {
  const ViewCardScreen({Key? key}) : super(key: key);

  @override
  State<ViewCardScreen> createState() => _ViewCardScreenState();
}

class _ViewCardScreenState extends State<ViewCardScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Medium> images = [];
  // List filterSelectedList = [];

  clickCameraIcon() async {
    bool isPermissioned = await permissionCamera();
    if (isPermissioned) {
      Get.to(CameraViewScreen(images: images))!.then((value) {
        setState(() {
          images = value[0];
        });
      });
    } else {
      Get.snackbar('Not Permission', 'Give Permisson');
    }
  }

  tapBackButton() {
    Get.back();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    images = [];
  }

  tapFilter() async {
    Get.bottomSheet(
      GetBuilder<FilterController>(
        builder: (controller) {
          return StatefulBuilder(
            builder: (context, setsState) {
              return Container(
                child: actionBottomComponent(setsState, controller),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        isHaveTitle: true,
        isHomePage: false,
        toolBarHeight: 17.h,
        title: 'West Tower seaside bulding',
        secondTitle: 'Ground floor main entrance',
        backTap: tapBackButton,
        tapFilter: tapFilter,
      ),
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: ListView(
            children: [
              ViewCardTopComponent(
                cameraClick: clickCameraIcon,
                images: images,
                tabController: _tabController!,
              ),
              viewCardListView()
            ],
          ),
        ),
      ),
    );
  }
}
