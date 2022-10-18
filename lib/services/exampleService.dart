import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rswk_app/models/apiResponse.dart';

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
}
