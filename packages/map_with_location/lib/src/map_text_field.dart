import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_with_location/permission.dart';
import 'package:map_with_location/src/map_view.dart';

class MapTextField extends StatefulWidget {
  final TextEditingController textEditController;
  final bool? isReadOnly;
  final Color? borderColor;
  final Color? iconColor;
  final IconData icon;
  final Color? filledColor;
  final bool? filled;
  final String hintText;
  final Color? hintTextColor;
  final double? hintTextSize;
  final double? borderRadius;
  final double? appBorderRadius;
  final Color? appBarhadowColor;
  final double? appBarElavation;
  final double appBarToolBarHeight;
  final Color? appBarColor;
  final bool? isCenterTitle;
  final String appBarTitle;
  final LatLng? currentPosition;
  final String image;
  const MapTextField({
    Key? key,
    required this.textEditController,
    this.isReadOnly,
    this.borderColor,
    this.iconColor,
    required this.icon,
    this.filledColor,
    this.filled,
    required this.hintText,
    this.hintTextColor,
    this.hintTextSize,
    this.borderRadius,
    this.appBorderRadius,
    this.appBarhadowColor,
    this.appBarElavation,
    required this.appBarToolBarHeight,
    this.appBarColor,
    this.isCenterTitle,
    required this.appBarTitle,
    this.currentPosition, required this.image,
  }) : super(key: key);

  @override
  State<MapTextField> createState() => _MapTextFieldState();
}

class _MapTextFieldState extends State<MapTextField> {
  LatLng? location;

  onClick() async {
    bool isPermissioned = await premissionLocation();
    if (isPermissioned) {
      Get.to(MapViewScreen(
        currentPosition: location,
        isSelected: location == null ? false : true,
        appBarTitle: widget.appBarTitle,
        appBarToolBarHeight: widget.appBarToolBarHeight,
        appBarColor: widget.appBarColor,
        appBarElavation: widget.appBarElavation,
        appBarhadowColor: widget.appBarhadowColor,
        appBorderRadius: widget.appBorderRadius,
        isCenterTitle: widget.isCenterTitle,
        image: widget.image,
      ))!
          .then((value) {
        if (value[0] != null) {
          setState(() {
            location = value[0];
            double latitiude = location!.latitude;
            double longitude = location!.longitude;
            widget.textEditController.text = '$latitiude , $longitude';
          });
        }
      });
    } else {
      Get.snackbar('Request Permission', 'Can\'t move map without permission');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditController,
      readOnly: widget.isReadOnly ?? true,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: onClick,
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: widget.borderColor ?? Color(0XFF70707059)))),
            child: Icon(
              widget.icon,
              color: widget.iconColor ?? Color(0XFF70707059),
            ),
          ),
        ),
        fillColor: widget.filledColor ?? Color(0XFFE8EEF3),
        filled: widget.filled ?? true,
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: widget.borderColor ?? Color(0XFF70707059)),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 7),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: widget.hintTextColor ?? Color(0XFF6D6D6D),
            fontSize: widget.hintTextSize ?? 14),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: widget.borderColor ?? Color(0XFF70707059)),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: widget.borderColor ?? Color(0XFF70707059)),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 7),
        ),
      ),
    );
  }
}
