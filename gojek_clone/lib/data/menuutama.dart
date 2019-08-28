import 'package:flutter/widgets.dart';

var menuUtama = [
  MenuModel(
    images: 'images/goride.png',
    title: 'GoRide',
    textcolor: Color(0xFF52616b),
    route: null
  ),
  MenuModel(
    images: 'images/gocar.png',
    title: 'GoCar',
    textcolor: Color(0xFF52616b),
    route: null
  ),
  MenuModel(
    images: 'images/gofood.png',
    title: 'GoFood',
    textcolor: Color(0xFF52616b),
    route: null
  ),
  MenuModel(
    images: 'images/gobluebird.png',
    title: 'GoBlueBird',
    textcolor: Color(0xFF52616b),
    route: null
  ),
  MenuModel(
    images: 'images/gosend.png',
    title: 'GoSend',
    textcolor: Color(0xFF52616b),
    route: null
  ),
  MenuModel(
    images: 'images/godeals.png',
    title: 'GoDeals',
    textcolor: Color(0xFF52616b),
    route: null
  ),
  MenuModel(
    images: 'images/gopulsa.png',
    title: 'GoPulsa',
    textcolor: Color(0xFF52616b),
    route: null
  ),
  MenuModel(
    images: 'images/more-1.png',
    title: 'MORE',
    textcolor: Color(0xFF52616b),
    route: null
  ),
];

class MenuModel {
  var images;
  var title;
  Color textcolor;
  var route;
  MenuModel({this.images, this.title, this.textcolor, this.route});
}
