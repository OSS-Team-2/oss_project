import 'dart:ui';

import 'package:brick_breaker/ball.dart';
import 'package:brick_breaker/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Brick  extends PositionComponent with HasGameRef<BrickBreakerGame>, CollisionCallbacks{
  late final Vector2 gridSize;

  Brick({required this.gridSize}) : super(size: gridSize);
  Paint paint = Paint()..color =  Color.fromARGB(255, 255, 88, 68);

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
    if (other is Ball) {
      game.score++;
      game.bricks.remove(this);
      game.world.remove(this);
    }
  }
}
