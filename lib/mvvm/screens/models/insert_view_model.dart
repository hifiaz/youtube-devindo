import 'package:crud_sqlite/mvvm/app/locator.dart';
import 'package:crud_sqlite/mvvm/app/router.gr.dart';
import 'package:crud_sqlite/mvvm/services/database_service.dart';
import 'package:crud_sqlite/mvvm/utils/models/barang.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InsertViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  DatabaseService _databaseService = locator<DatabaseService>();
  int _id;
  String _barang;
  int _jumlah = 1;

  String get barang => _barang;
  int get jumlah => _jumlah;

  void inisial(id, barang, jumlah) {
    if (id != null) {
      _id = id;
      _barang = barang;
      _jumlah = jumlah;
    }
    notifyListeners();
  }

  void setJumlah(val) {
    _jumlah = val;
    notifyListeners();
  }

  void setBarang(val) {
    _barang = val;
    notifyListeners();
  }

  Future setInsert() async {
    await _databaseService
        .insert(Barang(id: null, barang: barang, jumlah: jumlah));
    _navigationService.pushNamedAndRemoveUntil(Routes.homeRoute);
    notifyListeners();
  }

  Future setUpdate() async {
    await _databaseService
        .update(Barang(id: _id, barang: barang, jumlah: jumlah));
    _navigationService.pushNamedAndRemoveUntil(Routes.homeRoute);
    notifyListeners();
  }
}
