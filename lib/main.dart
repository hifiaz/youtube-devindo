import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigo,
      ),
      home: MyHomePage(title: 'Pemilu 2019'),
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
  final formarter = new NumberFormat('#,###');
  var date;
  var total = 0;
  var jokowi = 0;
  var prabowo = 0;
  var table;
  Future<Pemilu> fetchData() async {
    final url = 'https://pemilu2019.kpu.go.id/static/json/hhcw/ppwp.json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = Pemilu.fromJson(json.decode(response.body));
      print(data.progress.total);
      setState(() {
        date = data.ts;
        total = data.progress.total;
        jokowi = data.chart['21'];
        prabowo = data.chart['22'];
        table = data.table;
      });
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(formarter.format(total)),
                      subtitle: Text(date.toString()),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(
                        '01',
                        style: TextStyle(fontSize: 35.0),
                      ),
                      title: Text('Jokowi Ma ruf'),
                      subtitle: Text(formarter.format(jokowi)),
                    ),
                    ListTile(
                      leading: Text(
                        '02',
                        style: TextStyle(fontSize: 35.0),
                      ),
                      title: Text('Prabowo Sandi'),
                      subtitle: Text(formarter.format(prabowo)),
                    ),
                  ],
                ),
              ),
            ),
            new ItemWilayah(table: table, formarter: formarter)
          ],
        ));
  }
}

class ItemWilayah extends StatelessWidget {
  const ItemWilayah({
    Key key,
    @required this.table,
    @required this.formarter,
  }) : super(key: key);

  final table;
  final NumberFormat formarter;

  @override
  Widget build(BuildContext context) {
    return table == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: table.length,
            itemBuilder: (BuildContext c, int i) {
              String key = table.keys.elementAt(i);
              return ListTile(
                title: Text(
                  '$key',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                    '01: ${formarter.format(table[key]['21'])} 02: ${formarter.format(table[key]['22'])}',
                    style: TextStyle(color: Colors.white)),
                trailing: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              );
            },
          );
  }
}

class Pemilu {
  DateTime ts;
  Map<String, int> chart;
  Map<String, Map<String, int>> table;
  Progress progress;

  Pemilu({
    this.ts,
    this.chart,
    this.table,
    this.progress,
  });

  factory Pemilu.fromJson(Map<String, dynamic> json) => new Pemilu(
        ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
        chart: json["chart"] == null
            ? null
            : new Map.from(json["chart"])
                .map((k, v) => new MapEntry<String, int>(k, v)),
        table: json["table"] == null
            ? null
            : new Map.from(json["table"]).map((k, v) =>
                new MapEntry<String, Map<String, int>>(
                    k,
                    new Map.from(v)
                        .map((k, v) => new MapEntry<String, int>(k, v)))),
        progress: json["progress"] == null
            ? null
            : Progress.fromJson(json["progress"]),
      );

  Map<String, dynamic> toJson() => {
        "ts": ts == null ? null : ts.toIso8601String(),
        "chart": chart == null
            ? null
            : new Map.from(chart)
                .map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "table": table == null
            ? null
            : new Map.from(table).map((k, v) => new MapEntry<String, dynamic>(
                k,
                new Map.from(v)
                    .map((k, v) => new MapEntry<String, dynamic>(k, v)))),
        "progress": progress == null ? null : progress.toJson(),
      };
}

class Progress {
  int total;
  int proses;

  Progress({
    this.total,
    this.proses,
  });

  factory Progress.fromJson(Map<String, dynamic> json) => new Progress(
        total: json["total"] == null ? null : json["total"],
        proses: json["proses"] == null ? null : json["proses"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "proses": proses == null ? null : proses,
      };
}
