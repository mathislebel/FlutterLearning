// ScreenB.dart
import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen B')),
      body: Center(
        child: Text(
          'Welcome to Screen B',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
