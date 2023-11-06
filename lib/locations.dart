import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/UI/datapost.dart';
import 'package:real_estate/houses_widget.dart';
import 'package:real_estate/massage.dart';
import 'package:real_estate/pages/products.dart';
import 'package:real_estate/profile_page.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  List<String> PropertyType = [
    "Home",
    "Flat",
    "Apartment",
    "Hotel",
  ];
  List<Icon> PropertyIcons = [
    Icon(Icons.house_rounded, size: 40, color: Colors.lightBlue.shade400),
    Icon(Icons.business_outlined, size: 40, color: Colors.blue.shade900),
    Icon(Icons.apartment, size: 40, color: Colors.green),
    Icon(Icons.home_work_outlined, size: 40, color: Colors.teal),
  ];

  List<String> filteredPropertyType = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPropertyType.addAll(PropertyType);
  }

  void filterSearchResults(String query) {
    List<String> searchList = [];
    searchList.addAll(PropertyType);

    if (query.isNotEmpty) {
      List<String> filteredList = [];
      searchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(item);
        }
      });
      setState(() {
        filteredPropertyType.clear();
        filteredPropertyType.addAll(filteredList);
      });
      return;
    } else {
      setState(() {
        filteredPropertyType.clear();
        filteredPropertyType.addAll(PropertyType);
      });
    }
  }

  void navigateToAllProperties() {
    // Navigasi ke halaman "See All" atau halaman yang menampilkan semua properti
    // Sesuaikan dengan halaman yang sesuai di aplikasi Anda
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllPropertiesPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F6FB),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue.shade700,
                          ),
                          Text(
                            "Bali, ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Indonesia",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications_active,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: searchController,
                  onChanged: filterSearchResults,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    label: Text("Search"),
                    suffixIcon: Container(
                      margin: EdgeInsets.all(7),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.filter_list_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Find Properties",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: filteredPropertyType.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.9,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(7),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PropertyIcons[index],
                            SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filteredPropertyType[index],
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "150 Items",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearby to you",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextButton(
                    onPressed: navigateToAllProperties, // Fungsi untuk See All
                    child: Text("See All"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              HousesWidget(),
            ],
          ),
        ),
        bottomNavigationBar: CircleNavBar(
          onTap: (index) {
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(),
                ),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataPosts(),
                ),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
            } else if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            }
          },
          height: 60,
          circleWidth: 50,
          activeIndex: 2,
          circleColor: Colors.indigo,
          color: Colors.white,
          activeIcons: [
            Icon(Icons.location_city_rounded, color: Colors.black54),
            Icon(Icons.compass_calibration, color: Colors.black54),
            Icon(Icons.bookmark, color: Colors.white),
            Icon(Icons.mail, color: Colors.black54),
            Icon(Icons.person, color: Colors.black54),
          ],
          inactiveIcons: [
            Icon(Icons.location_city_rounded, color: Colors.black54),
            Icon(Icons.compass_calibration, color: Colors.black54),
            Icon(Icons.bookmark, color: Colors.blueAccent),
            Icon(Icons.mail, color: Colors.black54),
            Icon(Icons.person, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}

class AllPropertiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Properties'),
      ),
      body: Center(
        child: Text('All Properties Page'),
      ),
    );
  }
}
