import 'package:brick_breaker/brick.dart';
import 'package:flame/camera.dart';
import 'dart:ui';
import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:brick_breaker/bar.dart';
import 'package:brick_breaker/ball.dart';
class BrickBreakerGame extends FlameGame{
  static double grid = 0.1;
  static late Vector2 gridSize;
  
  final World world = World();
  late   CameraComponent cameraComponent = CameraComponent(world: world)
  ..viewfinder.anchor = Anchor.topLeft;
  
    List<Brick> bricks = [];
  
  @override
  void onLoad() async{
    await Flame.device.setLandscapeLeftOnly();
    await Future.delayed(const Duration(seconds: 1)); 
  
    gridSize = Vector2(size.x * grid, size.y * grid);
  }

  
  @override
  void onMount() {
    populateBricks(4, 8);
    bar = Bar(gridSize: gridSize)..position = Vector2(size.x / 2 -  gridSize.x, size.y - gridSize.y);
    ball = Ball(gridSize: gridSize)..position = size / 2;
    world.addAll([bar, ball]);
    world.addAll(bricks);
    addAll([cameraComponent, world]);
  }
  
  @override
  void update(double dt) {
    super.update(dt);
  }
  
  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

  void populateBricks(int rows, int columns){
    Vector2 margin = Vector2(gridSize.x *0.2, gridSize.y *0.1);
    double totalWidth  = columns *(gridSize.x + margin.x) - margin.x;
    double firstPosX = (size.x - totalWidth)/2;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        bricks.add(Brick(gridSize: gridSize)
        ..position = Vector2(firstPosX + ((gridSize.x+margin.x)*j), margin.y + ((gridSize.y + margin.y)*i)));
      }
    }
  }
}
