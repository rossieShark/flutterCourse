import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CirclesPainter extends CustomPainter {
  final double animationValue;

  CirclesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    double maxRadius = size.width / 8;
    int numberOfCircles = 8;
    double opacity = 0.1;
    List<Color> colors = [
      const Color.fromARGB(255, 75, 8, 3),
      const Color.fromARGB(255, 77, 36, 3),
      const Color.fromARGB(255, 88, 85, 5),
      const Color.fromARGB(255, 28, 76, 4),
      const Color.fromARGB(255, 4, 71, 85),
      const Color.fromARGB(255, 4, 2, 60),
      const Color.fromARGB(255, 67, 8, 70),
      const Color.fromARGB(255, 90, 2, 18),
    ];
    for (var i = 0; i < numberOfCircles; i++) {
      final double angle =
          (animationValue + (i / numberOfCircles)) * 2.0 * math.pi;

      final offset = Offset(
        center.dx + maxRadius * math.cos(angle),
        center.dy + maxRadius * math.sin(angle),
      );

      if (i > 0) {
        opacity = 1.0 / i;
        // String formattedNumber = opacity.toStringAsFixed(1);
        // double parsedNumber = double.parse(formattedNumber);
        // // Output: 3.1
      }
      final paint = Paint()..color = colors[i].withOpacity(opacity);
      canvas.drawCircle(offset, 5, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
