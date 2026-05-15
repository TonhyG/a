import 'package:flutter/material.dart';
import 'package:a/lists/lista_gastos.dart';
import 'package:a/lists/lista_entradas.dart';
import 'package:a/lists/lista_geral.dart';

class RelatoriosTela extends StatefulWidget {
  const RelatoriosTela({super.key});

  @override
  State<RelatoriosTela> createState() => _RelatoriosTelaState();
}

class _RelatoriosTelaState extends State<RelatoriosTela> {
  String filtroSelecionado = "Geral";

  List<Map<String, dynamic>> listaGastos = [];
  List<Map<String, dynamic>> listaEntradas = [];

  List<Map<String, dynamic>> get listaGeral {
    return [...listaGastos, ...listaEntradas];
  }

  @override
  void initState() {
    super.initState();
    carregarDadosSalvos();
  }

  void carregarDadosSalvos() {
    setState(() {
      listaGastos = [
        {
          "titulo": "Mercado",
          "valor": "50,00",
          "data": "14/05/2026",
          "icone": Icons.shopping_cart,
          "tipo": "gasto",
        },
        {
          "titulo": "Lanche",
          "valor": "20,00",
          "data": "15/05/2026",
          "icone": Icons.fastfood,
          "tipo": "gasto",
        },
      ];

      listaEntradas = [
        {
          "titulo": "Salário",
          "valor": "2500,00",
          "data": "10/05/2026",
          "icone": Icons.attach_money,
          "tipo": "entrada",
        },
      ];
    });
  }

  void adicionarGasto() {
    setState(() {
      listaGastos.add({
        "titulo": "Novo Gasto",
        "valor": "10,00",
        "data": "15/05/2026",
        "icone": Icons.money_off,
        "tipo": "gasto",
      });
    });
  }

  void adicionarEntrada() {
    setState(() {
      listaEntradas.add({
        "titulo": "Nova Entrada",
        "valor": "100,00",
        "data": "15/05/2026",
        "icone": Icons.attach_money,
        "tipo": "entrada",
      });
    });
  }

  Widget buildLista() {
    Widget content;

    if (filtroSelecionado == "Gastos") {
      content = ListaGastos(gastos: listaGastos);
    } else if (filtroSelecionado == "Entradas") {
      content = ListaEntradas(entradas: listaEntradas);
    } else {
      content = ListaGeral(geral: listaGeral);
    }

    // 🔥 AQUI está o ajuste principal: espaçamento superior
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: content,
    );
  }

  void abrirFiltro() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Geral"),
                onTap: () {
                  setState(() => filtroSelecionado = "Geral");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Gastos"),
                onTap: () {
                  setState(() => filtroSelecionado = "Gastos");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Entradas"),
                onTap: () {
                  setState(() => filtroSelecionado = "Entradas");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void abrirAdicionar() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.remove_circle, color: Colors.red),
                title: const Text("Adicionar Gasto"),
                onTap: () {
                  adicionarGasto();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_circle, color: Colors.green),
                title: const Text("Adicionar Entrada"),
                onTap: () {
                  adicionarEntrada();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC7D0B8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Relatórios",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: abrirFiltro,
          ),
        ],
      ),

      body: buildLista(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFC7D0B8),
        elevation: 4,
        onPressed: abrirAdicionar,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}