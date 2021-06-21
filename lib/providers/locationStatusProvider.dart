import 'package:envirocar_app_main/services/locationStatusChecker.dart';
import 'package:flutter/foundation.dart';

import '../models/enums/locationStatus.dart';

class LocationStatusProvider extends ChangeNotifier {
  LocationStatus locationStatus;

  LocationStatusProvider() {
    locationStatus = LocationStatus.disabled;
    sendStatusUpdates();
  }

  /// function to update location stream upon listening to status updates
  void sendStatusUpdates() async {
    LocationStatusChecker().onStatusChange.listen((status) {
      locationStatus = status;
      notifyListeners();
    });
  }

  /// function to get current [locationStatus]
  LocationStatus get locationState => locationStatus;
}