import 'package:flutter/material.dart';

class testPage1 extends StatefulWidget {
  const testPage1({Key? key}) : super(key: key);

  @override
  State<testPage1> createState() => _testPage1State();
}

class _testPage1State extends State<testPage1> {
  String selectedType = "bersih";
  String selectedFrequency = "monthly";
  List<Widget> listWidget = [];

  void onChangePaketType(String type) {
    selectedType = type;
    setState(() {});
  }

  void changeFrequency(String frequency) {
    selectedFrequency = frequency;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    listWidget.add(sliderContent());
    listWidget.add(sliderContent());
    listWidget.add(sliderContent());
    listWidget.add(sliderContent());
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "RSWK Mobile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Dokter",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: listWidget,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Informasi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                extraWidget("es", "Kunjungan", false),
                extraWidget("belanja", "R. Perawatan", false),
                extraWidget("tirai", "Dokter", false),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                extraWidget("teras", "Layanan", false),
                extraWidget("belanja", "Berita", false),
                extraWidget("tirai", "Profil RST", false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sliderContent() {
    return InkWell(
      onTap: () {
        onChangePaketType("mengkilap");
      },
      child: Column(
        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
              color: Colors.purpleAccent, //Color(0xffdfdeff),
              image: const DecorationImage(
                image: AssetImage('assets/exActWeek2.jpg'),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Column extraWidget(String img, String name, bool isSelected) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Container(
                margin: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/exActWeek3.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: isSelected == true
                  ? Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.pink,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
