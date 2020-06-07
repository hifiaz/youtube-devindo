// To parse this JSON data, do
//
//     final barang = barangFromMap(jsonString);

import 'dart:convert';

Barang barangFromMap(String str) => Barang.fromMap(json.decode(str));

String barangToMap(Barang data) => json.encode(data.toMap());

class Barang {
    Barang({
        this.id,
        this.barang,
        this.jumlah,
    });

    int id;
    String barang;
    int jumlah;

    factory Barang.fromMap(Map<String, dynamic> json) => Barang(
        id: json["id"] == null ? null : json["id"],
        barang: json["barang"] == null ? null : json["barang"],
        jumlah: json["jumlah"] == null ? null : json["jumlah"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "barang": barang == null ? null : barang,
        "jumlah": jumlah == null ? null : jumlah,
    };
}
