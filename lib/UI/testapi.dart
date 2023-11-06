import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:real_estate/models/real_estate.dart';
import 'package:real_estate/services/api.dart';

class APIPage extends StatefulWidget {
  const APIPage({super.key});

  @override
  State<APIPage> createState() => _APIPageState();
}

class _APIPageState extends State<APIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Latihan Api')),
      body: FutureBuilder<List<Get>>(
        //future: ApiStatic.getPackages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Get>? listget = snapshot.data;
            return Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: listget?.length,
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      children: [
                        Image.network(
                          "https://s3-media2.fl.yelpcdn.com/bphoto/rvoHSr8kDwah43wVXHqmnw/ls.jpg",
                          width: 100,
                        ),
                        // Text(listget[index].packageName)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
        future: null,
      ),
    );
  }
}
