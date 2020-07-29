import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'mvvm/app/locator.dart';
import 'mvvm/app/router.gr.dart';


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: Routes.home,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
