import 'package:flutter/material.dart';
import 'package:looney_tunes/view/card_detail.dart';
import '../model/card_detail.dart';
import '../repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;

  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null
              ? const LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailPage(
                                  cardDetail: cardDetail!,
                                )));
                  },
                  child: Hero(
                    tag: cardDetail!.id,
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  cardDetail!.url,
                                  height: 20,
                                ),
                                Text(
                                  cardDetail!.title,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(cardDetail!.text,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal)),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text("Ler Mais",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
