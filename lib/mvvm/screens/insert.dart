import 'package:crud_sqlite/mvvm/utils/models/barang.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'models/insert_view_model.dart';

class Insert extends StatelessWidget {
  final Barang barang;

  const Insert({this.barang});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InsertViewModel>.reactive(
      onModelReady: (model) {
        if (barang != null) {
          model.inisial(barang.id, barang.barang, barang.jumlah);
        }
      },
      viewModelBuilder: () => InsertViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(barang == null ? 'Insert' : 'Update'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: model.barang,
                onChanged: (val) => model.setBarang(val),
                decoration: InputDecoration(
                  labelText: 'Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              DropdownButton(
                  isExpanded: true,
                  value: model.jumlah,
                  items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                      .map(
                        (val) => DropdownMenuItem(
                          child: Text(val.toString()),
                          value: val,
                        ),
                      )
                      .toList(),
                  onChanged: (val) => model.setJumlah(val)),
              FlatButton(
                onPressed: () {
                  barang == null ? model.setInsert() : model.setUpdate();
                },
                child: Text('${barang == null ? 'Insert' : 'Update'} Barang'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
