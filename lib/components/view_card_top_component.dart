import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:school/components/view_card_components.dart';
import 'package:school/controllers/permission_controller.dart';
import 'package:school/main.dart';
import 'package:school/screens/qr_view_screen.dart';
import 'package:school/screens/view_previous_inspection._screen.dart';
import 'package:sizer/sizer.dart';
import '../screens/google_map_screen.dart';
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
  bool isSelected = false;
  var locationController = TextEditingController();
  LatLng? location;
  @override
  void initState() {
    super.initState();
  }

  onTitleClick() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  bool onSwitched(e) {
    setState(() {
      isSelected = e;
    });
    return isSelected;
  }

  gotoMap() async {
    bool isPermissioned = await premissionLocation();
    if (isPermissioned) {
      Get.to(GoogleMapScreen(
        currentPosition: location,
      ))!
          .then((value) {
        if (value[0] != null) {
          setState(() {
            location = value[0];
            double latitiude = location!.latitude;
            double longitude = location!.longitude;
            locationController.text = '$latitiude , $longitude';
          });
        }
      });
    } else {
      Get.snackbar('Request Permission', 'Can\'t move map without permission');
    }
  }

  gotoQR() async {
    bool isPermissioned = await permissionCamera();
    if (isPermissioned) {
      Get.to(QRVIewScreen());
    } else {
      Get.snackbar(
          'Request Permission', 'Can\'t move camera without permission');
    }
  }

  moreClick() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return bottomComponents(() {}, clickViewPreviousInspection);
      },
    );
  }

  clickViewPreviousInspection() {
    Get.to(ViewPreviousInspection());
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
        height: isTablet
            ? isExpanded
                ? isSelected
                    ? 110.h
                    : 96.h
                : 24.h
            : isExpanded
                ? isSelected
                    ? 148.h
                    : 130.h
                : 30.h,
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
                    rightActionIcon(moreIcon, moreClick, false, widget.images),
                    SizedBox(
                      width: 2.w,
                    ),
                    rightActionIcon(
                        cameraIcon, widget.cameraClick, true, widget.images),
                  ],
                ),
              ],
            ),
            isTablet ? tableteCardUI(isSelected, isExpanded, gotoMap, gotoQR, onSwitched,
                locationController) : mobileCardUI(widget.tabController, isExpanded, gotoMap, gotoQR,
              isSelected, onSwitched, locationController),
          ],
        ),
      ),
    );
  }

  
}
