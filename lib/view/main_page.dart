import 'package:flutter/material.dart';
import 'package:looney_tunes/shared/widgets/custon_drawer.dart';
import 'package:looney_tunes/view/pagina1.dart';
import 'package:looney_tunes/view/pagina2.dart';
import 'package:looney_tunes/view/pagina3.dart';

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
        drawer: const CustonDrawer(),
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
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Adicionar", icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: "Menu", icon: Icon(Icons.person)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
