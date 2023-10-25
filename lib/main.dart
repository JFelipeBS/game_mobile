import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:jogo/controller/enemy_generetor_controller.dart';
import 'package:jogo/menu.dart';

const double tileSize = 32;

void main() {
  BonfireInjector.instance.put((i) => EnemyGeneratorCOntroller());
  runApp(const MaterialApp(
    home: Menu(),
  ));
}
