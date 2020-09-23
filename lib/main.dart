import 'package:flutter/material.dart';
import 'package:flutter_share_preference/show.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Share Pref',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final text = TextEditingController();
  final number = TextEditingController();
  final numberdouble = TextEditingController();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.next_plan),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Show()));
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: text,
            ),
            RaisedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('valstring', text.text);
                },
                child: Text('Save String')),
            TextFormField(
              controller: number,
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setInt('valint', int.parse(number.text));
                },
                child: Text('Save Int')),
            TextFormField(
              controller: numberdouble,
              keyboardType: TextInputType.number,
            ),
            RaisedButton(onPressed: () {}, child: Text('Save double')),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
