// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'dart:convert';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
  History({
    this.httpStatus,
    required this.noMr,
    required this.tglLahir,
    required this.history,
    required this.status,
    required this.message,
  });

  String? httpStatus;
  String noMr;
  String tglLahir;
  List<HistoryElement> history;
  bool status;
  String message;

  factory History.fromJson(Map<String, dynamic> json) => History(
        noMr: json["no_mr"],
        tglLahir: json["tgl_lahir"],
        history: List<HistoryElement>.from(
            json["history"].map((x) => HistoryElement.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "no_mr": noMr,
        "tgl_lahir": tglLahir,
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class HistoryElement {
  HistoryElement({
    required this.tanggalKunjungan,
    required this.jamKunjungan,
    required this.poliNama,
    required this.dokterNama,
    required this.kode,
  });

  DateTime tanggalKunjungan;
  String jamKunjungan;
  String poliNama;
  String dokterNama;
  String kode;

  factory HistoryElement.fromJson(Map<String, dynamic> json) => HistoryElement(
        tanggalKunjungan: DateTime.parse(json["tanggal_kunjungan"]),
        jamKunjungan: json["jam_kunjungan"],
        poliNama: json["poli_nama"],
        dokterNama: json["dokter_nama"],
        kode: json["kode"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal_kunjungan":
            "${tanggalKunjungan.year.toString().padLeft(4, '0')}-${tanggalKunjungan.month.toString().padLeft(2, '0')}-${tanggalKunjungan.day.toString().padLeft(2, '0')}",
        "jam_kunjungan": jamKunjungan,
        "poli_nama": poliNama,
        "dokter_nama": dokterNama,
        "kode": kode,
      };
}
