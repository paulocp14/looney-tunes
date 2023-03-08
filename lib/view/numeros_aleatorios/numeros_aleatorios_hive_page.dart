import 'dart:math';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  int? numeroGerado = 0;
  int? totaldeCliques = 0;
  late Box boxNumerosAleatorios;
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen("box_numeros_aleatorios")) {
      boxNumerosAleatorios = Hive.box("box_numeros_aleatorios");
    } else {
      boxNumerosAleatorios = await Hive.openBox("box_numeros_aleatorios");
    }
    numeroGerado = boxNumerosAleatorios.get("numeroGerado") ?? 0;
    totaldeCliques = boxNumerosAleatorios.get("totaldeCliques") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Hive")),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                totaldeCliques == null
                    ? "Total de Cliques"
                    : totaldeCliques.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                numeroGerado == null
                    ? "Numero Gerado"
                    : numeroGerado.toString(),
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(500);
              totaldeCliques = (totaldeCliques! + 1);
            });
            boxNumerosAleatorios.put("numeroGerado", numeroGerado);
            boxNumerosAleatorios.put("totaldeCliques", totaldeCliques);
          },
        ),
      ),
    );
  }
}
