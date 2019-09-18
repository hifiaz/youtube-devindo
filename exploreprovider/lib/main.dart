import 'package:exploreprovider/data/theme.dart';
import 'package:exploreprovider/data/uiset.dart';
import 'package:exploreprovider/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(builder: (_) => UiSet()),
      ChangeNotifierProvider(builder: (_) => ThemeNotifier()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeNotifier>(context).curretThemeData,
      home: Home(),
    );
  }
}
