import 'package:flutter/material.dart';
import 'package:gojek_clone/pages/account.dart';
import 'package:gojek_clone/pages/chats.dart';
import 'package:gojek_clone/pages/home.dart';
import 'package:gojek_clone/pages/inboxs.dart';
import 'package:gojek_clone/pages/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gojek',
      theme: ThemeData(
        fontFamily: 'MaisonNeue',
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Gojek'),
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
  int i = 0;
  final List<Widget> pages = [Homes(), Orders(), Chats(), Inboxs(), Accounts()];

  void _incrementTab(index) {
    setState(() {
      i = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: i,
          onTap: (index) {
            _incrementTab(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset('images/home.png', scale: 2.5),
                ),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset('images/orders.png', scale: 2.5),
                ),
                title: Text('Orders')),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset('images/chat.png', scale: 2.5),
                ),
                title: Text('Chat')),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset('images/inbox.png', scale: 2.5),
                ),
                title: Text('Inbox')),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset('images/account.png', scale: 2.5),
                ),
                title: Text('Account'))
          ]),
    );
  }
}
