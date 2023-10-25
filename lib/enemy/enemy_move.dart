import 'package:bonfire/bonfire.dart';
import 'package:jogo/ability/sprite_ability.dart';
import 'package:jogo/controller/enemy_generetor_controller.dart';
import 'package:jogo/enemy/sprite_enemy.dart';
import 'package:jogo/main.dart';

class EnemyMove extends SimpleEnemy
    with ObjectCollision, UseStateController<EnemyGeneratorCOntroller> {
  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        simpleAttackMelee(
          damage: 10,
          size: Vector2(40, 40),
          animationRight: SpriteAbility.right,
          direction: lastDirection,
          withPush: true,
        );
      },
      radiusVision: tileSize * 15,
    );

    super.update(dt);
  }

  @override
  void die() {
    controller.returnMany();
    removeFromParent();
    super.die();
  }

  EnemyMove({
    required Vector2 position,
  }) : super(
            position: position,
            size: Vector2(32, 32),
            speed: 30,
            animation: SimpleDirectionAnimation(
              idleRight: SpriteEnemy.stopRight,
              runRight: SpriteEnemy.runRight,
              idleLeft: SpriteEnemy.stopLeft,
              runLeft: SpriteEnemy.runLeft,
            ),
            life: 30) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 20),
            align: Vector2(6, 15),
          ),
        ],
      ),
    );
  }
}
