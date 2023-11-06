import 'dart:math';

import 'package:flutter/material.dart';
import 'package:real_estate/house_view.dart';

class HousesWidget extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < 3; i++)
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(8),
              height: 200,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HouseView(),
                                ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(HouseImage[i]),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red.shade300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    HouseName[i],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded),
                      Text(
                        Locations[i],
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 2),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
