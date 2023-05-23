import 'package:delivery/pages/controllers/cardapio_controller.dart';
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
              return Card(
                  child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.height * 0.15,
                          child: Image.network(
                            'https://api.gdelivery.app.br/files/' +
                                cardapio[index].img,
                            fit: BoxFit.contain,
                          ))
                    ],
                  ),
                  Text(cardapio[index].titulo),
                ],
              ));
            },
          );
  }
}
