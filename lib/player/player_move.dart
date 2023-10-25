import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:jogo/ability/sprite_ability.dart';
import 'package:jogo/main.dart';
import 'package:jogo/player/sprite_player.dart';

class PlayerMove extends SimplePlayer with ObjectCollision {
  @override
  void joystickAction(JoystickActionEvent event) {
    if (hasGameRef && !gameRef.camera.isMoving) {
      if (event.event == ActionEvent.DOWN && event.id == 1) {
        simpleAttackMelee(
          damage: 10,
          size: Vector2(40, 40),
          animationRight: SpriteAbility.up,
          direction: lastDirection,
        );
      }
    }
  }

  @override
  void die() async {
    removeFromParent();
    final sprite = await SpritePlayer.die;
    gameRef.add(
      GameDecoration.withSprite(
        sprite: sprite.getSprite(),
        position: Vector2(
          position.x,
          position.y,
        ),
        size: Vector2.all(30),
      ),
    );
    super.die();
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 1,
      height: 2,
      align: const Offset(0, 0),
    );
    super.render(canvas);
  }

  PlayerMove()
      : super(
          position: Vector2(tileSize * 10, tileSize * 10),
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleRight: SpritePlayer.stopRight,
            idleLeft: SpritePlayer.stopLeft,
            runRight: SpritePlayer.runRight,
            runLeft: SpritePlayer.runLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 20),
            align: Vector2(8, 16),
          ),
        ],
      ),
    );
  }
}
