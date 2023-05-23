import 'package:delivery/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.purple[500],
              title: Text('Sistema de Delivery'),
            ),
            body: Home()));
  }
}
