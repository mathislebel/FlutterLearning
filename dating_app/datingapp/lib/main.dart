import 'package:datingapp/WelcomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp (DatingApp());
}

class DatingApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

