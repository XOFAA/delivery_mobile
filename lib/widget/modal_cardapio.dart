import 'package:flutter/material.dart';

class ModalCardapio extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String valor;
  final String img;
  const ModalCardapio(
      {super.key,
      required this.titulo,
      required this.subtitulo,
      required this.valor,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.95,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Image.network('https://api.gdelivery.app.br/files/' + img,
                fit: BoxFit.contain),
          )
        ],
      ),
    );
  }
}
