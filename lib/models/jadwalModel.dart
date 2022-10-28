// To parse this JSON data, do
//
//     final jadwal = jadwalFromJson(jsonString);

import 'dart:convert';

Jadwal jadwalFromJson(String str) => Jadwal.fromJson(json.decode(str));

String jadwalToJson(Jadwal data) => json.encode(data.toJson());

class Jadwal {
  Jadwal({
    required this.jadwal,
    required this.status,
    required this.message,
  });

  List<JadwalElement> jadwal;
  bool status;
  String message;

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        jadwal: List<JadwalElement>.from(
            json["jadwal"].map((x) => JadwalElement.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "jadwal": List<dynamic>.from(jadwal.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class JadwalElement {
  JadwalElement({
    required this.poliId,
    required this.poliNama,
    required this.praktekDokter,
  });

  String poliId;
  String poliNama;
  List<PraktekDokter> praktekDokter;

  factory JadwalElement.fromJson(Map<String, dynamic> json) => JadwalElement(
        poliId: json["poli_id"],
        poliNama: json["poli_nama"],
        praktekDokter: List<PraktekDokter>.from(
            json["praktek_dokter"].map((x) => PraktekDokter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "poli_id": poliId,
        "poli_nama": poliNama,
        "praktek_dokter":
            List<dynamic>.from(praktekDokter.map((x) => x.toJson())),
      };
}

class PraktekDokter {
  PraktekDokter({
    required this.dokterNama,
    required this.hari1,
    required this.hari2,
    required this.hari3,
    required this.hari4,
    required this.hari5,
    required this.hari6,
    required this.hari7,
  });

  String dokterNama;
  String hari1;
  String hari2;
  String hari3;
  String hari4;
  String hari5;
  String hari6;
  String hari7;

  factory PraktekDokter.fromJson(Map<String, dynamic> json) => PraktekDokter(
        dokterNama: json["dokter_nama"],
        hari1: json["hari_1"] == null ? "" : json["hari_1"],
        hari2: json["hari_2"] == null ? "" : json["hari_2"],
        hari3: json["hari_3"] == null ? "" : json["hari_3"],
        hari4: json["hari_4"] == null ? "" : json["hari_4"],
        hari5: json["hari_5"] == null ? "" : json["hari_5"],
        hari6: json["hari_6"] == null ? "" : json["hari_6"],
        hari7: json["hari_7"] == null ? "" : json["hari_7"],
      );

  Map<String, dynamic> toJson() => {
        "dokter_nama": dokterNama,
        "hari_1": hari1 == null ? "" : hari1,
        "hari_2": hari2 == null ? "" : hari2,
        "hari_3": hari3 == null ? "" : hari3,
        "hari_4": hari4 == null ? "" : hari4,
        "hari_5": hari5 == null ? "" : hari5,
        "hari_6": hari6 == null ? "" : hari6,
        "hari_7": hari7 == null ? "" : hari7,
      };
}
