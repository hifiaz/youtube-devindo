import 'package:flutter/material.dart';

class RouteC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: SizedBox(), actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('back'),
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to Route C"),
            RaisedButton(
              child: Text("Go to Route A"),
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName('RouteA'));
              },
            ),
            RaisedButton(
              child: Text("Not Found"),
              onPressed: () {
                Navigator.of(context).pushNamed('routes');
              },
            )
          ],
        ),
      ),
    );
  }
}
