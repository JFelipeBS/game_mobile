import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:jogo/controller/enemy_generetor_controller.dart';
import 'package:jogo/enemy/enemy_move.dart';
import 'package:jogo/player/player_move.dart';

const double tileSize = 32;

void main() {
  BonfireInjector.instance.put((i) => EnemyGeneratorCOntroller());
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      ),
      player: PlayerMove(),
      components: [
        EnemyMove(position: Vector2(tileSize * 1, tileSize * 1)),
      ],
    );
  }
}
