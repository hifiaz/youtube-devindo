import 'package:crud_sqlite/mvvm/app/locator.dart';
import 'package:crud_sqlite/mvvm/services/database_service.dart';
import 'package:crud_sqlite/mvvm/utils/models/barang.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  DatabaseService _databaseService = locator<DatabaseService>();
  List<Barang> _barang;
  List<Barang> get barang => _barang;

  Future initial() async {
    _barang = await _databaseService.getBarangList();
    notifyListeners();
  }

  Future delete(id) async {
    await _databaseService.delete(id).whenComplete(() => initial());
    notifyListeners();
  }

}
