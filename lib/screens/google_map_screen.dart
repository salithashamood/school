import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school/components/appbar_component.dart';
import 'package:sizer/sizer.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  final LatLng _location = const LatLng(6.899614192743463, 79.85575088181035);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
          isHaveTitle: true,
          isHomePage: false,
          secondTitle: '',
          toolBarHeight: 10.h,
          title: 'Map'),
      body: GoogleMap(
        buildingsEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _location,
          zoom: 15,
        ),
      ),
    );
  }
}
