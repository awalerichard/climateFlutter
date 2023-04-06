import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  //Location(this.longitude, this.latitude);

  Future<void> getCurrentLocation() async {
    //LocationPermission permission;
    //permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
