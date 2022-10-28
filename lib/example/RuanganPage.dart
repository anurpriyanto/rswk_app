import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RuanganPage extends StatelessWidget {
  // const RuanganPage({super.key});
  final String apiUrl =
      "http://36.94.12.210/onemedic_rswk/rating_api/ruangan.php";

  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(
        Uri.parse("http://36.94.12.210/onemedic_rswk/rating_api/ruangan.php"));
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ruang Perawatan",
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
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 48.0,
                        child: Image.asset('assets/exActWeek1.jpg'),
                      ),
                      title: Text(snapshot.data[index]['bangsal']),
                      subtitle: Text("Jumlah Ruangan : " +
                          snapshot.data[index]['jumlah_ruangan']),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
