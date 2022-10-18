import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:rswk_app/services/exampleService.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // GkiApi gkiAPi = GkiApi();
  final ExampleService _exampleService = ExampleService();
  TextEditingController namaController = TextEditingController();
  TextEditingController tglController = TextEditingController();

  bool _isLoading = false;
  String _namaResponse = "";
  String _tglResponse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing Form"),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
              child: TextFormField(
                controller: namaController,
                decoration: const InputDecoration(hintText: "Nama"),
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
                                _namaResponse = value.nama;
                                _tglResponse = value.tglLahir;
                                _isLoading = false;
                              })
                            });
                  },
                  child: _isLoading ? _loading() : const Text('Submit'),
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
                                "Nama",
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
                                "Tgl Lahir",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(_tglResponse),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
          ],
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
