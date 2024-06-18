import 'package:flutter/material.dart';
import 'package:flutter_application_5/WelcomePage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "train",
      home: WelcomePage(),
    );
  }
}