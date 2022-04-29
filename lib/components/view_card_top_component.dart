import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:school/components/view_card_components.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import '../utils/image.dart';

class ViewCardTopComponent extends StatefulWidget {
  final VoidCallback cameraClick;
  final List<Medium> images;
  final TabController tabController;
  const ViewCardTopComponent(
      {Key? key,
      required this.cameraClick,
      required this.images,
      required this.tabController})
      : super(key: key);

  @override
  State<ViewCardTopComponent> createState() => _ViewCardTopComponentState();
}

class _ViewCardTopComponentState extends State<ViewCardTopComponent> {
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
  }

  onTitleClick() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shadowColor: greyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: isExpanded ? 120.h : 30.h,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leftIcon(onTitleClick),
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
            tabBarView(widget.tabController, isExpanded),
          ],
        ),
      ),
    );
  }
}
