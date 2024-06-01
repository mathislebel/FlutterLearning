import 'package:datingapp/MyEmail.dart';
import 'package:datingapp/Profile.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff101010),
      ),
      body: Center(child: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => MyEmail()
            ),
          );
        }, 
        child: Text('suivant'),),),
    );
  }
}