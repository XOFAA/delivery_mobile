import 'package:delivery/pages/cardapio_screen.dart';

import 'package:delivery/widget/menu_bottom.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int index = 0;
  void selecionaIndex(value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: TabController(length: 3, vsync: this, initialIndex: index),
        children: const [
          CardapioScreen(),
          Center(
            child: Text('teste'),
          ),
          Center(
            child: Text('teste'),
          )
        ],
      ),
      bottomNavigationBar:
          MenuBottom(MudaIndex: selecionaIndex, indexAtual: index),
    );
  }
}
