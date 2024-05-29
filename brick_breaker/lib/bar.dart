import 'dart:async';
import 'dart:ui';

import 'package:brick_breaker/bar.dart';
import 'package:brick_breaker/brick.dart';
import 'package:brick_breaker/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Ball extends PositionComponent with CollisionCallbacks, HasGameRef<BrickBreakerGame>{
  final  Vector2 gridSize;
  late final double radius;
  late final Vector2 velocity;

  Ball({required this.gridSize});
  //Configure Ball Color
  Paint paint = Paint()..color =  Color.fromARGB(218, 21, 6, 22);

  @override
  FutureOr<void> onLoad() {
    radius =  gridSize.x*0.1;
    velocity =  Vector2(0, gridSize.y * 5);
    add(CircleHitbox(radius: radius, anchor: Anchor.center));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position +=  velocity * dt;

    if(x + radius > game.size.x || x - radius <0){
      velocity.x = -velocity.x;
    }else if(y-radius <0){
      velocity.y= -velocity.y;
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawCircle(const Offset(0, 0), radius, paint);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(other is Bar || other is Brick){
      double otherMid = (other.x + (other.x + other.width)) /2;
      double collisionOffset = x - otherMid;
      
      velocity.x += collisionOffset;
      velocity.y = -velocity.y;
    }
  }
}
