import 'package:geolocator/geolocator.dart';
import 'package:location_device/mvvm/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class LocationService {
  DialogService _dialogService = locator<DialogService>();

  Future getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future searchLocation(val) async {
    try {
      List<Placemark> placemark = await Geolocator().placemarkFromAddress(val);
      var location;
      if (placemark.isNotEmpty) {
        location = placemark[0].position;
      }
      return location;
    } catch (e) {
      _dialogService.showDialog(
          title: 'Something Wrong', description: e.toString());
    }
  }

  Future getNameLocation(lat, long) async {
    try {
      List<Placemark> placemark =
          await Geolocator().placemarkFromCoordinates(lat, long);
      var location;
      if (placemark.isNotEmpty) {
        location = placemark[0].postalCode;
      }
      return location;
    } catch (e) {
      _dialogService.showDialog(
          title: 'Something Wrong', description: e.toString());
    }
  }
}
