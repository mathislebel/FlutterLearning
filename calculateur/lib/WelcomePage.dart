import 'package:calculateur/nsns.dart';
import 'package:flutter/material.dart';



class WelcomePage extends StatefulWidget {

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          Text('ntm')
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton(
                onPressed:(){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => NsNs(),));
                } , 
                child: Text(
                  'text',
                  style: TextStyle(color: Colors.white),
                  )
                ),
            )
          ],
        )
      )
        
    );
  }
}