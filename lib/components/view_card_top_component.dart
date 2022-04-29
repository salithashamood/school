import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:school/components/view_card_components.dart';
import 'package:school/screens/camera_view_screen.dart';
import 'package:sizer/sizer.dart';

import '../controllers/permission_controller.dart';
import '../utils/colors.dart';
import '../utils/image.dart';

class ViewCardTopComponent extends StatefulWidget {
  final VoidCallback cameraClick;
  final List<Medium> images;
  final TabController tabController;
  const ViewCardTopComponent(
      {Key? key, required this.cameraClick, required this.images, required this.tabController})
      : super(key: key);

  @override
  State<ViewCardTopComponent> createState() => _ViewCardTopComponentState();
}

class _ViewCardTopComponentState extends State<ViewCardTopComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: Card(
        color: Colors.white,
        elevation: 3,
        shadowColor: greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leftIcon(),
                  Row(
                    children: [
                      rightActionIcon(moreIcon, () {}, false, widget.images),
                      SizedBox(
                        width: 2.w,
                      ),
                      rightActionIcon(
                          cameraIcon, widget.cameraClick, true, widget.images),
                    ],
                  ),
                ],
              ),
              tabBar(widget.tabController),
              Divider(
                color: greyColor,
                thickness: 0.5,
              ),
              tabBarView(widget.tabController),
            ],
          ),
        ),
      ),
    );
  }
}
