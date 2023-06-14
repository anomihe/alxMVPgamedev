import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mvpgamedev/screens/main_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Longer')),
        body: Container(
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.green, Colors.greenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/image002.jpg',
                  height: 100,
                  fit: BoxFit.cover,
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GameWidget(game: MyGame())));
                  },
                  icon: const Icon(Icons.games),
                  label: const Text(
                    'Start Playing',
                  ),
                )
              ],
            )),
      ),
    );
  }
}
