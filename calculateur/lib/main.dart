import 'package:flutter/material.dart';
import 'WelcomePage.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'titre',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}