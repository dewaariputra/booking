import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/rifqii.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Achmad Rifqi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Real Estate Agent',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('085959520187'),
                  ),
                  ListTile(
                    leading: Icon(Icons.facebook_outlined),
                    title: Text('ik.rifqi'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('ahmadrifqi636@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Tangerang, Indonesia'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
