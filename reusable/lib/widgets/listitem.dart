import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem(
      {@required this.title,
      this.subtile,
      this.icon,
      this.btncolor,
      this.btnpress});
  final String title, subtile;
  final IconData icon;
  final Color btncolor;
  final Function btnpress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Wrap(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                subtile,
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: btncolor ?? Colors.blue,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        onPressed: btnpress,
        icon: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
