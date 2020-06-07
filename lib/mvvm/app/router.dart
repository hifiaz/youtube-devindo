import 'package:auto_route/auto_route_annotations.dart';
import 'package:crud_sqlite/mvvm/screens/detail.dart';
import 'package:crud_sqlite/mvvm/screens/insert.dart';
import '../screens/home.dart';
  
@MaterialAutoRouter()
class $Router {
  @initial
  Home homeRoute;
  Insert insertRoute;
  Detail detailRoute;
}