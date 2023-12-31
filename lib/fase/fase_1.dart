import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:jogo/enemy/enemy_move.dart';
import 'package:jogo/fase/score.dart';
import 'package:jogo/interface/player_interface.dart';
import 'package:jogo/main.dart';
import 'package:jogo/player/player_move.dart';

class Fase1 extends StatefulWidget {
  const Fase1({super.key});

  @override
  State<Fase1> createState() => _MyAppState();
}

class _MyAppState extends State<Fase1> implements GameListener {
  late GameController gameController;
  @override
  void initState() {
    gameController = GameController()..addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      gameController: gameController,
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
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) =>
            PlayerInterface(game: game),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1,
        smoothCameraEnabled: true,
      ),
      lightingColorGame: Colors.black.withOpacity(0.5),
      components: [
        EnemyMove(position: Vector2(tileSize * 10, tileSize * 20)),
      ],
    );
  }

  @override
  void changeCountLiveEnemies(int count) {
    if (gameController.player!.isDead) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Score(),
          ),
          (route) => false);
    }
  }

  @override
  void updateGame() {
    if (gameController.player!.isDead) {
      gameController.gameRef.pauseEngine();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Score(),
          ),
          (route) => false);
    }
  }
}
