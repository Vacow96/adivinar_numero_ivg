import 'package:adivinar_numero_ivg/views/GameView.dart';
import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adivina el Número')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameView()),
            );
          },
          child: Text('Iniciar Juego'),
        ),
      ),
    );
  }
}