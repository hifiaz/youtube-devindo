import 'dart:io';

import 'package:crud_sqlite/mvvm/utils/models/barang.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database _database;

  Future<Database> initDb() async {
    print('init');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'barang.db';

    var barangDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    print(barangDatabase);

    return barangDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE barang (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      barang TEXT,
      jumlah INTEGER
    )
    ''');
    print("Database was created!");
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  // create database
  Future<int> insert(Barang object) async {
    print(object.toMap());
    Database db = await this.database;
    int count = await db.insert('barang', object.toMap());
    return count;
  }

  //update databases
  Future<int> update(Barang object) async {
    Database db = await this.database;
    int count = await db.update('barang', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('barang', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Barang>> getBarangList() async {
    Database db = await this.database;
    List<Map<String, dynamic>> mapList =
        await db.query('barang', orderBy: 'barang');
    int count = mapList.length;
    List<Barang> contactList = List<Barang>();
    for (int i = 0; i < count; i++) {
      contactList.add(Barang.fromMap(mapList[i]));
    }
    return contactList;
  }

  Future<Barang> getBarang(int id) async {
    Database db = await this.database;
    Future<List<Map<String, dynamic>>> count =
        db.query('barang', where: 'id=?', whereArgs: [id]);
    var data = await count;
    if (data.length != 0) {
      return Barang.fromMap(data.first);
    }
    return null;
  }
}
