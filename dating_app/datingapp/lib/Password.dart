import 'dart:ui';

import 'package:datingapp/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:datingapp/widget/delayAnimation.dart';


class MyPassword extends StatefulWidget {
  const MyPassword({super.key});

  @override
  State<MyPassword> createState() => _MyPasswordState();
}

class _MyPasswordState extends State<MyPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
        backgroundColor: Color(0xFFFFFAF8) ,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 0.9
                    ),
                  ),
                  Text(
                    'Please select a secure password. ',
                    style: TextStyle(
                      color: Colors.black,
                       fontSize: 13,
                       height: 1.3,
                       ),
                    ),
                  SizedBox(height: 20),
                TextField(
                 style: TextStyle(color: Colors.black),
                 decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), 
                  ),
                 ),
                ),
                SizedBox(height: 20),
                DelayedAnimation(
                  delay: 500,
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                ElevatedButton(
                  onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailsPage(),
                      ),
                    );
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xFFE94057),
                     padding: EdgeInsets.symmetric(horizontal: 50),
                     shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10)
                     ),
                      ),
                  child: Text(
                  'continue',
                  style: TextStyle(color: Colors.white),
                  ),
                ),
                    ]
                ),
                ),
            
              ],
              ),
            ),
      ),
    );
  }
}