import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:grab/widget/button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isKeybord() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff159c3f),
      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Image(
                image: AssetImage('assets/grab.png'),
                width: 180.0,
              )),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Selamat datang!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Masukkan nomor ponselmu.',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'ID',
                          showCountryOnly: false,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '1234 5678 9000',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isKeybord()
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Lanjutin',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Atau bisa juga lanjut pakai akun media sosialmu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ButtonLogin(
                              logo: "assets/fb.png",
                              title: 'Facebook',
                              color: Color(0xff3b5998),
                            ),
                            ButtonLogin(
                              logo: "assets/go.png",
                              title: 'Google',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
