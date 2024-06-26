import 'dart:ui';

import 'package:datingapp/Password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:datingapp/widget/delayAnimation.dart';


class MyEmail extends StatefulWidget {
  const MyEmail({super.key});

  @override
  State<MyEmail> createState() => _MyEmailState();
}

class _MyEmailState extends State<MyEmail> {
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
                  'My Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 0.9
                    ),
                  ),
                  Text(
                    'Please enter your valid email. We will send you a 4-digit code to verify your account. ',
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
                  hintText: 'Email',
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
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => MyPassword(),
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