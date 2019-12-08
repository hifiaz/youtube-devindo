import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Form Validasi'),
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (value) =>
                    (value.length < 2) ? 'Lebih panjang lagi dong' : null,
              ),
              TextFormField(
                controller: username,
                validator: (value) =>
                    (username.text.isEmpty) ? 'Jangan Kosong' : null,
              ),
              TextFormField(
                validator: (value) {
                  Pattern patttern = r'(^(?:[+0]6)?[0-9]{10,12}$)';
                  RegExp regExp = new RegExp(patttern);
                  return (!regExp.hasMatch(value))
                      ? 'Pake +62 depannya dan ga boleh huruf'
                      : null;
                },
              ),
              TextFormField(
                validator: (val) {
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  return (!regex.hasMatch(val))
                      ? 'Masukin email yg bener'
                      : null;
                },
                // validator: _validateEmail,
              ),
              FlatButton(
                  child: Text('Lanjut'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      // LAkukan sesuatu
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      return "Masukkan email anda";
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (regex.hasMatch(value)) {
      return null;
    }
    return 'Masukin email yg bener';
  }
}
