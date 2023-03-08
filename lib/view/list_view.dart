import 'package:flutter/material.dart';
import 'package:looney_tunes/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImagens.user2),
          title: const Text("Usuario 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello"),
              Text("08:08"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              if (menu == "opção 2") {}
            },
            itemBuilder: (BuildContext bc) {
              return const <PopupMenuEntry<String>>[
                PopupMenuItem<String>(value: "opçao 1", child: Text("Opçao 1")),
                PopupMenuItem<String>(value: "opçao 2", child: Text("Opçao 2")),
                PopupMenuItem<String>(value: "opçao 3", child: Text("Opçao 3")),
              ];
            },
          ),
        ),
        Image.asset(AppImagens.user1),
        Image.asset(AppImagens.user2),
        Image.asset(AppImagens.user3),
        Image.asset(AppImagens.paissagem1),
        Image.asset(AppImagens.paissagem2),
        Image.asset(AppImagens.paissagem3),
      ],
    );
  }
}
