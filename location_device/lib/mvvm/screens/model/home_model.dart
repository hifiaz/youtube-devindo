import 'package:location_device/mvvm/app/locator.dart';
import 'package:location_device/mvvm/services/location_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  LocationService _locationService = locator<LocationService>();
  String _latLong;
  String _getSearchLocation;
  String _getNameLocation;
  String get latLong => _latLong;
  String get getSearchLocation => _getSearchLocation;
  String get getNameLocation => _getNameLocation;

  Future getLocation() async {
    var position = await _locationService.getCurrentLocation();
    _latLong = position.toString();
    notifyListeners();
  }

  Future searchLocation(val) async {
    var position = await _locationService.searchLocation(val);
    print(position);
    _getSearchLocation = position.toString();
    notifyListeners();
  }

  Future setNameLocation(lat, long) async {
    var position = await _locationService.getNameLocation(
        double.parse(lat), double.parse(long));
    _getNameLocation = position.toString();
    notifyListeners();
  }
}
