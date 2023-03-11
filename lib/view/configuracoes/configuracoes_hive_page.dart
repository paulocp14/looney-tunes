import 'package:flutter/material.dart';
import 'package:looney_tunes/model/configuracoes_model.dart';
import 'package:looney_tunes/repositories/configuracoes_repository.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();
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
              configuracoesModel.receberNotificacoes = value;
            });
          },
          value: configuracoesModel.receberNotificacoes,
        ),
        SwitchListTile(
            title: const Text("Tema Escuro"),
            value: configuracoesModel.temaEscuro,
            onChanged: (bool value) {
              setState(() {
                configuracoesModel.temaEscuro = value;
              });
            }),
        TextButton(
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              try {
                configuracoesModel.altura = double.parse(alturaController.text);
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
              configuracoesModel.nomeUsuario = nomeUsuarioController.text;
              Navigator.pop(context);
              configuracoesRepository.salvar(configuracoesModel);
            },
            child: const Text("Salvar")),
      ]),
    ));
  }
}
