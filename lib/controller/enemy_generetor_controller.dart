import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:jogo/enemy/enemy_move.dart';
import 'package:jogo/main.dart';

class EnemyGeneratorCOntroller extends StateController<EnemyMove> {
  final _position = [
    Vector2(tileSize * 4, tileSize * 4),
    Vector2(tileSize * 16, tileSize * 4),
    Vector2(tileSize * 4, tileSize * 16),
    Vector2(tileSize * 16, tileSize * 16),
  ];

  final _quantityRespawns = 2;

  void _return(Vector2 position) {
    final hasGameRef = component?.hasGameRef ?? false;
    if (hasGameRef && !gameRef.camera.isMoving) {
      final goblin = EnemyMove(position: position);
      gameRef.add(goblin);
    }
  }

  void returnMany() {
    final random = Random();
    final positions = List<Vector2>.from(_position);
    int numberOfRespawn = _quantityRespawns;

    while (numberOfRespawn > 0) {
      final indexPosition = random.nextInt(positions.length);
      final position = positions[indexPosition];
      _return(position);
      positions.remove(position);
      numberOfRespawn -= 1;
    }
  }

  @override
  void update(double dt, EnemyMove component) {}
}
