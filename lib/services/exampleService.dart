import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rswk_app/models/apiResponse.dart';
import 'package:rswk_app/models/cek.dart';

class ExampleService {
  Future<ApiResponse> submitAPI(String nama, String tglLahir) async {
    ApiResponse apiResponse = ApiResponse(
        httpStatus: "0", nama: "", tglLahir: "", id: "", createdAt: "");
    try {
      var uriStr = 'https://reqres.in/api/users/2';

      Map<String, String> params = {};
      params['nama'] = nama;
      params['tgl_lahir'] = tglLahir;

      var body = jsonEncode(params);

      print("body params :: ${body}");

      var response = await http.post(Uri.parse(uriStr),
          headers: {"Content-Type": "application/json"}, body: body);

      print("body statusCode :: ${response.statusCode == 201}");

      if (response.statusCode == 201) {
        print("MASUK SINI...");
        apiResponse = apiResponseFromJson(response.body);
        apiResponse.httpStatus = "200";
      } else {
        apiResponse = apiResponseFromJson(response.body);
        apiResponse.httpStatus = "400";
      }
    } catch (e) {
      print("e.toString() :: ${e.toString()}");
      apiResponse = ApiResponse(
          httpStatus: "500", nama: "", tglLahir: "", id: "", createdAt: "");
    }
    print("apiResponse ::: ${jsonEncode(apiResponse)}");
    return apiResponse;
  }

  Future<Cek> submitAPI2(String noMr, String tglLahir) async {
    Cek apiResponse = Cek(
        httpStatus: "0",
        nama: "",
        noMr: "",
        tempatLahir: "",
        tanggalLahir: "",
        jenisKelamin: "",
        alamat: "",
        telepon: "",
        email: "",
        noAsuransi: "",
        check: 0,
        status: true,
        message: "");
    try {
      var uriStr =
          'http://36.94.12.210/onemedic_reservasi/index.php/api/pasien/get';

      Map<String, String> params = {};
      params['mr'] = "00362166";
      params['tgllahir'] = "09-09-2019";

      var body = jsonEncode(params);

      print("body params :: ${body}");

      var response = await http.post(Uri.parse(uriStr),
          headers: {"Content-Type": "application/json"}, body: body);

      print("body statusCode :: ${response.statusCode == 201}");

      if (response.statusCode == 201) {
        print("MASUK SINI...");
        apiResponse = cekFromJson(response.body);
        apiResponse.httpStatus = "200";
      } else {
        apiResponse = cekFromJson(response.body);
        apiResponse.httpStatus = "400";
      }
    } catch (e) {
      print("e.toString() :: ${e.toString()}");
      apiResponse = Cek(
          httpStatus: "500",
          nama: "",
          noMr: "",
          tempatLahir: "",
          tanggalLahir: "",
          jenisKelamin: "",
          alamat: "",
          telepon: "",
          email: "",
          noAsuransi: "",
          check: 0,
          status: true,
          message: "");
    }
    print("apiResponse ::: ${jsonEncode(apiResponse)}");
    return apiResponse;
  }
}
