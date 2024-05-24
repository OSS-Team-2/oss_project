import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';

class Bar extends PositionComponent with DragCallbacks{
  final Vector2 gridSize;
  Bar({required this.gridSize}) : super(size: Vector2(gridSize.x*2, gridSize.y /2));
  Paint paint = Paint()..color = Colors.green;
  
  @override
  void render(Canvas canvas) {
    canvas.drawRRect(getRRect(), paint);
  }
  
  RRect getRRect() {
    return RRect.fromRectAndRadius(size.toRect(), Radius.circular(gridSize.x * 0.1));
  }
  
  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    x += event.localDelta.x;
  }
}
