import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:school/screens/google_map_screen.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import '../utils/image.dart';

topImageIcons(String name, Color color, String icon) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(icon),
      Positioned(
        child: Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 10, color: color),
        ),
        bottom: 8,
      ),
    ],
  );
}

tabText(String tabName) {
  return Text(tabName);
}

tabBar(TabController tabController) {
  return DefaultTabController(
    length: 2,
    initialIndex: 0,
    animationDuration: Duration(milliseconds: 500),
    child: SizedBox(
      width: 44.w,
      child: TabBar(
        controller: tabController,
        padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.only(bottom: 5),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        labelColor: primaryColor,
        unselectedLabelColor: Color(0XFF1F347B),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        tabs: [tabText('Condition Rating'), tabText('Risk Factor')],
      ),
    ),
  );
}

rightActionIcon(
    String icon, VoidCallback tap, bool isCameraIcon, List<Medium> images) {
  return InkWell(
    child: Stack(
      children: [
        Image.asset(icon),
        isCameraIcon
            ? images.isNotEmpty
                ? Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: orangeColor,
                      child: Text(
                        images.length.toString(),
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      ),
                      radius: 8,
                    ),
                  )
                : Container()
            : Container(),
      ],
    ),
    onTap: tap,
  );
}

leftIcon(VoidCallback onClick) {
  return Row(
    children: [
      SizedBox(
        width: 28.w,
        child: titleWidget(onClick),
      ),
      numberWidget(),
    ],
  );
}

numberWidget() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
    decoration: BoxDecoration(
      color: yellowColor,
      borderRadius: BorderRadius.all(Radius.circular(5.sp)),
    ),
    child: const Text(
      'A45878788',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.black,
      ),
    ),
  );
}

titleWidget(VoidCallback onClick) {
  return InkWell(
    onTap: onClick,
    child: Text(
      'Door - Glass and Wood front doors',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: primaryTextColor,
      ),
      overflow: TextOverflow.ellipsis,
    ),
  );
}

bottomRightNumberContainer() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: Color(0XFFEEF2F5).withOpacity(0.75),
      ),
      height: 6.h,
      width: 40.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.1)),
            child: Image.asset(minusIcon),
          ),
          Text(
            '00',
            style: TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.1)),
            child: Image.asset(plusIcon),
          ),
        ],
      ),
    ),
  );
}

bottomLeftContainer() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color(0XFFDEEFFF).withOpacity(0.51),
      ),
      height: 6.h,
      width: 40.w,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Image.asset(backwardIcon),
            ),
            Text(
              'Number',
              style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Image.asset(forwardIcon),
            ),
          ],
        ),
      ),
    ),
  );
}

viewCardListView() {
  List<String> listData = [
    'Nunc dignissim risus id metus.',
    'Cras ornare tristique elit.',
    'Vivamus vestibulum ntulla nec ante.',
    'Fusce pellentesque suscipit nibh.',
    'Vestibulum commodo felis quis tortor.',
    'Integer vitae libero ac risus egestas placerat.'
  ];
  return ListView.builder(
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
            trailing: Image.asset(arrowRight, color: Colors.black),
          ),
        ),
      );
    },
  );
}

tabBarView(TabController _tabController, bool visibility, VoidCallback gotoMap,
    VoidCallback gotoQR) {
  List data = [
    [
      {'name': 'Good', 'color': darkGreenColor, 'icon': goodIcon},
      {'name': 'Fair', 'color': darkBrown1Color, 'icon': fairIcon},
      {'name': 'Avarage', 'color': darkBlueColor, 'icon': avarageIcon},
      {'name': 'Repair', 'color': darkBrown2Color, 'icon': repairIcon},
      {'name': 'Replace', 'color': darkPinkColor, 'icon': replaceIcon},
    ],
    [
      {'name': 'Ok', 'color': darkGreenColor, 'icon': rpOkIcon},
      {'name': 'Low', 'color': darkBrown1Color, 'icon': rpLowIcon},
      {'name': 'Avarage', 'color': darkBlueColor, 'icon': rpAvarageIcon},
      {'name': 'High', 'color': darkBrown2Color, 'icon': rpHighIcon},
      {'name': 'High', 'color': darkPinkColor, 'icon': rpHigh2Icon},
    ],
  ];
  return Flexible(
    child: TabBarView(
      controller: _tabController,
      children: [
        tabBarColumnItem(data, 0, visibility, gotoMap, gotoQR),
        tabBarColumnItem(data, 1, visibility, gotoMap, gotoQR),
      ],
    ),
  );
}

tabBarColumnItem(List data, int index, bool visibility, VoidCallback gotoMap,
    VoidCallback gotoQR) {
  bool isSwitched = true;
  return SizedBox(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            topImageIcons(data[index][0]['name'], data[index][0]['color'],
                data[index][0]['icon']),
            topImageIcons(data[index][1]['name'], data[index][1]['color'],
                data[index][1]['icon']),
            topImageIcons(data[index][2]['name'], data[index][2]['color'],
                data[index][2]['icon']),
            topImageIcons(data[index][3]['name'], data[index][3]['color'],
                data[index][3]['icon']),
            topImageIcons(data[index][4]['name'], data[index][4]['color'],
                data[index][4]['icon']),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            bottomLeftContainer(),
            bottomRightNumberContainer(),
          ],
        ),
        expandedDetails(isSwitched, visibility, gotoMap, gotoQR),
      ],
    ),
  );
}

