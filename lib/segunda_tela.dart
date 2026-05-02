import 'package:a/Relatorios.dart' show RelatoriosTela;
import 'package:flutter/material.dart';
import 'estoque.dart';

class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Tela"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        color: const Color(0xFFBCC6AB),
        child: Stack(
          children: [
            // IMAGEM DE FUNDO (marca d'água)
            Center(
              child: Opacity(
                opacity: 0.35,
                child: Image.asset(
                  "assets/images/Logo.jpg",
                  width: 350,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),

            // BOTÕES POR CIMA DA IMAGEM
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // BOTÃO ESTOQUE
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(200, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EstoqueTela(),
                        ),
                      );
                    },
                    child: const Text("Estoque"),
                  ),

                  const SizedBox(height: 15),

                  // BOTÃO RELATÓRIOS
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(200, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RelatoriosTela(),
                        ),
                      );
                    },
                    child: const Text("Relatórios"),
                  ),

                  const SizedBox(height: 15),

                  // BOTÃO DASHBOARD
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(200, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      print("Acessando Dashboard");
                    },
                    child: const Text("Dashboard"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}