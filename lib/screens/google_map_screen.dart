import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school/components/appbar_component.dart';
import 'package:sizer/sizer.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  double? latitude;
  double? longitude;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _marker = [];

  LatLng? _location;
  LatLng? selectedLatLng;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  getCurrentLocation() async {
    Position currentLocation = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;
      _location = LatLng(latitude!, longitude!);
    });
  }

  onLongPress(LatLng tappedPont) {
    setState(() {
      _marker = [];
      selectedLatLng = tappedPont;
      _marker.add(
        Marker(
          markerId: MarkerId(tappedPont.toString()),
          position: tappedPont,
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
    Get.back(result: [selectedLatLng]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: [selectedLatLng]);
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
            ? GoogleMap(
                mapType: MapType.hybrid,
                markers: Set.from(_marker),
                onLongPress: onLongPress,
                buildingsEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _location!,
                  zoom: 15,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
