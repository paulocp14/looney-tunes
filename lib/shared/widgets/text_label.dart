import 'package:flutter/material.dart';

class TextLable extends StatelessWidget {
  final String texto;
  const TextLable({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(texto,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
    );
  }
}
