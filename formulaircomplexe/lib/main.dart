import 'package:flutter/material.dart';
import 'package:formulaircomplexe/form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdvancedForm(),
    );
  }
}
