import 'package:flame/components.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'dart:async';
import 'package:brick_breaker/bar.dart';
import 'package:brick_breaker/brick.dart';
import 'package:brick_breaker/game.dart';

class Ball extends PositionComponent with CollisionCallbacks, HasGameRef<BrickBreakerGame> {
  final Vector2 gridSize;
  late final double radius;
  late final Vector2 velocity;

  Ball({required this.gridSize}) : super(size: Vector2.all(gridSize.x * 0.2));

  Paint paint = Paint()..color = Colors.blue;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    radius = gridSize.x * 0.1;
    velocity = Vector2(0, gridSize.y * 5);
    add(CircleHitbox(radius: radius, anchor: Anchor.center));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (x + radius > gameRef.size.x || x - radius < 0) {
      velocity.x = -velocity.x;
    }
    if (y - radius < 0) {
      velocity.y = -velocity.y;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bar || other is Brick) {
      // calculate offset for changing velocity
      double otherMid = (other.x + (other.x + other.size.x)) / 2;
      double collisionOffset = x - otherMid;

      velocity.x += collisionOffset;
      velocity.y = -velocity.y;
    }
  }
}
