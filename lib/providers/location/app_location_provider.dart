

import 'package:broker_app/helpers/location/location_helper.dart';
import 'package:broker_app/models/location/app_location.dart';
import 'package:broker_app/providers/app_provider.dart';

class AppLocationProvider extends AppProvider {
  AppLocation? _appLocation;
  AppLocation? get appLocation => _appLocation;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMsg;
  String? get errorMsg => _errorMsg;

  Future<void> setLocation({bool notify = true}) async {
    _isLoading = true;
    if (notify) notifyListeners();

    final (location, error) = await LocationHelper.fetchLocation();

    _appLocation = location;
    _errorMsg = error;
    _isLoading = false;
    notifyListeners();
  }

  @override
  void clean() {
    _appLocation = null;
    _isLoading = false;
    _errorMsg = null;
    notifyListeners();
  }
}
