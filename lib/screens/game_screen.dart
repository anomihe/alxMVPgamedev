import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mvpgamedev/screens/main_screen.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: MyGame(),
      ),
    );
  }
}
