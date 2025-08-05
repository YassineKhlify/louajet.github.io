import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  Color color;
  TrianglePainter({required this.color});
  @override

  void paint(Canvas canvas, Size size) {

    // Define the paint style
    var paint = Paint()
      ..color = color
    // Triangle color
      ..style = PaintingStyle.fill; // Fill the shape

    // Define the points of the triangle
    var path = Path();
    path.moveTo(size.width / 2, 0); // Top vertex
    path.lineTo(0, size.height);    // Bottom-left vertex
    path.lineTo(size.width, size.height); // Bottom-right vertex
    path.close(); // Complete the triangle

    // Draw the triangle
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless the design changes
  }
}