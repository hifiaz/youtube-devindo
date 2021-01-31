import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  File _imageFile;

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  _takeScreenshot() async {
    _imageFile = null;
    screenshotController
        .capture(delay: Duration(milliseconds: 10), pixelRatio: 2.0)
        .then((File image) async {
      setState(() {
        _imageFile = image;
      });
      final directory = (await getApplicationDocumentsDirectory()).path;
      Uint8List pngBytes = _imageFile.readAsBytesSync();
      File imgFile = File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);
      print("File Save");
      await Share.shareFiles(['$directory/screenshot.png'],
          text: 'Ini Screenshot');
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Screenshot(
        controller: screenshotController,
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/logo.png', scale: 3),
              Text('Toko Maju Jaya'),
              SizedBox(height: 20),
              ListTile(
                title: Text('Customer'),
                trailing: Text('Devindo'),
              ),
              ListTile(
                title: Text('Tgl. Pembelian'),
                trailing: Text('31 Jan 2021'),
              ),
              Divider(),
              ListTile(
                title: Text('Minyak'),
                trailing: Text('Rp. 10.000'),
              ),
              ListTile(
                title: Text('Beras'),
                trailing: Text('Rp. 7.000'),
              ),
              ListTile(
                title: Text('Daging'),
                trailing: Text('Rp. 20.000'),
              ),
              Divider(),
              ListTile(
                title: Text('Total'),
                trailing: Text('Rp. 37.000'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _takeScreenshot(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
