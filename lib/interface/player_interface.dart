import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:jogo/controller/enemy_generetor_controller.dart';
import 'dart:async' as async;

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';
  final BonfireGame game;
  const PlayerInterface({super.key, required this.game});

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  late async.Timer _zombieDie;
  int zombie = 0;
  @override
  void initState() {
    _zombieDie =
        async.Timer.periodic(const Duration(milliseconds: 100), _verify);
    super.initState();
  }

  @override
  void dispose() {
    _zombieDie.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Score: ${zombie.toString()}",
            style: TextStyle(
                color: Colors.red[900],
                fontSize: 30,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
        ),
      ],
    );
  }

  void _verify(async.Timer timer) {
    setState(() {
      final controller =
          BonfireInjector.instance.get<EnemyGeneratorCOntroller>();
      zombie = controller.score;
    });
  }
}
