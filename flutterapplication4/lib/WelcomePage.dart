import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_5/LoginPage.dart';
import 'package:flutter_application_5/widget/color.dart';
import 'package:flutter_application_5/widget/custom.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_5/widget/DelayAnimation.dart'; // Import the custom painter

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: BackgroundPainter(),
            child: Container(), 
          ),
          Column(
            children: [
              SizedBox(height:  200),
              Align(
                alignment: Alignment.center,
                child: DelayedAnimation(
                  delay: 1000,
                  child: Image(
                    image: AssetImage("images/logo.png"),
                    width: 200, 
                    height: 200, 
                  ),
                ),
              ),
              SizedBox(height: 10),
              DelayedAnimation(
                delay: 1500,
                child: Text(
                  "Welcome to",
                  style: GoogleFonts.roboto(
                    color: purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    height: 0.9,
                  ),
                ),
              ),
              SizedBox(height: 5),
              DelayedAnimation(
                delay: 2000, // Reduce space between texts
             child:  Text(
                "Meditation",
                style: GoogleFonts.roboto(
                  color: purple,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  height: 0.9,
                ),
             ),
              ),
               SizedBox(height: 20),
              DelayedAnimation(
                delay: 2500, 
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => LoginPage()
                    ),
                    );
                  }, 
                  child: Text("Login"),
                  ),
                  ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
