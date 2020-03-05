import 'dart:ui';

import 'package:flutter/material.dart';

import '../pages/paint.dart';

class CanvasCustomPainter extends CustomPainter {
  List<DrawingArea> points;
  double strokeWidth;

  CanvasCustomPainter(this.points, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    for (var i = 0; i < points.length - 1; i++) {
      var currentPoint = points[i];

      if (currentPoint != null && points[i + 1] != null) {
        canvas.drawLine(
          currentPoint.point,
          points[i + 1].point,
          currentPoint.areaPaint,
        );
      } else if (currentPoint != null && points[i + 1] == null) {
        canvas.drawPoints(
          PointMode.points,
          [currentPoint.point],
          currentPoint.areaPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
