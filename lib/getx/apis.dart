import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rswk_app/getx/constants.dart';
import 'package:rswk_app/models/jadwalModel.dart';

class ApiCollection {
  Future<List<JadwalElement>> getJadwalDokter() async {
    List<JadwalElement> datas = List.empty(growable: true);

    var uriStr = apiBaseUrl + '/jadwal_praktek/jadwal';
    var response = await http.get(Uri.parse(uriStr));

    if (response.statusCode == 200 || response.statusCode == 201) {
      Jadwal jadwalResponse = Jadwal.fromJson(jsonDecode(response.body));
      List<JadwalElement> datas = jadwalResponse.jadwal;
      return datas;
    } else {
      return datas;
    }
  }
}
