import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  ButtonLogin({this.onPress, this.logo, this.title, this.color});
  final VoidCallback onPress;
  final String logo;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: RaisedButton(
        color: color,
        splashColor: Colors.grey,
        onPressed: () {},
        elevation: 1.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage(logo), height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: color == Colors.white ? Colors.grey : Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
