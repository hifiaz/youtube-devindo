import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Image Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImage(ImageSource src) async {
    var image = await ImagePicker.pickImage(source: src);

    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: () {
                      // getImage();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                                title: Text("Pick Camera/Gallery"),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      getImage(ImageSource.gallery);
                                    },
                                    child: const Text('Pick From Gallery'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      getImage(ImageSource.camera);
                                    },
                                    child: const Text('Take A New Picture'),
                                  ),
                                ]);
                          });
                    },
                  )
                : Image.file(_image)
          ],
        ),
      ),
    );
  }
}
