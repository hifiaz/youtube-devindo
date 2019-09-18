import 'package:exploreprovider/data/theme.dart';
import 'package:exploreprovider/data/uiset.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiSet>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('${ui.fontSize.toInt()}'),
            subtitle: Slider(
              value: ui.sliderfontSize,
              min: 0.5,
              onChanged: (newValue) {
                ui.fontSize = newValue;
              },
            ),
          ),
          RaisedButton(
            child: Text('Change Theme'),
            onPressed: () => Provider.of<ThemeNotifier>(context).switchTheme() ,
          )
        ],
      ),
    );
  }
}