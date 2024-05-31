import 'package:dating_app/WelcomePage.dart';
import 'package:flutter/material.dart';


class DatingApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      title: 'DatingApp',
    );
  }
}