import 'package:flutter/material.dart';
import 'package:a/segunda_tela.dart';

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFBCC6AB),
        child: Stack(
          children: [
            // IMAGEM DE FUNDO (marca d'água)
            Center(
              child: Opacity(
                opacity: 0.35, // mais visível
                child: Image.asset(
                  "assets/images/Logo.jpg",
                  width: 600, // imagem maior
                  filterQuality: FilterQuality.high, // melhora nitidez
                ),
              ),
            ),

            // CAMPOS E BOTÃO POR CIMA DA IMAGEM
            Center(
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Caixa Login
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Login",
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Caixa Senha
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Senha",
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Botão Concluir
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SegundaTela()),
                        );
                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "CONCLUIR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}