import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Define the first shape
    paint.color = Color(0xFFF5E6FF); // Light purple color
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.35, size.width * 0.6, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.4, size.height * 0.05, 0, size.height * 0.1);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);

    // Define the second shape
    paint.color = Color(0xFF9B6A97); // Darker purple color
    path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.65,
        size.width * 0.4, size.height * 0.85);
    path.quadraticBezierTo(
        size.width * 0.6, size.height, size.width, size.height * 0.9);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
