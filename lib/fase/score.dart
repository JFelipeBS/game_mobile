import 'package:bonfire/state_manager/bonfire_injector.dart';
import 'package:flutter/material.dart';
import 'package:jogo/controller/enemy_generetor_controller.dart';
import 'package:jogo/menu.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BonfireInjector.instance.get<EnemyGeneratorCOntroller>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Você Morreu",
                style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 100,
                child: Image(
                    image: AssetImage("assets/images/menu/tumulo.png"),
                    fit: BoxFit.scaleDown),
              ),
              const SizedBox(height: 50),
              Text(
                "Sua Pontuação foi de ${controller.score} zumbis mortos",
                style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green[900])),
                    onPressed: () {
                      controller.score = 0;
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Menu(),
                          ),
                          (route) => true);
                    },
                    child: const Text("Jogar Novamente")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
