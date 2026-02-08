import 'dart:ui';

import 'package:geolocator/geolocator.dart';

class LocationService {
  bool isPermissionEnabled(LocationPermission locationPermission) {
    return locationPermission == LocationPermission.whileInUse ||
        locationPermission == LocationPermission.always;
  }

  Future<bool> handleLocationPermission({
    VoidCallback? onSuccess,
  }) async {
    // Check if user permission is given
    final LocationPermission locationPermission =
    await Geolocator.checkPermission();
    if (isPermissionEnabled(locationPermission)) {
      // Check if user gps service enabled
      final bool isGpsEnabled = await Geolocator.isLocationServiceEnabled();
      if (isGpsEnabled) {
        onSuccess?.call();
        return true;
      } else {
        // If not, then open the location settings
        await Geolocator.openLocationSettings();
      }
    } else {
      // If not, then ask for permission
      final LocationPermission permission =
      await Geolocator.requestPermission();
      if (isPermissionEnabled(permission)) {
        handleLocationPermission(onSuccess: onSuccess);
      }
    }
    return false;
  }

  Future<Position?> getCurrentLocation() async {
    final bool isSuccess = await handleLocationPermission();
    if (isSuccess) {
      return Geolocator.getCurrentPosition();
    }
    return null;
  }

  // TODO: Listen location from here
}