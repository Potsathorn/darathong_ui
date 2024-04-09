import 'dart:math';

import 'package:flutter/material.dart';
import 'utils.dart';

class GoldenCircularProgress extends StatelessWidget {
  final double size;
  final int percentage;
  final Color backgroundColor;
  final double strokeWidth;
  final Color? progressColor;

  const GoldenCircularProgress({
    super.key,
    required this.size,
    required this.percentage,
    this.backgroundColor = PrimaryColors.grey,
    this.progressColor,
    this.strokeWidth = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircularPercentageProgressPainter(
          percentage: percentage,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          strokeWidth: strokeWidth,
        ),
        child: Center(
          child: Text(
            '$percentage%',
            style: TextStyle(
              color: PrimaryColors.primaryLight,
              fontSize: size * 0.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularPercentageProgressPainter extends CustomPainter {
  final int percentage;
  final Color backgroundColor;
  final Color? progressColor;
  final double strokeWidth;

  _CircularPercentageProgressPainter({
    required this.percentage,
    required this.backgroundColor,
    this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double arcAngle = 2 * pi * (percentage / 100);

    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint();

    if (progressColor == null) {
      progressPaint
        ..shader = PrimaryColors.gradientConvex
            .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
    } else {
      progressPaint
        ..color = progressColor!
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
    }

    canvas.drawCircle(
      Offset(radius, radius),
      radius - strokeWidth / 2,
      backgroundPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(radius, radius), radius: radius - strokeWidth / 2),
      -pi / 2,
      arcAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
