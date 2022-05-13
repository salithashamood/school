import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/components/view_card_components.dart';
import 'package:school/main.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';
import '../utils/image.dart';

bottomButtonWidget() {
  return Row(
    mainAxisAlignment: isTablet
        ? MainAxisAlignment.spaceBetween
        : MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: cancelButtonColor,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: const Text(
          'PREVIOUS',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: const Text(
          'NEXT',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

photosWidget() {
  return SizedBox(
    height: isTablet ? 25.h : 40.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Color(0XFF989898),
          ),
        ),
        sizedBox(1.h),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 6 : 3,
              crossAxisSpacing: 21,
              mainAxisSpacing: 20,
            ),
            itemCount: isTablet ? 12 : 6,
            shrinkWrap: true,
            itemBuilder: (contex, index) {
              return Container(
                color: Colors.red,
                child: Center(child: Text(index.toString())),
              );
            }),
      ],
    ),
  );
}

descriptionWidget() {
  return Container(
    constraints: BoxConstraints.expand(height: isTablet ? 12.h : 18.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Color(0XFF989898),
          ),
        ),
        sizedBox(1.h),
        const Flexible(
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nunc eros, fermentum tincidunt odio ac, congue aliquet eros. Phasellus facilisis, ex id rutrum tincidunt, odio elit vulputate lacus,',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0XFF1C1C1C),
            ),
          ),
        ),
      ],
    ),
  );
}

topImageWidget() {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: isTablet ? 10.h : 25.h,
          width: isTablet ? 45.w : 25.h,
          child: Image.asset(
            isTablet ? fairSelectedTabletIcon : fairSelectedIcon,
            fit: BoxFit.contain,
          ),
        ),
        // SizedBox(
        //   width: 2.w,
        // ),
        SizedBox(
          height: isTablet ? 10.h : 25.h,
          width: isTablet ? 45.w : 25.h,
          child: Image.asset(
            isTablet ? rpHigh2SelectedTabletIcon : rpHigh2SelectedIcon,
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}

dateWidget() {
  return SizedBox(
    width: 5.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
          decoration: BoxDecoration(
            color: yellowColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            'A45878788',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10,
              color: Colors.black.withOpacity(0.63),
            ),
          ),
        ),
        SizedBox(
          width: isTablet ? 2.w : 5.w,
        ),
        SizedBox(
          width: 30.w,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                calenderIcon,
                scale: isTablet ? 3 : 4,
              ),
              isTablet
                  ? SizedBox(
                      width: 1.w,
                    )
                  : Container(),
              Text(
                'Jul 07, 2021',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: const Color(0XFF0F0F0F).withOpacity(0.39),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

topStackWidget() {
  return SizedBox(
    width: 100.w,
    child: Stack(
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            'Door - Glass and Wood front doors',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: primaryTextColor,
                overflow: TextOverflow.ellipsis),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset(drawerCloseButton),
          ),
        ),
      ],
    ),
  );
}

middleRowWidget(String leftName, String rightName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leftName,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Color(0XFF989898),
        ),
      ),
      Text(
        rightName,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Color(0XFF1C1C1C),
        ),
      ),
    ],
  );
}
