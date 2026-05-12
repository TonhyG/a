import 'package:flutter/material.dart';

class ListaGastos extends StatelessWidget {
  final List<Map<String, dynamic>> gastos;

  const ListaGastos({super.key, required this.gastos});

  Widget cardGasto(String titulo, String valor, String data, IconData icone) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE6E0F8),
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
                  "- R\$ $valor",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
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
    if (gastos.isEmpty) {
      return const Center(
        child: Text(
          "Nenhum gasto cadastrado.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: gastos.length,
      itemBuilder: (context, index) {
        final gasto = gastos[index];

        return cardGasto(
          gasto["titulo"],
          gasto["valor"],
          gasto["data"],
          gasto["icone"],
        );
      },
    );
  }
}