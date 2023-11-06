//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:real_estate/pages/products.dart';

class HouseView extends StatelessWidget {
  List<String> Locations = [
    "Ubud, Bali",
    "Ubud, Bali",
    "Kuta Utara, Bali",
    "Seminyak, Bali",
  ];
  List<String> HouseName = [
    "Summer House",
    "Villa Alfred",
    "Villa 4KT",
    "Villa Gaya Loteng",
  ];
  List<String> HouseImage = [
    "assets/h_2.png",
    "assets/h_3.png",
    "assets/h_4.png",
    "assets/h_5.png",
  ];

  final HouseTextStyle = TextStyle(fontSize: 20, color: Colors.black54);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.brown,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.shade300,
                          blurRadius: 5,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/h_2.png"),
                    ),
                  ),
                  Positioned(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Summer House",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Vila ini mencakup semua yang luar biasa tentang Ubud dalam satu tempat, desainnya yang sangat besar dan luas mendominasi vertikalitas strukturnya secara keseluruhan. Dengan 6 kamar tidur yang terletak di bagian rumah yang berbeda, vila ini berkembang menjadi terbuka lebar dan cocok untuk berkumpul bersama keluarga Anda.",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("14 guest", style: HouseTextStyle),
                  Text("6 bed", style: HouseTextStyle),
                  Text("6 bath", style: HouseTextStyle),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Kecamatan Ubud, Bali, Indonesia",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\Rp.16 Juta/",
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                          Text("Month"),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.95, -0.9),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(224, 48),
                              textStyle: TextStyle(fontSize: 16),
                              primary: Color(0xFF6C9EAA),
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(54))),
                          child: const Text('Book Now'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage()));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
