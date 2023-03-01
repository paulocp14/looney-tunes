import 'package:flutter/material.dart';
import 'package:looney_tunes/view/dados_cadastrais.dart';
import 'package:looney_tunes/view/pagina1.dart';
import 'package:looney_tunes/view/pagina2.dart';
import 'package:looney_tunes/view/pagina3.dart';
import 'package:looney_tunes/view/pagina4.dart';
import 'package:looney_tunes/view/pagina5.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Looney Tunes"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: const SizedBox(
                      width: double.infinity, child: Text("Dados Cadastrais")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DadosoCadastraisPage(
                                  texto: 'Dados Cadastrais',
                                  dados: ["Usuario", "Senha"],
                                )));
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: const Text("Termos de Uso"),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: const Text("Configurações"),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  Pagina1(),
                  Pagina2(),
                  Pagina3(),
                  Pagina4(),
                  Pagina5(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(
                    label: "Perna Longa", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Piu Piu", icon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: "Patolino", icon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: "Frajola", icon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: "Eustacio", icon: Icon(Icons.person)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
