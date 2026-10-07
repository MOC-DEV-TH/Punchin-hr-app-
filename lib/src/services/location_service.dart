import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService._();

  /// Check if location services are enabled
  static Future<bool> isLocationServiceEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  /// Check location permission
  static Future<LocationPermission> checkPermission() async {
    return Geolocator.checkPermission();
  }

  /// Request location permission
  static Future<LocationPermission> requestPermission() async {
    return Geolocator.requestPermission();
  }

  /// Get current position
  static Future<Position> getCurrentPosition() async {
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      timeLimit: Duration(seconds: 15),
    );

    return Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
  }

  /// Calculate distance in KM
  static double calculateDistance(
      double startLatitude,
      double startLongitude,
      double endLatitude,
      double endLongitude,
      ) {
    final distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );

    return distanceInMeters / 1000;
  }

  /// Check if user is within allowed radius
  ///
  /// IMPORTANT:
  /// allowedRadiusInKm must also be KM.
  static Future<bool> isWithinOfficeRadius(
      double? targetLatitude,
      double? targetLongitude,
      double? allowedRadiusInKm,
      ) async {
    try {
      debugPrint('');
      debugPrint('================ LOCATION CHECK ================');

      debugPrint('Target Lat >>> $targetLatitude');
      debugPrint('Target Long >>> $targetLongitude');
      debugPrint('Allowed Radius >>> $allowedRadiusInKm km');

      if (targetLatitude == null || targetLongitude == null) {
        debugPrint('ERROR >>> Target latitude/longitude is null');
        return false;
      }

      if (allowedRadiusInKm == null || allowedRadiusInKm <= 0) {
        debugPrint('ERROR >>> Invalid allowed radius');
        return false;
      }

      if (!_isValidLatitude(targetLatitude) ||
          !_isValidLongitude(targetLongitude)) {
        debugPrint('ERROR >>> Invalid latitude/longitude');
        return false;
      }

      final position = await getCurrentPosition();

      debugPrint('Current Lat >>> ${position.latitude}');
      debugPrint('Current Long >>> ${position.longitude}');
      debugPrint('Accuracy >>> ${position.accuracy} meters');

      final distanceInKm = calculateDistance(
        position.latitude,
        position.longitude,
        targetLatitude,
        targetLongitude,
      );

      final isWithinRadius =
          distanceInKm <= allowedRadiusInKm;

      debugPrint(
        'Distance >>> ${distanceInKm.toStringAsFixed(3)} km',
      );

      debugPrint(
        'Allowed >>> ${allowedRadiusInKm.toStringAsFixed(3)} km',
      );

      debugPrint('Is Within Radius >>> $isWithinRadius');

      debugPrint('================================================');
      debugPrint('');

      return isWithinRadius;
    } catch (error, stackTrace) {
      debugPrint('LOCATION CHECK ERROR >>> $error');

      debugPrintStack(
        stackTrace: stackTrace,
      );

      return false;
    }
  }

  static bool _isValidLatitude(double latitude) {
    return latitude >= -90 && latitude <= 90;
  }

  static bool _isValidLongitude(double longitude) {
    return longitude >= -180 && longitude <= 180;
  }
}