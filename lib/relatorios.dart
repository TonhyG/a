import 'package:flutter/material.dart';

class RelatoriosTela extends StatelessWidget {
  const RelatoriosTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Relatórios"),
        backgroundColor: const Color(0xFFBCC6AB),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          children: [
            // BOTÃO NO CANTO INFERIOR DIREITO (LOGO)
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  print("Botão da Logo clicado!");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 70,
                    height: 70,
                    color: Colors.white,
                    child: Image.asset(
                      "assets/images/Logo.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}