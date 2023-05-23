import 'dart:convert';

import 'package:delivery/pages/models/cardapio_modal.dart';
import 'package:http/http.dart' as http;

class CardapioController {
  Future<List> getCardapio() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.gdelivery.app.br/cliente/cardapio'));
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> responseData = data['data'];
      print(responseData);
      return responseData
          .map((item) => CardapioModal(
              id: item['id'],
              valor: item['valor'],
              titulo: item['titulo'],
              subtitulo: item['subtitulo'],
              categoria: item['categoria'],
              img: item['img']))
          .toList();
    } catch (e) {
      print((e));
    }
    return [];
  }
}
