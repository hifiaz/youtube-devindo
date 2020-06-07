import 'package:crud_sqlite/mvvm/app/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'models/home_view_model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.initial(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: ListView(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: model?.barang?.length ?? 0,
              itemBuilder: (BuildContext context, int i) => ListTile(
                  title: Text('${model.barang[i].barang}'),
                  subtitle: Text(model.barang[i].jumlah.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => model.delete(model.barang[i].id)),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => Navigator.of(context).pushNamed(
                            Routes.insertRoute,
                            arguments:
                                InsertArguments(barang: model.barang[i])),
                      )
                    ],
                  ),
                  onTap: () => Navigator.of(context).pushNamed(
                      Routes.detailRoute,
                      arguments: DetailArguments(id: model.barang[i].id))),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(Routes.insertRoute),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
