import 'package:flutter/material.dart';
import 'package:routing/routes/routing_b.dart';

class RouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to Route A"),
            RaisedButton(
              child: Text("Back to home"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text("route B from A"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteB()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
