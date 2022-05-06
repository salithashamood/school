import 'package:geolocator/geolocator.dart';

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