import 'package:flutter/material.dart';

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset('images/logo.png'),
        ),
        actions: <Widget>[
          Image.asset(
            'images/diskon.png',
            scale: 3,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'images/gopay.png',
                      scale: 3,
                    ),
                    Text(
                      'Rp.37.000',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    HeaderItem(
                      images: 'images/pay.png',
                      title: 'Pay',
                    ),
                    HeaderItem(
                      images: 'images/promo.png',
                      title: 'Promo',
                    ),
                    HeaderItem(
                      images: 'images/topup.png',
                      title: 'Top Up',
                    ),
                    HeaderItem(
                      images: 'images/more.png',
                      title: 'More',
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: 'images/goride.png',
                    title: 'GoRide',
                    textcolor: Colors.grey[600],
                  ),
                ),
                HeaderItem(
                  images: 'images/gocar.png',
                  title: 'GoCar',
                  textcolor: Colors.grey[600],
                ),
                HeaderItem(
                  images: 'images/gofood.png',
                  title: 'GoFood',
                  textcolor: Colors.grey[600],
                ),
                HeaderItem(
                  images: 'images/gobluebird.png',
                  title: 'GoBlueBird',
                  textcolor: Colors.grey[600],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HeaderItem(
                  images: 'images/gosend.png',
                  title: 'GoSend',
                  textcolor: Colors.grey[600],
                ),
                HeaderItem(
                  images: 'images/godeals.png',
                  title: 'GoDeals',
                  textcolor: Colors.grey[600],
                ),
                HeaderItem(
                  images: 'images/gopulsa.png',
                  title: 'GoPulsa',
                  textcolor: Colors.grey[600],
                ),
                HeaderItem(
                  images: 'images/more-1.png',
                  title: 'MORE',
                  textcolor: Colors.grey[600],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/banner01.png'),
                      fit: BoxFit.cover),
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text('Be Worry'),
            ),
            Text(
                'Our new logo symbolizes Gojek’s transformation from being a ride-hailing service to becoming the largest Super App, with a variety of smart ways to eliminate hassles'),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                FlatButton(
                  color: Colors.green,
                  child: Text(
                    'I\'M IN',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HeaderItem extends StatelessWidget {
  const HeaderItem({Key key, this.images, this.title, this.textcolor})
      : super(key: key);
  final String images;
  final String title;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: <Widget>[
          Image.asset(
            images,
            scale: 3,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(color: textcolor ?? Colors.white),
          )
        ],
      ),
    );
  }
}
