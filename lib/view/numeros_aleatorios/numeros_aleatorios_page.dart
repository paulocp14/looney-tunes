import 'dart:math';
import 'package:looney_tunes/services/app_storage_services.dart';
import 'package:flutter/material.dart';

class NumerosAleatoriosSharedPreferencesPage extends StatefulWidget {
  const NumerosAleatoriosSharedPreferencesPage({super.key});

  @override
  State<NumerosAleatoriosSharedPreferencesPage> createState() =>
      _NumerosAleatoriosSharedPreferencesPageState();
}

class _NumerosAleatoriosSharedPreferencesPageState
    extends State<NumerosAleatoriosSharedPreferencesPage> {
  int? numeroGerado = 0;
  int? totaldeCliques = 0;
  AppStorigeService storage = AppStorigeService();
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    numeroGerado = await storage.getNumeroAleatorio();
    totaldeCliques = await storage.getCliques();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Gerador de Numeros Aleatorios")),
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
            await storage.setNumeroAleatorio(numeroGerado!);
            await storage.setcliques(totaldeCliques!);
          },
        ),
      ),
    );
  }
}
