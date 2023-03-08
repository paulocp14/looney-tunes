import 'package:flutter/material.dart';
import 'package:looney_tunes/services/app_storage_services.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  AppStorigeService storage = AppStorigeService();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getDadosCadastraisNomeUsuario();
    alturaController.text =
        (await (storage.getDadosCadastraisChaveAltura("").toString()));
    receberNotificacoes = await storage.getDadosCadstraisNotificacoes();
    temaEscuro = await storage.getDadosCadstraisTema();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Configurações Hive")),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: const InputDecoration(hintText: "Usuario :"),
            controller: nomeUsuarioController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Altura :"),
            controller: alturaController,
          ),
        ),
        SwitchListTile(
          title: const Text("Receber Notificações"),
          onChanged: (bool value) {
            setState(() {
              receberNotificacoes = !receberNotificacoes;
            });
          },
          value: receberNotificacoes,
        ),
        SwitchListTile(
            title: const Text("Tema Escuro"),
            value: temaEscuro,
            onChanged: (bool value) {
              setState(() {
                temaEscuro = value;
              });
            }),
        TextButton(
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              try {
                await storage.setDadosCadastraisChaveAltura(
                    double.parse(alturaController.text));
              } catch (e) {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text("Meu App"),
                        content:
                            const Text("Por favor informar uma altura válida!"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Ok"))
                        ],
                      );
                    });
                return;
              }
              await storage
                  .setDadosCadastraisNomeUsuario(nomeUsuarioController.text);
              await storage.setDadosCadstraisNotificacoes(receberNotificacoes);
              await storage.setDadosCadstraisTema(temaEscuro);
              Navigator.pop(context);
            },
            child: const Text("Salvar")),
      ]),
    ));
  }
}
