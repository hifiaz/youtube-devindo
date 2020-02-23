import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).popUntil(
                  ModalRoute.withName(Navigator.defaultRouteName),
                );
              })
        ],
      ),
      body: Center(
        child: Text("Not Found"),
      ),
    );
  }
}
