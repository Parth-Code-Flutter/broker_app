import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/location/app_location.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<(AppLocation?, String?)> fetchLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // return (null, 'Location services are disabled.');
        return (
          null,
          'To continue, turn on device location, which uses Google\'s location service'
        );
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return (null, 'Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return (
          null,
          'Location permissions are permanently denied, '
              ' we cannot request permissions.'
        );
      }

      final position = await Geolocator.getCurrentPosition();

      final location =
          AppLocation(lat: position.latitude, lng: position.longitude);

      return (location, null);
    } catch (e) {
      DevHelper.log(e);
      return (null, 'Error fetching location');
    }
  }
}
