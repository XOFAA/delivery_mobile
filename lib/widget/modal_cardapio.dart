import 'package:flutter/material.dart';

class ModalCardapio extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final String valor;
  final String img;

  const ModalCardapio({
    Key? key,
    required this.titulo,
    required this.subtitulo,
    required this.valor,
    required this.img,
  }) : super(key: key);

  @override
  State<ModalCardapio> createState() => _ModalCardapioState();
}

class _ModalCardapioState extends State<ModalCardapio> {
  bool isKeyboard = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_drop_down_circle_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://api.gdelivery.app.br/files/${widget.img}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                            ),
                            Text(
                              widget.titulo,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              widget.subtitulo,
                              style: const TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'R\$' + widget.valor,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.green[700]),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const Row(
                              children: [
                                Icon(Icons.info),
                                Text('Alguma observação ?')
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:
                                    "ex: Tirar cebola, acrescentar maionese.",
                              ),
                              maxLength: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: !isKeyboard,
              child: Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove),
                          ),
                          const SizedBox(
                            width: 10,
                            child: Text('2'),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('adicionar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
