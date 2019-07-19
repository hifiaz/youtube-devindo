import 'package:flutter/material.dart';
import 'package:reusable/widgets/listitem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Widget',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              ListItem(
                icon: Icons.home,
                title: 'Title 1',
                subtile: 'Subtitle 1',
                btncolor: Colors.purple,
                btnpress: () {},
              ),
              ListItem(
                icon: Icons.cached,
                title: 'Title 2',
                subtile: 'Subtitle 1',
                btnpress: () {},
              ),
              ListItem(
                icon: Icons.tab,
                title: 'Title 3',
                subtile: 'Subtitle 1',
                btncolor: Colors.cyan,
                btnpress: () {},
              ),
              ListItem(
                icon: Icons.card_giftcard,
                title: 'Title 4',
                subtile: 'Subtitle 1',
                btncolor: Colors.lime,
                btnpress: () {},
              )
            ],
          ),
        ));
  }
}
