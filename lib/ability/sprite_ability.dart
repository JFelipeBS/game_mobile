import 'package:bonfire/bonfire.dart';

class SpriteAbility {
  static Future<SpriteAnimation> _sequenceImage(String filename) {
    return SpriteAnimation.load(
      'abilities/$filename',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0)),
    );
  }

  static Future<SpriteAnimation> get left =>
      _sequenceImage("atack_effect_top.png");

  static Future<SpriteAnimation> get right =>
      _sequenceImage("atack_effect_top.png");

  static Future<SpriteAnimation> get up =>
      _sequenceImage("atack_effect_top.png");

  static Future<SpriteAnimation> get down =>
      _sequenceImage("atack_effect_bottom.png");
}
