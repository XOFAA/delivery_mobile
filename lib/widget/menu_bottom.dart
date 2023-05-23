import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  int indexAtual = 0;
  Function(int) MudaIndex;
  MenuBottom({super.key, required this.MudaIndex, required this.indexAtual});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexAtual,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_edu), label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Carrinho')
        ],
        onTap: (value) => MudaIndex(value));
  }
}
