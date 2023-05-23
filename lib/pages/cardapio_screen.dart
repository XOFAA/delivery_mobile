import 'package:delivery/pages/controllers/cardapio_controller.dart';

import 'package:delivery/widget/modal_cardapio.dart';
import 'package:flutter/material.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  List cardapio = [];
  bool isLoading = true;

  @override
  void initState() {
    CardapioController().getCardapio().then((value) {
      setState(() {
        cardapio = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: cardapio.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return ModalCardapio(
                            titulo: cardapio[index].titulo,
                            subtitulo: cardapio[index].subtitulo,
                            valor: cardapio[index].valor,
                            img: cardapio[index].img);
                      });
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cardapio[index].titulo,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  cardapio[index].subtitulo,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                'R\$' + cardapio[index].valor,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green[700]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.30,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Image.network(
                                // ignore: prefer_interpolation_to_compose_strings
                                'https://api.gdelivery.app.br/files/' +
                                    cardapio[index].img),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
