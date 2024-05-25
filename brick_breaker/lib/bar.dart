import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';

class Bar extends PositionComponent with DragCallbacks {
  final Vector2 gridSize;

  Bar({required this.gridSize})
      : super(size: Vector2(gridSize.x * 2, gridSize.y / 2));

  Paint paint = Paint()..color = Colors.green;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(getRRect(), paint);
  }

  RRect getRRect() {
    return RRect.fromRectAndRadius(size.toRect(), Radius.circular(gridSize.x * 0.1));
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.add(event.localDelta); 
  }
}
