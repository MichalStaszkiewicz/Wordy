import 'dart:math';

import 'package:flutter/material.dart';

class CircularPercentageChart extends StatelessWidget {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final TextStyle textStyle;
  final Widget? optionalWidget;

  CircularPercentageChart(
      {required this.progress,
      this.progressColor = Colors.blue,
      this.backgroundColor = Colors.grey,
      this.strokeWidth = 10.0,
      required this.textStyle,
      required this.optionalWidget});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircularPercentageChartPainter(
        progress: progress,
        progressColor: progressColor,
        backgroundColor: backgroundColor,
        strokeWidth: strokeWidth,
        textStyle: textStyle,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${progress.toInt()}%',
              style: textStyle ?? TextStyle(fontSize: 24.0),
            ),
            optionalWidget ?? Container()
          ],
        ),
      ),
    );
  }
}

class _CircularPercentageChartPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final double borderRadius;
  final TextStyle textStyle;

  _CircularPercentageChartPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
    this.borderRadius = 12,
    required this.textStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - strokeWidth;
    final progressAngle = 2 * pi * (progress / 100);

    // Rysuj tło
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Rysuj progres
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth * 2;
    final progressPath = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        progressAngle,
      );

    canvas.drawPath(progressPath, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
