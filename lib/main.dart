import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Whatsapp'),
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
  String ava = 'assets/images/erick.jpg';
  String name = 'Erick Thohir';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return DetailProfile(
                    ava: ava,
                    name: name,
                  );
                },
              ));
            },
            leading: Hero(
              tag: 'profile',
              child: CircleAvatar(
                backgroundImage: AssetImage(ava),
              ),
            ),
            title: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Bersih-bersih BUMN'),
            trailing: Text('14/12/19'),
          ),
        ],
      ),
    );
  }
}

class DetailProfile extends StatefulWidget {
  DetailProfile({this.ava, this.name});
  final String ava, name;
  @override
  _DetailProfileState createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 2.5,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(
                widget.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
              background: Container(
                child: Hero(
                    tag: 'profile',
                    child: Image.asset(widget.ava, fit: BoxFit.cover)),
              ),
            ),
          )
        ];
      },
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Media'),
          )
        ],
      ),
    ));
  }
}
