import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Handle Data'),
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
  String judul;
  String nama = 'Fiaz dan Devindo';

  rambuLalulintas(int data) {
    if (data == 1) {
      return 'Merah - Stop';
    } else {
      return 'Warna Lalin';
    }
  }

  allLalulintas(int data) {
    switch (data) {
      case 1:
        return 'Merah';
        break;
      case 2:
        return 'Kuning';
        break;
      default:
        return 'Hijau';
    }
  }

  deviceTyle(bool data) {
    return data ? 'android' : 'iPhone';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('First'),
            Text(judul ?? 'Kosong'),
            Text(rambuLalulintas(1)),
            Text(allLalulintas(1)),
            Text(deviceTyle(false)),
            Text(
              'Hello ${nama.split(" ")[0]}',
            ),
            Text(
              'Hello ${nama.split(" ")[2]}',
            ),
          ],
        ),
      ),
    );
  }
}
