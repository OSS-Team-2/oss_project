import 'dart:ui';

import 'package:brick_breaker/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Brick  extends PositionComponent with HasGameRef<BrickBreakerGame>, CollisionCallbacks{
  late final Vector2 gridSize;

  Brick({required this.gridSize}) : super(size: gridSize);

  Paint paint = Paint()..color = Colors.red;

  @override
  void onLoad() {
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(getRRect(), paint);
  }

  RRect getRRect() {
 
    return RRect.fromRectAndRadius(size.toRect(),  Radius.circular(gridSize.x*0.1));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    game.bricks.remove(this);
    game.world.remove(this);
  }
}
