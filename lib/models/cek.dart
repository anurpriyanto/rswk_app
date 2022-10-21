// To parse this JSON data, do
//
//     final cek = cekFromJson(jsonString);

import 'dart:convert';

Cek cekFromJson(String str) => Cek.fromJson(json.decode(str));

String cekToJson(Cek data) => json.encode(data.toJson());

class Cek {
  Cek({
    this.httpStatus,
    required this.noMr,
    required this.nama,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.alamat,
    required this.telepon,
    required this.email,
    required this.noAsuransi,
    required this.check,
    required this.status,
    required this.message,
  });

  String? httpStatus;
  String noMr;
  String nama;
  String tempatLahir;
  String tanggalLahir;
  String jenisKelamin;
  String alamat;
  String telepon;
  String email;
  String noAsuransi;
  int check;
  bool status;
  String message;

  factory Cek.fromJson(Map<String, dynamic> json) => Cek(
        httpStatus: "",
        noMr: json["no_mr"],
        nama: json["nama"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
        jenisKelamin: json["jenis_kelamin"],
        alamat: json["alamat"],
        telepon: json["telepon"],
        email: json["email"],
        noAsuransi: json["no_asuransi"],
        check: json["check"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "no_mr": noMr,
        "nama": nama,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
        "jenis_kelamin": jenisKelamin,
        "alamat": alamat,
        "telepon": telepon,
        "email": email,
        "no_asuransi": noAsuransi,
        "check": check,
        "status": status,
        "message": message,
      };
}
