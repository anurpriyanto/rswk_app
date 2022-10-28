// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:rswk_app/example/fatur1/history.dart';
import 'package:rswk_app/example/fatur1/historyService.dart';

class RiwayatPage extends StatefulWidget {
  // const RiwayatPage({super.key});
  const RiwayatPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final HistoryService _exampleService = HistoryService();
  TextEditingController namaController = TextEditingController();
  TextEditingController tglController = TextEditingController();

  List<HistoryElement> historyArray = List.empty(growable: true);

  bool _isLoading = false;
  String _namaResponse = "";
  String _tglResponse = "";
  String _nmResponse = "";
  String _nmrResponse = "";
  String _jkResponse = "";
  String _alamatResponse = "";
  String _tipeResponse = "";
  String _nkResponse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat Kunjungan",
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
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48.0,
                  child: Image.asset('assets/exActWeek1.jpg'),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(hintText: "No MR"),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: TextFormField(
                    controller: tglController,
                    decoration: const InputDecoration(hintText: "Tgl Lahir"),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        setState(() {
                          tglController.text = formattedDate;
                        });
                      }
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent, //background color of button
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(
                            20) //content padding inside button
                        ),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      _exampleService
                          .submitAPI(namaController.text, tglController.text)
                          .then((value) => {
                                setState(() {
                                  _namaResponse = value.noMr;
                                  // _nmResponse = value.history[0].nama;
                                  // _tglResponse = value.tanggalLahir;
                                  // _jkResponse = value.jenisKelamin;
                                  // _alamatResponse = value.alamat;
                                  // _nmrResponse = value.telepon;
                                  // _nkResponse = value.noAsuransi;
                                  historyArray = value.history;
                                  _isLoading = false;
                                })
                              });
                    },
                    child: _isLoading ? _loading() : const Text('Cek Data'),
                  )),
              const SizedBox(
                height: 20,
              ),
              _namaResponse == ""
                  ? const SizedBox()
                  : SizedBox(
                      child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              const Text('Log Data'),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: historyArray.length,
                                  itemBuilder: (context, index) {
                                    return _cardLogData(
                                        historyArray[index].poliNama,
                                        historyArray[index].dokterNama,
                                        historyArray[index]
                                            .tanggalKunjungan
                                            .toString(),
                                        historyArray[index].jamKunjungan);
                                  })
                            ],
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardLogData(String namaPoli, String namaDoktr, String tglKunjugan,
      String jmKnjungan) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.blue[100],
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(children: [
          Row(
            children: [
              const Text(
                "Nama poli",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(namaPoli),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Nama Dokter",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(namaDoktr),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Tgl Kunjungan",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(tglKunjugan),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Jam Kunjungan",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(jmKnjungan),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }

  Widget _loading() {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
        backgroundColor: Color(0xff55BAC7),
        color: Color(0xff55BAC7),
        strokeWidth: 3,
      ),
    );
  }
}
