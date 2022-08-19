import 'dart:ui' as UI;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  UI.Image image;
  List<Rect> rects;
  Painter(this.rects, this.image);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.yellow;

    canvas.drawImage(image, Offset(0, 0), paint);

    rects.forEach((rect) {
      canvas.drawRect(rect, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
