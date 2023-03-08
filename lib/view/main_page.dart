import 'package:flutter/material.dart';
import 'package:looney_tunes/shared/widgets/custon_drawer.dart';
import 'package:looney_tunes/view/images_assets.dart';
import 'package:looney_tunes/view/list_view.dart';
import 'package:looney_tunes/view/list_view_horizantal.dart';

import 'card_page.dart';
import 'nova_tarefa_page.dart';

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
                  CardPage(),
                  ImagesAssetsPage(),
                  ListViewPage(),
                  ListViewHorizontal(),
                  TarefaPage(),
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
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
                BottomNavigationBarItem(
                    label: "Page4", icon: Icon(Icons.image)),
                BottomNavigationBarItem(label: "Page5", icon: Icon(Icons.list)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
