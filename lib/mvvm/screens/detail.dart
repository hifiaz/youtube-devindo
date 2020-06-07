import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'models/detail_view_model.dart';

class Detail extends StatelessWidget {
  final int id;

  const Detail({this.id});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
      onModelReady: (model) => model.initial(id),
      viewModelBuilder: () => DetailViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Detail Barang')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Id: ${model?.barang?.id ?? 'Loading...'}'),
                Text('Nama Barang:${model?.barang?.barang ?? 'Loading...'}'),
                Text('Jumlah ${model?.barang?.jumlah ?? 'Loading...'}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
