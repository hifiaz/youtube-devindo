import 'package:flutter/material.dart';
import 'package:location_device/mvvm/screens/model/home_model.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  final lat = TextEditingController();
  final long = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: <Widget>[
              Text(
                'Location',
              ),
              if (model.latLong != null) Text(model.latLong),
              RaisedButton(
                onPressed: () => model.getLocation(),
                child: Text('Get Long Lat'),
              ),
              TextFormField(
                onFieldSubmitted: (val) => model.searchLocation(val),
                decoration: InputDecoration(hintText: 'Type your location'),
              ),
              if (model.getSearchLocation != null)
                Text(model.getSearchLocation),
              // 1.3122389,103.8473983
              TextFormField(
                controller: lat,
                decoration: InputDecoration(hintText: 'Lat'),
              ),
              TextFormField(
                controller: long,
                decoration: InputDecoration(hintText: 'Long'),
              ),
              RaisedButton(
                onPressed: () => model.setNameLocation(lat.text, long.text),
                child: Text('Get Name'),
              ),
              if (model.getNameLocation != null)
                Text(model.getNameLocation),
            ],
          ),
        ),
      ),
    );
  }
}
