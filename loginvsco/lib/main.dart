import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VSCO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'VSCO Login'),
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
  var images = 'https://source.unsplash.com/900x600/?girls';
  var girls = [
    'https://source.unsplash.com/D3XH85yOw9Y',
    'https://source.unsplash.com/cq5f6ZTMaYQ',
    'https://source.unsplash.com/6W4F62sN_yI',
    'https://source.unsplash.com/NSPPhHIJtkA',
  ];

  int _index = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer){
      print('build');
      setState(() {
        _index = (_index + 1) % girls.length;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(girls[_index]),
            fit: BoxFit.cover,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Spacer(),
                Center(child: Image.asset('images/vsco.png', height: 80)),
                SizedBox(height: 10),
                Text('VSCO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 10),
                Text(
                  'Tingkatkan fotografi Anda\nke jenjang berikutnya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                ButtonLogin(
                  ontap: () {},
                  image: 'images/facebook.png',
                  title: 'Lanjutkan dengan Facebook',
                ),
                ButtonLogin(
                  ontap: () {},
                  image: 'images/google.png',
                  title: 'Lanjutkan dengan Google',
                ),
                ButtonLogin(
                  ontap: () {},
                  title: 'Daftar dengan nomor telepon',
                ),
                ButtonLogin(
                  ontap: () {},
                  title: 'Daftar dengan email',
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Masuk',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Dengan mendaftar, berarti Anda menyetujui ',
                        style: TextStyle(fontSize: 12)),
                    TextSpan(
                        text: 'Ketentuan Penggunaan ',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    TextSpan(text: '& ', style: TextStyle(fontSize: 12)),
                    TextSpan(
                        text: 'Kebijakan Privasi ',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    TextSpan(text: 'VSCO', style: TextStyle(fontSize: 12)),
                  ]),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key key,
    this.ontap,
    this.image,
    this.title,
  }) : super(key: key);
  final VoidCallback ontap;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        color: Colors.white,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            (image != null)
                ? Image.asset(image, width: 25)
                : SizedBox(width: 25),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 25),
          ],
        ),
      ),
    );
  }
}
