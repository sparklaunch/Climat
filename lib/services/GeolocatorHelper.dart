import "package:geolocator/geolocator.dart";

class GeolocatorHelper {
  Future<Map<String, double>> getGeoData() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      return {
        "latitude": position.latitude,
        "longitude": position.longitude,
      };
    } catch (exception) {
      print("Error: $exception, User denied device's access to location.");
    }
  }
}
