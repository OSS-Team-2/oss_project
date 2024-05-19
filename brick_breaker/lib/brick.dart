import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Brick extends PositionComponent {
  late final Vector2 gridSize;

  Brick({required this.gridSize}) : super(size: gridSize);
  
  Paint paint = Paint()..color = Colors.red;

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(getRRect(), paint);
  }

  RRect getRRect() {
    // Configure Rectangle Shape
    return RRect.fromRectAndRadius(size.toRect(),  Radius.circular(gridSize.x*0.1));
  }
}
