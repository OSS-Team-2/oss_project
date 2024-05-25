import 'package:flame/components.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';

class Ball extends PositionComponent with CollisionCallbacks {
  final  Vector2 gridSize;
  late final double radius;
  late final Vector2 velocity;

  Ball({required this.gridSize});

  Paint paint = Paint()..color =  Colors.blue;
  
  @override
  void onLoad() {
    radius =  gridSize.x*0.1;
    velocity =  Vector2(0, gridSize.y * 5);
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }
    
  @override
  void render(Canvas canvas) {
    canvas.drawCircle(const Offset(0, 0), radius, paint);
  }
  
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
  }
}
