// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    this.httpStatus,
    required this.nama,
    required this.tglLahir,
    required this.id,
    required this.createdAt,
  });

  String? httpStatus;
  String nama;
  String tglLahir;
  String id;
  String createdAt;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        httpStatus: "",
        nama: json["nama"],
        tglLahir: json["tgl_lahir"],
        id: json["id"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "nama": nama,
        "tgl_lahir": tglLahir,
        "id": id,
        "createdAt": createdAt,
      };
}
