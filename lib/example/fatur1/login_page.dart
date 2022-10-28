import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rswk_app/example/fatur1/history.dart';
import 'package:rswk_app/example/fatur1/historyService.dart';
// import 'package:rswk_mobile/pages/form_page2.dart';
import 'daftar_page.dart';
import 'package:intl/intl.dart';
// import 'package:rswk_mobile/services/cekService.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // GkiApi gkiAPi = GkiApi();
  final HistoryService _exampleService = HistoryService();
  TextEditingController namaController = TextEditingController();
  TextEditingController tglController = TextEditingController();

  bool _isLoading = false;
  String _namaResponse = "";
  String _tglResponse = "";
  String _nmResponse = "";
  String _nmrResponse = "";
  String _jkResponse = "";
  String _alamatResponse = "";
  String _tipeResponse = "";
  String _nkResponse = "";
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form Pendaftaran",
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
                  child: Image.asset('assets/logo.png'),
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
                                  // _nmResponse = value.nama;
                                  // _tglResponse = value.tanggalLahir;
                                  // _jkResponse = value.jenisKelamin;
                                  // _alamatResponse = value.alamat;
                                  // _nmrResponse = value.telepon;
                                  // _nkResponse = value.noAsuransi;
                                  _isLoading = false;
                                }),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DaftarPage(cek: null),
                                    ))
                              });
                    },
                    // async {
                    //   setState(() {
                    //     _isLoading = true;
                    //   });
                    //   _exampleService
                    //       .submitAPI(namaController.text, tglController.text)
                    //       .then((value) => {
                    //             setState(() {
                    //               _namaResponse = value.noMr;
                    //               _nmResponse = value.nama;
                    //               _tglResponse = value.tanggalLahir;
                    //               _jkResponse = value.jenisKelamin;
                    //               _alamatResponse = value.alamat;
                    //               _nmrResponse = value.telepon;
                    //               _nkResponse = value.noAsuransi;
                    //               _isLoading = false;
                    //             })
                    //           });
                    // }
                    child: _isLoading ? _loading() : const Text('Cek Data'),
                  )),
              const SizedBox(
                height: 20,
              ),
              _namaResponse == ""
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.blue[100],
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            const Center(
                              child: Text(
                                "Response",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "No MR",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(_namaResponse),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Nama",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(_nmResponse),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Tgl Lahir",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(_tglResponse),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Jenis Kelamin",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(_jkResponse),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Alamat",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(_alamatResponse),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "No Telepon",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(_nmrResponse),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "No Kartu",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(_nkResponse),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
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
