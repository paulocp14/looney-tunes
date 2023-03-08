import 'package:flutter/material.dart';
import 'package:looney_tunes/repositories/nivel_repository.dart';
import 'package:looney_tunes/services/app_storage_services.dart';
import '../repositories/linguagens_repository.dart';
import '../shared/widgets/text_label.dart';

class DadosoCadastraisPage extends StatefulWidget {
  const DadosoCadastraisPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DadosoCadastraisPage> createState() => _DadosoCadastraisPageState();
}

class _DadosoCadastraisPageState extends State<DadosoCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  List<String> linguagensSelecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int anosdeExperiencia = 0;

  AppStorigeService storage = AppStorigeService();

  final String CHAVE_DADOS_CADASTRAIS_NOME = "CHAVE_DADOS_CADASTRAIS_NOME";

  final String CHAVE_DADOS_CADASTRAIS_DATA_NASCIMNETO =
      "CHAVE_DADOS_CADASTRAIS_DATA_NASCIMNETO";
  final String CHAVE_DADOS_CADASTRAIS_EXPERIENCIA =
      "CHAVE_DADOS_CADASTRAIS_EXPERIENCIA";
  final String CHAVE_DADOS_CADASTRAIS_LINGUAGEM =
      "CHAVE_DADOS_CADASTRAIS_LINGUAGEM";
  final String CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA =
      "CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA";
  final String CHAVE_DADOS_CADASTRAIS_SALARIO =
      "CHAVE_DADOS_CADASTRAIS_SALARIO";

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeController.text = await storage.getDadosCadastraisNome();
    dataNascimentoController.text =
        await storage.getDadosCadstraisDataNascimento(
            CHAVE_DADOS_CADASTRAIS_DATA_NASCIMNETO);
    if (dataNascimentoController.text.isNotEmpty) {
      dataNascimento = DateTime.parse(dataNascimentoController.text);
    }
    nivelSelecionado = await storage.getDadosCadstraisDataNivelExperiencia(
        CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA);
    linguagensSelecionadas = await storage.getDadosCadstraisLinguagens();
    anosdeExperiencia = await storage.getDadosCadstraisTempoexperiencia();
    salarioEscolhido = await storage.getDadosCadstraisSalario();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados Cadastrais"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLable(texto: "Nome :"),
                  TextField(
                    controller: nomeController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextLable(texto: "Data de Nascimentos :"),
                  TextField(
                      controller: dataNascimentoController,
                      readOnly: true,
                      onTap: () async {
                        var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2023, 10, 23),
                        );
                        if (data != null) {
                          dataNascimentoController.text = data.toString();
                          dataNascimento = data;
                        }
                      }),
                  const TextLable(texto: "Nivel de Experiencia :"),
                  Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              dense: true,
                              title: Text(nivel.toString()),
                              selected: nivelSelecionado == nivel,
                              value: nivel.toString(),
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              }))
                          .toList()),
                  const TextLable(texto: "Linguagens"),
                  Column(
                    children: linguagens
                        .map((linguagens) => CheckboxListTile(
                            dense: true,
                            title: Text(linguagens),
                            value: linguagensSelecionadas.contains(linguagens),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  linguagensSelecionadas.add(linguagens);
                                });
                              } else {
                                setState(() {
                                  linguagensSelecionadas.remove(linguagens);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  const TextLable(texto: "Tempo de Experiencia"),
                  DropdownButton(
                      value: anosdeExperiencia,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(
                          child: Text("1"),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                          value: 2,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          anosdeExperiencia = int.parse(value.toString());
                        });
                      }),
                  TextLable(
                      texto:
                          "Prenteção Salarial. R\$ ${salarioEscolhido.round().toString()}"),
                  Slider(
                      max: 10000,
                      min: 0,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                      }),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        salvando = false;
                      });
                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O Nome deve ser Preenchido")));
                        return;
                      }
                      if (dataNascimento == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Data de Nascimento invalida")));
                        return;
                      }
                      if (nivelSelecionado.trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Nivel deve ser selecionado")));
                        return;
                      }
                      if (linguagensSelecionadas.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Minimo de um ano de experiencia")));
                        return;
                      }
                      if (anosdeExperiencia == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("A linguagem deve ser selecionada")));
                        return;
                      }
                      if (salarioEscolhido == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Prentenção salarial")));
                        return;
                      }

                      await storage.setDadosCadastraisNome(nomeController.text);
                      await storage.setDadosCadstraisDataNascimento(
                          dataNascimento.toString());
                      await storage.setDadosCadstraisDataNivelExperiencia(
                          nivelSelecionado);
                      await storage
                          .setDadosCadstraisLinguagens(linguagensSelecionadas);
                      await storage
                          .setDadosCadstraisTempoexperiencia(anosdeExperiencia);
                      await storage.setDadosCadstraisSalario(salarioEscolhido);

                      setState(() {
                        salvando = true;
                      });

                      Future.delayed(const Duration(seconds: 3), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Dados Salvos com Sucesso")));
                        setState(() {
                          salvando = false;
                        });
                        Navigator.pop(context);
                      });
                    },
                    child: const Text("Salvar"),
                  ),
                ],
              ),
      ),
    );
  }
}
