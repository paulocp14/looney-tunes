import 'package:flutter/material.dart';
import 'package:looney_tunes/shared/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  elevation: 8,
                  child: Image.asset(
                    AppImagens.paissagem1,
                    height: 100,
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Image.asset(
                    AppImagens.paissagem2,
                    height: 100,
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Image.asset(
                    AppImagens.paissagem3,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 3, child: Container()),
        ],
      ),
    );
  }
}