expandedDetails(bool isSwitched, bool visibility, VoidCallback gotoMap,
    VoidCallback gotoQR) {
  return Visibility(
    visible: visibility,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            descriptionField(),
            sizedBox(2.h),
            additionalCommentsField(),
            sizedBox(2.h),
            rfidField(gotoQR),
            sizedBox(2.h),
            mapField(gotoMap),
            sizedBox(3.h),
            maintenanceDetailsText(),
            sizedBox(2.h),
            workField(),
            sizedBox(2.h),
            dradeField(),
            sizedBox(1.h),
            defectsDetailsSwitch(isSwitched),
            sizedBox(1.h),
            workField(),
            sizedBox(2.h),
            dradeField(),
            sizedBox(2.h),
            button(),
            sizedBox(1.h),
          ],
        ),
      ),
    ),
  );
}

defectsDetailsSwitch(bool isSwitched) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Defects Details',
        style: TextStyle(
            color: darkGreyColor, fontSize: 12, fontWeight: FontWeight.w600),
      ),
      Switch(
        value: isSwitched,
        onChanged: (v) {
          isSwitched = !isSwitched;
        },
      ),
    ],
  );
}

maintenanceDetailsText() {
  return Text(
    'Maintenance Details',
    style: TextStyle(
        color: darkGreyColor, fontSize: 12, fontWeight: FontWeight.w600),
  );
}

descriptionField() {
  return TextFormField(
    maxLines: 4,
    decoration: textFieldInputDecoration('Description'),
  );
}

additionalCommentsField() {
  return TextFormField(
    decoration: textFieldInputDecoration('Additional Comments'),
  );
}

rfidField(VoidCallback onClick) {
  return TextFormField(
    readOnly: true,
    decoration: textFieldInputDecorationWithSuffix(
        'RFID', Icons.qr_code_scanner, onClick),
  );
}

mapField(VoidCallback onClick) {
  return TextFormField(
    readOnly: true,
    decoration:
        textFieldInputDecorationWithSuffix('Location', Icons.map, onClick),
  );
}

workField() {
  return TextFormField(
    decoration: textFieldInputDecoration('Work'),
  );
}

dradeField() {
  return Row(
    children: [
      Expanded(
        child: TextFormField(
          decoration: textFieldInputDecoration('99.00'),
        ),
      ),
      SizedBox(
        width: 4.w,
      ),
      Expanded(
        child: TextFormField(
          decoration: textFieldInputDecoration('Drade'),
        ),
      ),
    ],
  );
}

sizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

textFieldInputDecoration(String text) {
  return InputDecoration(
    fillColor: lightGreyColor,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: greyColor),
      borderRadius: BorderRadius.circular(7),
    ),
    hintText: text,
    hintStyle: TextStyle(color: darkGreyColor, fontSize: 14),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greyColor),
      borderRadius: BorderRadius.circular(7),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: greyColor),
      borderRadius: BorderRadius.circular(7),
    ),
  );
}

textFieldInputDecorationWithSuffix(
    String text, IconData icon, VoidCallback onClick) {
  return InputDecoration(
    suffixIcon: InkWell(
      onTap: onClick,
      child: Container(
        decoration:
            BoxDecoration(border: Border(left: BorderSide(color: greyColor))),
        child: Icon(
          icon,
          color: greyColor,
        ),
      ),
    ),
    fillColor: lightGreyColor,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: greyColor),
      borderRadius: BorderRadius.circular(7),
    ),
    hintText: text,
    hintStyle: TextStyle(color: darkGreyColor, fontSize: 14),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greyColor),
      borderRadius: BorderRadius.circular(7),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: greyColor),
      borderRadius: BorderRadius.circular(7),
    ),
  );
}

bottomButton(String text, Color color) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    ),
  );
}

button() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      bottomButton('Cancel', cancelButtonColor),
      bottomButton('Login', primaryColor),
    ],
  );
}

bottomComponents(VoidCallback onClick) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    width: 100.w,
    height: 45.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget(onClick),
        sizedBox(1.h),
        numberWidget(),
        sizedBox(3.h),
        bottomRow(Icons.replay_circle_filled, 'View Previous Inspection',
            Color(0XFF4A4A4A)),
        Divider(
          thickness: 1,
        ),
        bottomRow(Icons.location_on_outlined, 'Location', Color(0XFF4A4A4A)),
        Divider(
          thickness: 1,
        ),
        bottomRow(Icons.copy, 'Save as template', Color(0XFF4A4A4A)),
        Divider(
          thickness: 1,
        ),
        bottomRow(
            Icons.announcement_outlined, 'View Details', Color(0XFF4A4A4A)),
        Divider(
          thickness: 1,
        ),
        bottomRow(Icons.delete, 'Delete', Colors.red),
      ],
    ),
  );
}

bottomRow(IconData icon, String text, Color color) {
  return Row(
    children: [
      Icon(
        icon,
        color: color,
      ),
      SizedBox(
        width: 4.w,
      ),
      Text(
        text,
        style:
            TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: color),
      ),
    ],
  );
}
