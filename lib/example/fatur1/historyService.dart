import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rswk_app/example/fatur1/history.dart';

class HistoryService {
  Future<History> submitAPI(String nama, String tglLahir) async {
    History apiResponse = History(
        httpStatus: "0",
        noMr: "",
        tglLahir: "",
        history: List.empty(),
        status: true,
        message: "");
    try {
      var uriStr =
          'http://36.94.12.210/onemedic_reservasi/index.php/api/reservasi/get_log';

      Map<String, String> params = {};
      params['no_mr'] = "00362166";
      params['tgl_lahir'] = "09-09-2019";

      var body = jsonEncode(params);

      print("body params :: ${body}");

      var response = await http.post(Uri.parse(uriStr),
          headers: {"Content-Type": "application/json"}, body: body);

      print("body statusCode :: ${response.statusCode}");

      if (response.statusCode == 201) {
        print("MASUK SINI...");
        apiResponse = historyFromJson(response.body);
        apiResponse.httpStatus = "200";
      } else {
        apiResponse = historyFromJson(response.body);
        apiResponse.httpStatus = "400";
      }
    } catch (e) {
      print("e.toString() :: ${e.toString()}");
      apiResponse = History(
          httpStatus: "500",
          noMr: "",
          tglLahir: "",
          history: List.empty(),
          status: true,
          message: "");
    }
    print("apiResponse ::: ${jsonEncode(apiResponse)}");
    return apiResponse;
  }
}
