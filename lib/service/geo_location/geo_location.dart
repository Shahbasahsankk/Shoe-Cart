import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

import '../../utils/app_exceptions.dart';

class GeoLocationService {
  Future<Position?> determinePosition() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error("Location permission are denied");
        }
        return null;
      } else {
        return await Geolocator.getCurrentPosition();
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<Address?> getLocationAddress(latitude, longitude) async {
    try {
      Address address = await GeoCode()
          .reverseGeocoding(latitude: latitude, longitude: longitude);
      return address;
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
