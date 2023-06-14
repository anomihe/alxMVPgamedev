import 'package:mvpgamedev/games/components/avater_componet.dart';
import 'package:mvpgamedev/games/components/background_components.dart';
import 'package:mvpgamedev/input/joystickcomponet.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame with HasDraggables {
  SpriteComponent forest = SpriteComponent();
  SpriteComponent props = SpriteComponent();
  SpriteComponent backgroung = SpriteComponent();
  final double characterSize = 200;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final screenWidth = size[0];
    final screenHeight = size[1];
    add(BackgroundComponent()
        // backgroung
        //   ..sprite = await loadSprite('Forest Cliff.png')
        //   ..size = size,
        );
    // forest
    //   ..sprite = await loadSprite('1.png')
    //   ..size = Vector2(characterSize, characterSize)
    //   //..y = 100;
    //   ..y = screenHeight - characterSize
    //   ..update(10);

    add(AvatarComponent(joystickComponent: joystickComponent));

    add(joystickComponent);
    props
      ..sprite = await loadSprite('Forest Props.png')
      ..size = Vector2(100, 100)
      //..x = 300;
      ..y = screenHeight - characterSize
      ..x = screenWidth - characterSize;
    add(props);

    // @override
    // void update(double dt) {
    //   super.update(dt);
    //   //props.x += 100 * dt;
    //   forest.y += 10 * dt;
    // }
  }
}
