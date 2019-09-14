import 'package:exploreprovider/data/uiset.dart';
import 'package:exploreprovider/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiSet>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Lorem ipsum dolor amet',
          style: TextStyle(fontSize: ui.fontSize),
        ),
      ),
    );
  }
}
