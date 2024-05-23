import 'dart:ui';
import 'package:flame/components.dart';

class Bar extends PositionComponent{
  final Vector2 gridSize;
  Bar({required this.gridSize}) : super(size: Vector2(gridSize.x*2, gridSize.y /2));

  @override
  void render(Canvas, canvas) {
  canvas.drawRRect(getRRect, paint);
  }
}
