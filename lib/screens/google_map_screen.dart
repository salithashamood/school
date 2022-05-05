import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school/components/appbar_component.dart';
import 'package:school/utils/image.dart';
import 'package:sizer/sizer.dart';

class GoogleMapScreen extends StatefulWidget {
  final LatLng? currentPosition;
  final bool isSelected;
  const GoogleMapScreen(
      {Key? key, this.currentPosition, required this.isSelected})
      : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  double? latitude;
  double? longitude;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _marker = [];
  Set<Circle> circles = Set();
  bool isSelected = false;
  bool isCanEdit = false;
  bool isSavePosition = false;
  bool isClick = false;

  LatLng? _location;
  LatLng? selectedLatLng;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  getCurrentLocation() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;
      _location = LatLng(latitude!, longitude!);
      isSavePosition = widget.isSelected;
      circles = {
        Circle(
            circleId: const CircleId('location'),
            center: _location!,
            radius: 500,
            strokeWidth: 0,
            fillColor: Colors.blue.withOpacity(0.20)),
      };
    });
    if (widget.currentPosition != null) {
      setState(() {
        _marker.add(
          Marker(
            markerId: MarkerId(widget.currentPosition.toString()),
            position: widget.currentPosition!,
            infoWindow: InfoWindow(title: 'Select Location'),
          ),
        );
      });
    }
  }

  onLongPress(LatLng tappedPont) {
    setState(() {
      isSavePosition = true;
      isSelected = true;
      isClick = false;
      _marker = [];
      selectedLatLng = tappedPont;
      _marker.add(
        Marker(
          markerId: MarkerId(tappedPont.toString()),
          position: tappedPont,
          infoWindow: InfoWindow(title: 'Select Location'),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  tapBackButton() {
    Get.back(result: [null]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: [null]);
        return true;
      },
      child: Scaffold(
        appBar: AppBarComponent(
          isHaveTitle: true,
          isHomePage: false,
          secondTitle: '',
          toolBarHeight: 10.h,
          title: 'Map',
          backTap: tapBackButton,
        ),
        body: _location != null
            ? Stack(
                children: [
                  GoogleMap(
                    circles: circles,
                    // mapType: MapType.hybrid,
                    markers: Set.from(_marker),
                    onLongPress: isCanEdit ? onLongPress : null,
                    buildingsEnabled: true,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _location!,
                      zoom: 13,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 25,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 19),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Color(0XFF010101).withOpacity(0.48)),
                      child: isSavePosition
                          ? isSelected
                              ? buttonItem('Done', false)
                              : isClick
                                  ? textWidget()
                                  : buttonItem('Edit', true)
                          : isClick
                              ? textWidget()
                              : buttonItem('Add', true),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  textWidget() {
    return Text('Select Position',
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white));
  }

  clickDone() {
    Get.back(result: [selectedLatLng]);
  }

  editButton() {
    setState(() {
      isClick = true;
      isCanEdit = true;
    });
  }

  buttonItem(String text, bool isIcon) {
    return InkWell(
      onTap: !isIcon ? clickDone : editButton,
      child: Row(
        children: [
          isIcon
              ? Image.asset(
                  locationIcon,
                  scale: 4,
                )
              : const Icon(
                  Icons.done,
                  size: 18,
                  color: Colors.white,
                ),
          SizedBox(
            width: 1.w,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
