import 'package:flutter/material.dart';
import 'package:looney_tunes/view/login_page.dart';
import 'package:looney_tunes/view/numeros_aleatorios/numeros_aleatorios_hive_page.dart';

import '../../view/configuracoes/configuracoes_hive_page.dart';
import '../../view/dados_cadastrais.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text("Camera"),
                            leading: const Icon(Icons.camera),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text("Galeria"),
                            leading: const Icon(Icons.album),
                          )
                        ],
                      );
                    });
              },
              child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blue),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Image.network(
                        "https://static.wikia.nocookie.net/dublagempedia/images/d/d3/4352123-looney-tunes_k0.jpg/revision/latest/scale-to-width-down/1000?cb=20171129185424&path-prefix=pt-br"),
                  ),
                  accountName: const Text("Paulo Souza"),
                  accountEmail: const Text("email@email.com")),
            ),
            InkWell(
              child: const SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      Text("Dados Cadastrais"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DadosoCadastraisPage()));
              },
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              child: const Row(
                children: [
                  Icon(Icons.info),
                  Text("Termos de Uso e privacidade"),
                ],
              ),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: const Column(
                          children: [
                            Text(
                              "Termos e Privacidade",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: const Row(
                children: [
                  Icon(Icons.numbers),
                  Text("Gerador de Numero"),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (bc) => const NumerosAleatoriosHivePage()));
              },
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: const Row(
                children: [
                  Icon(Icons.inbox),
                  Text("Configurações"),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (bc) => const ConfiguracoesHivePage()));
              },
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  Text("Sair"),
                ],
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return AlertDialog(
                        alignment: Alignment.centerLeft,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: const Text(
                          "Meu App",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        content: const Wrap(
                          children: [
                            Text("Sair"),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Não")),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: const Text("sim")),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
