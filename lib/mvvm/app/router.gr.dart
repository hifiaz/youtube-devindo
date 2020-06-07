// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:crud_sqlite/mvvm/screens/home.dart';
import 'package:crud_sqlite/mvvm/screens/insert.dart';
import 'package:crud_sqlite/mvvm/utils/models/barang.dart';
import 'package:crud_sqlite/mvvm/screens/detail.dart';

abstract class Routes {
  static const homeRoute = '/';
  static const insertRoute = '/insert-route';
  static const detailRoute = '/detail-route';
  static const all = {
    homeRoute,
    insertRoute,
    detailRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Home(),
          settings: settings,
        );
      case Routes.insertRoute:
        if (hasInvalidArgs<InsertArguments>(args)) {
          return misTypedArgsRoute<InsertArguments>(args);
        }
        final typedArgs = args as InsertArguments ?? InsertArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => Insert(barang: typedArgs.barang),
          settings: settings,
        );
      case Routes.detailRoute:
        if (hasInvalidArgs<DetailArguments>(args)) {
          return misTypedArgsRoute<DetailArguments>(args);
        }
        final typedArgs = args as DetailArguments ?? DetailArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => Detail(id: typedArgs.id),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//Insert arguments holder class
class InsertArguments {
  final Barang barang;
  InsertArguments({this.barang});
}

//Detail arguments holder class
class DetailArguments {
  final int id;
  DetailArguments({this.id});
}
