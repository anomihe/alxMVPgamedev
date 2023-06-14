import 'package:flame/components.dart';

enum MovementState {
  idle,
  up,
  slideLeft,
  slideRight,
}

class AvatarComponent extends SpriteGroupComponent<MovementState>
    with HasGameRef {
  final double _spriteHieght = 200;
  final double _speed = 50;

  late double _rightBound;
  late double _leftBound;
  late double _upBound;
  late double _downBound;
  JoystickComponent joystickComponent;

  AvatarComponent({required this.joystickComponent});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final Sprite movement = await gameRef.loadSprite('1.png');
    sprites = {
      MovementState.idle: movement,
      MovementState.slideLeft: movement,
      MovementState.slideRight: movement,
      MovementState.up: movement,
    };

    position = gameRef.size / 2;
    height = _spriteHieght;
    width = _spriteHieght * 1.42;
    anchor = Anchor.bottomCenter;
    //  size = gameRef.size;
    _rightBound = gameRef.size.x - 45;
    _leftBound = 0 + 45;
    _upBound = 0 + 55;
    _downBound = gameRef.size.y - 85;
    current = MovementState.idle;

    @override
    void update(double dt) {
      super.update(dt);
      if (joystickComponent.direction == JoystickDirection.idle) {
        current = MovementState.idle;
        return;
      }
      if (x >= _rightBound) {
        x = _rightBound - 1;
      }
      if (x <= _leftBound) {
        x = _rightBound - 1;
      }
      if (x <= _leftBound) {
        x = _leftBound + 1;
      }

      if (y >= _downBound) {
        y = _downBound - 1;
      }

      if (y <= _upBound) {
        y = _upBound + 1;
      }

      bool movingLeft = joystickComponent.relativeDelta[0] < 0;

      if (movingLeft) {
        current = MovementState.slideLeft;
      } else {
        current = MovementState.slideRight;
      }

      position.add(joystickComponent.relativeDelta * _speed * dt);
    }
  }
}
