import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewScreen extends StatefulWidget {
  final double? appBorderRadius;
  final Color? appBarhadowColor;
  final double? appBarElavation;
  final double appBarToolBarHeight;
  final Color? appBarColor;
  final bool? isCenterTitle;
  final String appBarTitle;
  final LatLng? currentPosition;
  final bool isSelected;
  final String image;
  const MapViewScreen(
      {Key? key,
      this.appBorderRadius,
      this.appBarhadowColor,
      this.appBarElavation,
      required this.appBarToolBarHeight,
      this.appBarColor,
      this.isCenterTitle,
      required this.appBarTitle,
      this.currentPosition,
      required this.isSelected, required this.image})
      : super(key: key);

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  double? latitude;
  double? longitude;
  final Completer<GoogleMapController> _controller = Completer();
  List<Marker> _marker = [];
  Set<Circle> circles = {};
  bool isSelected = false;
  bool isCanEdit = false;
  bool isSavePosition = false;
  bool isClick = false;

  LatLng? _location;
  LatLng? selectedLatLng;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  appBarShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(widget.appBorderRadius ?? 20),
      ),
    );
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
            infoWindow: const InfoWindow(title: 'Select Location'),
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
          infoWindow: const InfoWindow(title: 'Select Location'),
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
    return Scaffold(
      appBar: AppBar(
        shadowColor: widget.appBarhadowColor ?? const Color(0xff70707059),
        elevation: widget.appBarElavation ?? 5,
        shape: appBarShape(),
        toolbarHeight: widget.appBarToolBarHeight,
        backgroundColor: widget.appBarColor ?? const Color(0XFF274BFF),
        centerTitle: widget.isCenterTitle ?? true,
        title: Text(widget.appBarTitle),
        leading: IconButton(
          onPressed: tapBackButton,
          icon: const Icon(Icons.arrow_back),
        ),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 19),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(18)),
                        color: const Color(0XFF010101).withOpacity(0.48)),
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
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  textWidget() {
    return const Text('Select Position',
        style: TextStyle(
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
                  widget.image,
                  scale: 4,
                )
              : const Icon(
                  Icons.done,
                  size: 18,
                  color: Colors.white,
                ),
          const SizedBox(
            width: 5,
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
