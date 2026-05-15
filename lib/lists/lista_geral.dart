import 'package:flutter/material.dart';

class ListaGeral extends StatelessWidget {
  final List<Map<String, dynamic>> geral;

  const ListaGeral({super.key, required this.geral});

  Widget cardMovimento({
    required String titulo,
    required String valor,
    required String data,
    required IconData icone,
    required String tipo,
  }) {
    bool isEntrada = tipo == "entrada";

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
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
                  isEntrada ? "+ R\$ $valor" : "- R\$ $valor",
                  style: TextStyle(
                    fontSize: 14,
                    color: isEntrada ? Colors.green : Colors.red,
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
    if (geral.isEmpty) {
      return const Center(
        child: Text(
          "Nenhuma movimentação cadastrada.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: geral.length,
      itemBuilder: (context, index) {
        final item = geral[index];

        return cardMovimento(
          titulo: item["titulo"],
          valor: item["valor"],
          data: item["data"],
          icone: item["icone"],
          tipo: item["tipo"], // "gasto" ou "entrada"
        );
      },
    );
  }
}