import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide Up',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Go Map'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff3f3f3),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text('Anggap ada Map'),
              ),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.25,
                  minChildSize: 0.12,
                  // maxChildSize: 0.8,
                  builder: (BuildContext c, s) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: ListView(
                        controller: s,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 8,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Mau ke mana hari ini?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Alamat 1'),
                          ),
                          ListTile(
                            title: Text('Alamat 2'),
                          ),
                          ListTile(
                            title: Text('Alamat 3'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
