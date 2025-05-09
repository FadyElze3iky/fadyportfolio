import 'dart:ui';
import 'package:flutter/material.dart';

class HomeBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Blue blob
    final bluePaint = Paint()
      ..color = const Color.fromARGB(171, 63, 100, 233); // 43% opacity
    canvas.drawCircle(
        Offset(size.width * 0.2, size.height * 0.2), 180, bluePaint);

    // Red blob
    final redPaint = Paint()..color = const Color(0xFFE40037); // 100% opacity
    canvas.drawCircle(
        Offset(size.width * 0.8, size.height * 0.18), 100, redPaint);

    // Light red blob
    final lightRedPaint = Paint()
      ..color = const Color(0x6EE93F3F); // 43% opacity
    canvas.drawCircle(
        Offset(size.width * 0.7, size.height * 0.5), 120, lightRedPaint);

    // Yellow blob
    final yellowPaint = Paint()
      ..color = const Color.fromARGB(227, 5, 168, 73); // 43% opacity
    canvas.drawCircle(
        Offset(size.width * 0.3, size.height * 0.7), 100, yellowPaint);

    // Dark background overlay
    final darkPaint = Paint()
      ..color = const Color.fromARGB(159, 255, 11, 11); // 30% opacity
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), darkPaint);

    // Cyan blob
    final cyanPaint = Paint()
      ..color = const Color.fromARGB(249, 255, 183, 0); // 100% opacity
    canvas.drawCircle(
        Offset(size.width * 0.9, size.height * 0.85), 80, cyanPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BlurredBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ImageFiltered(
        imageFilter:
            ImageFilter.blur(sigmaX: 150, sigmaY: 150), // Adjust blur as needed
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width * .45, 100),
          painter: HomeBackgroundPainter(),
        ),
      ),
    );
  }
}
