import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grab/layout/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Grab',
      theme: ThemeData(
        textTheme: GoogleFonts.oswaldTextTheme(textTheme).copyWith(
          body1: GoogleFonts.lato(),
        ),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
