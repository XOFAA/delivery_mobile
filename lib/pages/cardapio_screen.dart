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
        isLoading = false;
        cardapio = value;
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
                      Image.network(
                          'https://api.gdelivery.app.br/' + cardapio[index].img)
                    ],
                  ),
                  Text(cardapio[index].titulo),
                ],
              ));
            },
          );
  }
}
