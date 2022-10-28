// ignore_for_file: file_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:rswk_app/getx/apis.dart';
import 'package:rswk_app/models/jadwalModel.dart';

class DokterController extends GetxController {
  ApiCollection apiCollection = ApiCollection();

  bool _isLoadingJadwalDokter = false;
  List<JadwalElement> _listJadwal = List.empty(growable: true);

  void getDataJadwalDokter() async {
    _isLoadingJadwalDokter = true;
    await Future.delayed(const Duration(seconds: 1));

    List<JadwalElement> response = await apiCollection.getJadwalDokter();
    if (response.isNotEmpty) {
      _listJadwal = response;
    }
    _isLoadingJadwalDokter = false;
    update();
  }

  List<JadwalElement> get listJadwal => _listJadwal;
  bool get isLoadingJadwalDokter => _isLoadingJadwalDokter;
}
