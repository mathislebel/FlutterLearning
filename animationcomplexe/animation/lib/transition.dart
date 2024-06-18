// ScreenTransition.dart
import 'package:animation/screen1.dart';
import 'package:animation/screen2.dart';
import 'package:flutter/material.dart';

class ScreenTransition extends StatefulWidget {
  @override
  _ScreenTransitionState createState() => _ScreenTransitionState();
}

class _ScreenTransitionState extends State<ScreenTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToScreenB() {
    _controller.forward().then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ScreenB()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Transition'),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Opacity(
                opacity: 1.0 - _animation.value,
                child: ScreenA(),
              ),
              Opacity(
                opacity: _animation.value,
                child: ScreenB(),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToScreenB,
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
