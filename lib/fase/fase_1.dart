import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:jogo/enemy/enemy_move.dart';
import 'package:jogo/main.dart';
import 'package:jogo/player/player_move.dart';

class Fase1 extends StatefulWidget {
  const Fase1({super.key});

  @override
  State<Fase1> createState() => _MyAppState();
}

class _MyAppState extends State<Fase1> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.orange,
            margin: const EdgeInsets.all(40),
          ),
        ],
      ),
      map: WorldMapByTiled(
        'maps/map.json',
        forceTileSize: Vector2(32, 32),
      ),
      player: PlayerMove(),
      components: [
        EnemyMove(position: Vector2(tileSize * 1, tileSize * 1)),
      ],
    );
  }
}
