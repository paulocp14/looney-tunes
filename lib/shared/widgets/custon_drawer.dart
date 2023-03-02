import 'package:flutter/material.dart';

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
            UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Image.network(
                      "https://static.wikia.nocookie.net/dublagempedia/images/d/d3/4352123-looney-tunes_k0.jpg/revision/latest/scale-to-width-down/1000?cb=20171129185424&path-prefix=pt-br"),
                ),
                accountName: const Text("Paulo Souza"),
                accountEmail: const Text("email@email.com")),
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
              onTap: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              child: const Row(
                children: [
                  Icon(Icons.inbox),
                  Text("Configurações"),
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
