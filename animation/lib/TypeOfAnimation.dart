import 'package:animation/implicit-animation1.dart';
import 'package:flutter/material.dart';


class TypeOfAnimation extends StatefulWidget {
  const TypeOfAnimation({super.key});

  @override
  State<TypeOfAnimation> createState() => _TypeOfAnimationState();
}

class _TypeOfAnimationState extends State<TypeOfAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center(
        child: ElevatedButton(
          onPressed:() {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => BuiltinAnimation()));
          }, child: 
          Text(
            'implicit'
          ),
        ),
      ),
    );
  }
}