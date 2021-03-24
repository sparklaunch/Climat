import "package:geolocator/geolocator.dart";

class GeolocatorHelper {
  Future<Map<String, double>> getGeoData() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    return {
      "latitude": position.latitude,
      "longitude": position.longitude,
    };
  }
}
