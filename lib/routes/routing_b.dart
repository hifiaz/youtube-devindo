import 'package:flutter/material.dart';
import 'package:routing/routes/routing_c.dart';

class RouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to Route B"),
            RaisedButton(
              child: Text("Go to home"),
              onPressed: () {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
            RaisedButton(
              child: Text("Go to Route C"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteC()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
