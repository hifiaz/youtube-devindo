import 'package:flutter/material.dart';
import 'package:routing/routes/notfound.dart';
import 'package:routing/routes/routing_a.dart';
import 'package:routing/routes/routing_b.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Routing',
      routes:{
        'routeA': (BuildContext context) => RouteA(),
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (context) => NotFound(),
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing dan Navigasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Siap untuk implementasi routing dan navigasi?',
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('routeA');
              },
              child: Text('Bawa Ke Halaman A'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouteB(),
                  ),
                );
              },
              child: Text('Bawa Ke Halaman B'),
            )
          ],
        ),
      ),
    );
  }
}
