import 'package:crud_sqlite/mvvm/services/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.iconfig.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() {
  $initGetIt(locator);
  locator.registerLazySingleton(() => DatabaseService());
}
