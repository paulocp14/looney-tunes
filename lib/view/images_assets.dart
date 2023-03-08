import 'package:flutter/material.dart';
import 'package:looney_tunes/shared/app_images.dart';

class ImagesAssetsPage extends StatefulWidget {
  const ImagesAssetsPage({super.key});

  @override
  State<ImagesAssetsPage> createState() => _Pagina1State();
}

class _Pagina1State extends State<ImagesAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImagens.user1,
          height: 50,
        ),
        Image.asset(
          AppImagens.user2,
          height: 50,
        ),
        Image.asset(
          AppImagens.user3,
          height: 50,
        ),
        Image.asset(
          AppImagens.paissagem1,
          height: 50,
        ),
        Image.asset(
          AppImagens.paissagem2,
          height: 50,
        ),
        Image.asset(
          AppImagens.paissagem3,
          height: 50,
        ),
      ],
    );
  }
}
