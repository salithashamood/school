import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:school/components/appbar_component.dart';
import 'package:school/components/view_card_components.dart';
import 'package:school/screens/camera_view_screen.dart';
import 'package:school/utils/colors.dart';
import 'package:school/utils/image.dart';
import 'package:sizer/sizer.dart';

import '../controllers/permission_controller.dart';

class ViewCardScreen extends StatefulWidget {
  const ViewCardScreen({Key? key}) : super(key: key);

  @override
  State<ViewCardScreen> createState() => _ViewCardScreenState();
}

List<Medium> images = [];

class _ViewCardScreenState extends State<ViewCardScreen> {
  clickCameraIcon() async {
    bool isPermissioned = await promptPermissionSetting();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        isHaveTitle: true,
        isHomePage: false,
        toolBarHeight: 17.h,
        title: 'West Tower seaside bulding',
        secondTitle: 'Ground floor main entrance',
      ),
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: 100.w,
          height: 100.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
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
                                  rightActionIcon(
                                      moreIcon, () {}, false, images),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  rightActionIcon(cameraIcon, clickCameraIcon,
                                      true, images),
                                ],
                              ),
                            ],
                          ),
                          tabBar(),
                          Divider(
                            color: greyColor,
                            thickness: 0.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              topImageIcons('Good', darkGreenColor, goodIcon),
                              topImageIcons('Fair', darkBrown1Color, fairIcon),
                              topImageIcons(
                                  'Avarage', darkBlueColor, avarageIcon),
                              topImageIcons(
                                  'Repair', darkBrown2Color, repairIcon),
                              topImageIcons(
                                  'Replace', darkPinkColor, replaceIcon),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              bottomLeftContainer(),
                              bottomRightNumberContainer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listData.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shadowColor: greyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          title: Text(
                            listData[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: yellowColor,
                                radius: 5,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'In Progress',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFFA7A7A7),
                                ),
                              ),
                            ],
                          ),
                          trailing:
                              Image.asset(arrowRight, color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> listData = [
    'Nunc dignissim risus id metus.',
    'Cras ornare tristique elit.',
    'Vivamus vestibulum ntulla nec ante.',
    'Fusce pellentesque suscipit nibh.',
    'Vestibulum commodo felis quis tortor.',
    'Integer vitae libero ac risus egestas placerat.'
  ];
}
