import 'package:bonfire/bonfire.dart';

class SpritePlayer {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName, {
    int amount = 6,
  }) {
    return SpriteAnimation.load(
      'player/$fileName',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get stopLeft =>
      _sequenceImage("knight_idle_left.png");

  static Future<SpriteAnimation> get stopRight =>
      _sequenceImage("knight_idle_right.png");

  static Future<SpriteAnimation> get die => _sequenceImage(
        "knight_die.png",
      );

  static Future<SpriteAnimation> get runLeft =>
      _sequenceImage("knight_run_left.png");

  static Future<SpriteAnimation> get runRight =>
      _sequenceImage("knight_run_right.png");
}
