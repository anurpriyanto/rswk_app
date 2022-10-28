import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rswk_app/getx/dokterController.dart';

class DokterPage extends StatefulWidget {
  @override
  State<DokterPage> createState() => _DokterPageState();
}

class _DokterPageState extends State<DokterPage> {
  // const RuanganPage({super.key});
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(
        Uri.parse(
            "http://36.94.12.210/onemedic_reservasi/index.php/api/jadwal_praktek/jadwal"),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        });
    print("result.body :::======> ${jsonEncode(result.body)}");
    return json.decode(result.body)['jadwal'];
  }

  final dokterController = Get.put(DokterController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dokterController.getDataJadwalDokter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jadwal Dokter",
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GetBuilder<DokterController>(builder: (c) {
        return Container(
          child: c.isLoadingJadwalDokter
              ? const CircularProgressIndicator()
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: c.listJadwal.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue[50],
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Image.asset(
                                'assets/exActWeek1.jpg',
                                width: 70,
                                height: 70,
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c.listJadwal[i].poliNama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: c.listJadwal[i].praktekDokter
                                        .map((e) => Column(
                                            children: [Text(e.dokterNama)]))
                                        .toList())
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  }),
        );
      }),
    );
  }

  Widget _jadwalDokterWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [Text("data")],
      ),
    );
  }
}
