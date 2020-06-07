import 'package:crud_sqlite/mvvm/app/locator.dart';
import 'package:crud_sqlite/mvvm/services/database_service.dart';
import 'package:crud_sqlite/mvvm/utils/models/barang.dart';
import 'package:stacked/stacked.dart';

class DetailViewModel extends BaseViewModel {
  DatabaseService _databaseService = locator<DatabaseService>();
  Barang _barang;
  Barang get barang => _barang;
  Future initial(id) async {
    _barang = await _databaseService.getBarang(id);
    notifyListeners();
  }
}
