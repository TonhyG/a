import 'package:flutter/material.dart';
import 'package:a/lists/gastos.dart';

class RelatoriosTela extends StatefulWidget {
  const RelatoriosTela({super.key});

  @override
  State<RelatoriosTela> createState() => _RelatoriosTelaState();
}

class _RelatoriosTelaState extends State<RelatoriosTela> {
  String filtroSelecionado = "Geral";

  List<Map<String, dynamic>> listaDeGastos = [];

  void abrirFiltro() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Filtrar Relatórios",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text("Geral"),
                onTap: () {
                  setState(() {
                    filtroSelecionado = "Geral";
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.money_off),
                title: const Text("Gastos"),
                onTap: () {
                  setState(() {
                    filtroSelecionado = "Gastos";
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text("Lucros"),
                onTap: () {
                  setState(() {
                    filtroSelecionado = "Lucros";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void adicionarGasto() {
    TextEditingController tituloController = TextEditingController();
    TextEditingController valorController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Adicionar Gasto"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: tituloController,
                decoration: const InputDecoration(labelText: "Nome do gasto"),
              ),
              TextField(
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Valor"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                if (tituloController.text.isNotEmpty &&
                    valorController.text.isNotEmpty) {
                  setState(() {
                    listaDeGastos.add({
                      "titulo": tituloController.text,
                      "valor": valorController.text,
                      "data":
                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                      "icone": Icons.money_off,
                    });
                  });

                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBCC6AB),
              ),
              child: const Text("Adicionar"),
            ),
          ],
        );
      },
    );
  }

  Widget buildTelaAtual() {
    if (filtroSelecionado == "Gastos") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Relatório: $filtroSelecionado",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton(
                  onPressed: adicionarGasto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBCC6AB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: ListaGastos(gastos: listaDeGastos),
          ),
        ],
      );
    }

    if (filtroSelecionado == "Lucros") {
      return const Center(
        child: Text(
          "Aqui vai aparecer o relatório de Lucros",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return const Center(
      child: Text(
        "Aqui vai aparecer o relatório Geral",
        style: TextStyle(fontSize: 16),
      ),
    );
  }

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
            buildTelaAtual(),

            // BOTÃO NO CANTO INFERIOR DIREITO (LOGO)
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: abrirFiltro,
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