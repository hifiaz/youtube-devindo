import 'package:crud_jsonplaceholder/service/data_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataService = Provider((_) => DataService());