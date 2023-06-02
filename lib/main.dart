import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  SpriteComponent forest = SpriteComponent();
  SpriteComponent props = SpriteComponent();
  SpriteComponent backgroung = SpriteComponent();
  final double characterSize = 200;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final screenWidth = size[0];
    final screenHeight = size[1];
    add(
      backgroung
        ..sprite = await loadSprite('Forest Tilesett.png')
        ..size = size,
    );
    forest
      ..sprite = await loadSprite('Forest Cliff.png')
      ..size = Vector2(characterSize, characterSize)
      //..y = 100;
      ..y = screenHeight - characterSize;

    add(forest);
    props
      ..sprite = await loadSprite('Forest props.png')
      ..size = Vector2(100, 100)
      //..x = 300;
      ..y = screenHeight - characterSize
      ..x = screenWidth - characterSize;
    add(props);

    @override
    void update(double dt) {
      super.update(dt);
      props.x += 100 * dt;
      forest.y += 100 * dt;
    }
  }
}
