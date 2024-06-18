import 'package:flutter/material.dart';

class NsNs extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp
            ), onPressed: () {
                Navigator.pop(context);
            }
            ),
        actions: [
          Text('nnn')
        ],
      ),
      backgroundColor: Colors.green,
    );
  }
}