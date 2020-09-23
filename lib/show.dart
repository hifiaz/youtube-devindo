import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Show extends StatefulWidget {
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  String valstring;
  int valint;
  double valdouble;
  bool valbool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('$valstring'),
          RaisedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String val = prefs.getString('valstring');
              setState(() {
                valstring = val;
              });
            },
            child: Text('Get String'),
          ),
          Text('$valint'),
          RaisedButton(
           onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              int val = prefs.getInt('valint');
              setState(() {
                valint = val;
              });
            },
            child: Text('Get Int'),
          ),
          Text('$valdouble'),
          RaisedButton(
            onPressed: () {},
            child: Text('Get Double'),
          ),
          Text('$valbool'),
          RaisedButton(
            onPressed: () {},
            child: Text('Get bool'),
          )
        ],
      ),
    );
  }
}
