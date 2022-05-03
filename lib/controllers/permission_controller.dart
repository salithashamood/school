import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> permissionCamera() async {
  if (Platform.isIOS &&
          await Permission.storage.request().isGranted &&
          await Permission.photos.request().isGranted &&
          await Permission.camera.request().isGranted ||
      Platform.isAndroid &&
          await Permission.storage.request().isGranted &&
          await Permission.camera.request().isGranted) {
    return true;
  }
  return false;
}

Future<bool> premissionLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  LocationPermission permission = await Geolocator.checkPermission();
  if (serviceEnabled) {
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return true;
      } else {
        return false;
      }
    } else if (permission == LocationPermission.deniedForever) {
      return false;
    } else {
      return true;
    }
  } else {
    return false;
  }
}
