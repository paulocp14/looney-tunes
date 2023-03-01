import 'package:flutter/material.dart';

class DadosoCadastraisPage extends StatelessWidget {
  final String texto;
  final List<String> dados;
  const DadosoCadastraisPage(
      {Key? key, required this.texto, required this.dados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados Cadastrais"),
      ),
      body: const Center(child: Text("Dados Cadastrais")),
    );
  }
}
