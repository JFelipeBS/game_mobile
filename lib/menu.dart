import 'package:flutter/material.dart';
import 'package:jogo/fase/fase_1.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _menuState();
}

class _menuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/menu/menu.png"),
            fit: BoxFit.contain),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: SizedBox(
          width: 150,
          height: 55,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red[900]),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Fase1(),
                  ));
            },
            child: const Text(
              "Jogar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
