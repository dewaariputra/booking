import 'package:flutter/material.dart';
import 'package:real_estate/home_screen.dart';
import 'package:real_estate/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Real Estate",
      home: LoginScreen(),
    );
  }
}
