// ScreenA.dart
import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen A')),
      body: Center(
        child: Text(
          'Welcome to Screen A',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
