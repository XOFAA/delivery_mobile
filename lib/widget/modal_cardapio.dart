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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.90,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: StretchyHeader.singleChild(
            headerData: HeaderData(
                blurContent: false,
                header: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.90,
                      child: Image.network(
                          'https://api.gdelivery.app.br/files/$img'),
                    )),
                headerHeight: MediaQuery.of(context).size.height * 0.30),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Text(
                    titulo,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    subtitulo,
                    style: const TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    'R\$' + valor,
                    style: TextStyle(fontSize: 20, color: Colors.green[700]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const Row(
                    children: [Icon(Icons.info), Text('Alguma observação ?')],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "ex: Tirar cebola, acrescentar maionese."),
                    maxLength: 50,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                          const SizedBox(
                            width: 10,
                            child: Text('2'),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                        ],
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('adicionar'))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
