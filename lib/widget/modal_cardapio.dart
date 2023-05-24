import 'package:flutter/material.dart';
import 'package:stretchy_header/stretchy_header.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      child: StretchyHeader.singleChild(
          headerData: HeaderData(
              header: Image.network('https://api.gdelivery.app.br/files/$img'),
              headerHeight: MediaQuery.of(context).size.height * 0.30),
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: Text('teste'),
              ),
              SizedBox(
                height: 500,
                child: Text('teste'),
              )
            ],
          )),
    );
  }
}
