import 'package:flutter/material.dart';

class SelectedCourseBackground extends CustomPainter {
  SelectedCourseBackground({required this.backgroundColor});
  Color backgroundColor;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.fill;
    paint.color = backgroundColor;
    final Offset center = Offset(size.width / 2, size.height / 6);

    path.addOval(Rect.fromCenter(center: center, width: 500, height: 500));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
