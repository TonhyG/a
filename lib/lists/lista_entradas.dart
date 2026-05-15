import 'package:flutter/material.dart';

class ListaEntradas extends StatelessWidget {
  final List<Map<String, dynamic>> entradas;

  const ListaEntradas({super.key, required this.entradas});

  Widget cardEntrada(String titulo, String valor, String data, IconData icone) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F8E6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icone, size: 28, color: Colors.black54),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "+ R\$ $valor",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Text(
            data,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (entradas.isEmpty) {
      return const Center(
        child: Text(
          "Nenhuma entrada cadastrada.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: entradas.length,
      itemBuilder: (context, index) {
        final entrada = entradas[index];

        return cardEntrada(
          entrada["titulo"],
          entrada["valor"],
          entrada["data"],
          entrada["icone"],
        );
      },
    );
  }
}