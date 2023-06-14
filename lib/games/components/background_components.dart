import 'package:flame/components.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('Forest Cliff.png');
    size = gameRef.size;
  }
}
